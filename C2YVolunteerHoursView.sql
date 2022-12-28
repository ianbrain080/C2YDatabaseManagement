-- View of volunteers ranked by their total amount of volunteer hours for the past month
-- For the purpose of this view, we used "MONTH(CURDATE()) - 1" as there are no deliveries in December 
-- when this database management project took place.
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `c2yproject2`.`view_volunteerhourstotal` AS
    SELECT 
        `v`.`Volunteer_FName` AS `volunteer_FName`,
        `v`.`volunteer_LName` AS `volunteer_LName`,
        SUM(`d`.`VolunteerHours`) AS `totalHours`
    FROM
        (`c2yproject2`.`volunteer` `v`
        JOIN `c2yproject2`.`delivery` `d` ON ((`d`.`Volunteer_VolunteerID` = `v`.`VolunteerID`)))
    WHERE
        (MONTH(`d`.`DeliveryDate`) = (MONTH(CURDATE()) - 1))
    GROUP BY `v`.`Volunteer_FName` , `v`.`volunteer_LName`
    ORDER BY `totalHours` DESC