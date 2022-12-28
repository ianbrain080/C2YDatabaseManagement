-- Function where a user inputs a donor phone number and the program returns the donorID.
CREATE DEFINER=`root`@`localhost` FUNCTION `checkDates`() RETURNS int
    READS SQL DATA
BEGIN
	DECLARE count_bad_dates INT;
    DECLARE EXIT HANDLER FOR NOT FOUND RETURN NULL;
    
	SELECT COUNT(*) INTO count_bad_dates
    FROM delivery del
    JOIN donation don
		ON del.donation_donationID = don.donationID
	WHERE del.deliveryDate < don.donationDate;
    
    RETURN count_bad_dates;
END