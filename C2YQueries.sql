USE c2yproject2;

-- a	What is the total value, grouped by type, for all donations in October 2022? Include a grand total also.
SELECT donorType, SUM(totalDonationValue) AS typeValue
FROM donation
WHERE donationDate BETWEEN '2022-10-01' AND '2022-10-31'
GROUP BY donorType WITH ROLLUP
ORDER BY typeValue DESC;

-- b	Who is the best donor in terms of donation amounts?
SELECT donor_FName, donor_LName, SUM(totalDonationValue) AS donorTotalValue
FROM donation d
JOIN donor
	ON d.donor_donorID = donor.donorID
GROUP BY donor_FName, donor_LName
ORDER BY donorTotalValue DESC;

-- c	Provide a list of all delivered donations for the month of October 2022.
SELECT d.donationID, donationDate, deliveryDate
FROM donation d 
INNER JOIN delivery del
	ON del.donation_donationID = d.donationID
WHERE donationDate BETWEEN '2022-10-01' AND '2022-10-31'
ORDER BY donationID;

-- d.     List the donor names based on donation level (e.g., gold, silver, etc.) for November 2022 in order for the webmaster to place the information on the website.
SELECT donor_FName, donor_LName, donationLevel, donationDate
FROM donation d
JOIN donor
	ON d.donor_donorID = donor.donorID
WHERE donationDate BETWEEN '2022-11-01' AND '2022-11-30'
ORDER BY donationDate ASC;

-- e.     List the recipients by team and by day. 
SELECT d.recipient_recipientID, r.recipient_FName, r.recipient_LName, team, deliveryDate
FROM delivery d
JOIN recipient r
	ON d.recipient_recipientID = r.recipientID
ORDER by team, deliveryDate ASC;

-- f.      Create a weekly team report and include data about which teams made what deliveries to what recipients.
-- For this report I use deliveries that are in the same week as the current week. Thus this may not return values if
-- tested later in December.
SELECT team, d.recipient_recipientID, r.recipient_FName, r.recipient_LName, deliveryDate
FROM delivery d
JOIN recipient r
	ON d.recipient_recipientID = r.recipientID
WHERE WEEK(deliveryDate) = WEEK(CURDATE())
ORDER BY team, r.recipient_FName, r.recipient_LName, deliveryDate ASC;

-- g.     Create an Active Volunteer list.
SELECT *
FROM volunteer
WHERE volunteerStatus LIKE 'active'
ORDER BY team;

-- h1.  Which 3 recipients recieved the least amount in one single delivery (but recieved at least one delivery)
-- This program joins recipient to delivery, finds the min delivery value for each recipient, and returns the three smallest
-- The program uses an inner join to return only recipients with an associated value
SELECT recipient_FName, recipient_LName, MIN(totalDeliveryValue) AS minDeliveryValue
FROM delivery d
INNER JOIN recipient r
	ON d.recipient_recipientID = r.recipientID
GROUP BY recipientID
ORDER BY minDeliveryValue ASC
LIMIT 3;

-- h2.  Return donors with a higher culmulative total donation value than the average culmulative total donation value 
SELECT donor_FName, donor_LName, don.cumulativeDonationValue
FROM (
	SELECT donor_donorID, SUM(totalDonationValue) AS cumulativeDonationValue
    FROM donation
    GROUP BY donor_donorID) don
JOIN donor
	ON don.donor_donorID = donor.donorID
WHERE don.cumulativeDonationValue > (
		SELECT AVG(totalDonationValue) AS avgDonationValue
		FROM donation)
ORDER BY cumulativeDonationValue DESC;

-- h2.  return donors that have made donations that are higher than the average total donation value.
SELECT DISTINCT donor_FName, donor_LName
FROM donation don
JOIN donor
	ON don.donor_donorID = donor.donorID
WHERE totalDonationValue > (
		SELECT AVG(totalDonationValue) AS avgDonationValue
		FROM donation);





-- 14.1  View of volunteers ranked by their total amount of volunteer hours for the past month
-- for the purpose of this view, we used "MONTH(CURDATE()) - 1" as there are no deliveries in December
CREATE VIEW view_VolunteerHoursTotal AS
SELECT volunteer_FName, volunteer_LName, SUM(volunteerHours) AS totalHours
FROM volunteer v
JOIN delivery d
	ON d.volunteer_volunteerID = v.volunteerID
WHERE MONTH(d.deliveryDate) = MONTH(CURDATE()) - 1
GROUP BY volunteer_FName, volunteer_LName
ORDER BY totalHours DESC;

-- 14.2  View of average delivered amount for each recipient
CREATE VIEW view_RecipientDeliveryAVG AS
SELECT recipient_FName, recipient_LName, AVG(totalDeliveryValue) AS recipientDeliveryValue
FROM recipient r
JOIN delivery d
	ON d.recipient_recipientID = r.recipientID
JOIN donation don
	ON d.donation_donationID = don.donationID
GROUP BY recipient_FName, recipient_LName
ORDER BY recipientDeliveryValue DESC;

-- 15.	Create a stored procedure, using a cursor, to produces the email mailing list of all donors. Preface the name of it with sp_.
SET @emails = "";
CALL sp_CreateEmailList(@emails);
SELECT @emails;

-- 16.	Create a function for this project of your choosing. It should only return one value.
-- Function where a user inputs a donor phone number and the program returns the donorID
SELECT donor_phone_number('816.444.8792');

-- Triggers to capitalize donor names as they are inputed
create trigger tr_C2Y_donor_FNameInCaps
before insert on C2Yproject2.Donor
for each row
set new.donor_FName = upper(new.donor_FName);

create trigger tr_C2Y_donor_LNameInCaps
before insert on C2Yproject2.Donor
for each row
set new.donor_LName = upper(new.donor_LName);





