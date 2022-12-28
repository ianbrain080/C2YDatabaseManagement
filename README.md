# C2YDatabaseManagement

## Use Case:

Crew to You, LLC (C2Y) is a hypothetical non-profit organization that sources and delivers various types of donations to people in need in the broader Kansas City, KS area. This organization has volunteers (some of whom serve on teams and pick up and deliver the donated items), recipients (who receive the donations), and donors (from whom the organization sources and picks up donated items).

C2Y collects info about new volunteers and maintains a mailing list and email list for fundraising and email updates. They use SignUpGenius for volunteers to sign up to make donations. Volunteers make deliveries to recipients on a daily basis, Mondays-Saturdays. Donors (e.g., individuals, families, or companies) make donations of various types to the organization. Large donated items are stored in a warehouse attached to the office of the organization. Information is tracked about donors and their donations. Donations at the platinum, gold, and silver levels are reported on the organization's website with the donor’s name and donation level. Though not tracked today, C2Y would like to have a way to determine which volunteers are active vs. not active.
 
C2Y tracks the number of donations delivered to each recipient using Google Sheets (see Figure 1), a free spreadsheet-based technology, noting the donor, volunteer, team, and recipient data. C2Y would like a better way to communicate, especially for donation pick-ups, since those are critical. The technology used today is limiting, and the organization would like to start tracking its information in a database.

## Business Rules:
1.	One donor can donate many categories of donations, one category of donation can be donated by many different donors. (Ex. Tomi Lochtern donated Money and Food/Water, Money donations are made by 3 different donors)
2.	One donor can donate on more than one day, one day can have more than one donor. 
3.	Donors are of one type (individual, family, company…). One donor category can have more than one individual donor. (Ex. Tomi Lochtern is considered a Family donor, but the Family donor category has many different donors)
4.	Total donation value determines the level of the donation. 
-	ENTRY: Donations < 1000 
-	SILVER: 1000 <= Donation < 5000
-	GOLD: 5000 <= Donation < 7000
-	PLATINUM: 7000 < Donation <= 10000
5.	Each individual donation is linked to one individual donor. 
6.	A donor can make more than one donation on different days.
7.	One donation can be delivered to one recipient or many recipients. 
8.	One donation can be split up into multiple deliveries.
9.	Volunteers can make deliveries as an individual or as part of a team.
10.	Volunteers can make more than one delivery in a day.
11.	Volunteers can be either active or inactive depending when they last delivered a donation.
12.	Recipients can receive one item or multiple items in a delivery.
13.	Recipients can receive multiple items in one day.
14.	Recipients can receive many deliveries over time.
15.	Volunteers can be active on more than one date.
16.	One donor has one unique email. One email is linked to one donor. 
17.	One donor has one unique phone number, one phone number is linked to one donor
18.	One donor has one address, one address is linked to one donor
19.	One recipient has one unique phone number, one unique phone has one recipient
20.	One recipient has one unique address, one address is linked to one recipient. 
21.	One recipient is linked to one location category, one location category can be linked to more than one recipient. 
22.	Donations are made within the Kansas City area
23.	Abbreviated names are valid ex. J.P. Morgan Chase.

## Database Design
### Functional Dependencies
-	Donor Name -> (Donor Email, Donor Phone, Donor Address, Donor Type)
-	Recipient Name -> (Recipient Location, Recipient Address, Recipient Phone)
-	Volunteer Name -> (Volunteer Team)
-	Donated Item -> (Donation Category)
-	Total Donation Value -> (Donation Level)
-	Donor Name, Donated Item, Donation Date -> (Quantity, Total Donation Value)
-	Donated Item, Recipient Name, Delivery Date -> ()
-	Donated Item, Recipient Name, Delivery Date, Volunteer Name -> (Volunteer Hours)

### Normalize to 1NF
ALLDATA (DonationDate, DonorName, DonatedItem, Quantity(Checks/Pieces), DonationCategory, DonorEmail, DonorPhone, DonorAddress, TotalDonationAmount/Value, DonorType, VolunteerName, VolunteerTeam, VolunteerHours, DonationLevel, RecipientName, RecipientLocation, RecipientAddress, RecipientPhone, DeliveryDate)

### Normalize to 2NF
- DELIVERY (DonationDate, DonorName, DonatedItem, VolunteerName, VolunteerTeam, VolunteerHours, RecipientName, DeliveryDate)
- DONOR (DonorName, DonorEmail, DonorPhone, DonorAddress)
- ITEM_CATEGORY (DonatedItem, DonationCategory)
- RECIPIENT (RecipientName, RecipientLocation, RecipientAddress, RecipientPhone)
- DONATION (DonationDate, DonorName, DonatedItem, DonorType, Quantity(Checks/Pieces), DonationLevel, TotalDonationAmount/Value)

### Normalize to 3NF
- DELIVERY (DonationDate, DonorName, DonatedItem, VolunteerName, VolunteerTeam, VolunteerHours, RecipientName, DeliveryDate)
- DONOR (DonorName, DonorEmail, DonorPhone, DonorAddress)
- ITEM_CATEGORY (DonatedItem, DonationCategory)
- RECIPIENT (RecipientName, RecipientLocation, RecipientAddress, RecipientPhone)
- DONATION (DonationDate, DonorName, DonatedItem, DonorType, Quantity(Checks/Pieces), DonationLevel, TotalDonationAmount/Value)
- VOLUNTEER (VolunteerID, Volunteer_FName, Volunteer_LName, VolunteerStatus, Team)

### Enhancements
- DELIVERY (DeliveryID, DonationID, VolunteerID, VolunteerHours, RecipientID, DeliveryDate, DeliveryQuantity, Team, TotalDeliveryValue)
- DONOR (DonorID,  Donor_FName, Donor_LName, DonorEmail, DonorPhone, DonorAddress)
- ITEM (ItemID, DonatedItem, CategoryID)
- CATEGORY (CategoryID, DonationCategory)
- RECIPIENT (RecipientID, Recipient_FName, Recipient_LName, RecipientLocation, RecipientAddress, RecipientPhone)
- DONATION (DonationID, DonationDate, DonorID, ItemID, DonorType, DonationQuantity, ItemStatus, TotalDonationValue, DonationLevel)
- VOLUNTEER (VolunteerID, Volunteer_FName, Volunteer_LName, VolunteerStatus, Team)

## Additional Information
Additional information can be found in C2YDatabaseManagement.docx
