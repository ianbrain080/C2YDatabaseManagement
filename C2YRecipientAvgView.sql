-- View of average delivered amount for each recipient
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `c2yproject2`.`view_recipientdeliveryavg` AS
    SELECT 
        `r`.`Recipient_FName` AS `recipient_FName`,
        `r`.`Recipient_LName` AS `recipient_LName`,
        AVG(`d`.`TotalDeliveryValue`) AS `recipientDeliveryValue`
    FROM
        ((`c2yproject2`.`recipient` `r`
        JOIN `c2yproject2`.`delivery` `d` ON ((`d`.`Recipient_RecipientID` = `r`.`RecipientID`)))
        JOIN `c2yproject2`.`donation` `don` ON ((`d`.`Donation_DonationID` = `don`.`DonationID`)))
    GROUP BY `r`.`Recipient_FName` , `r`.`Recipient_LName`
    ORDER BY `recipientDeliveryValue` DESC