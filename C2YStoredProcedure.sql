-- Stored procedure to return donor email addresses delimited by "|"
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CreateEmailList`(INOUT emails VARCHAR(4000))
BEGIN
	-- declare variables
    DECLARE ended INT DEFAULT FALSE;
    DECLARE currentEmail VARCHAR(255) DEFAULT "";
	-- declare cursor
    DECLARE gather_email CURSOR FOR
SELECT donorEmail FROM c2yproject2.donor;
		-- declare and name the handler with the variable terminate set for the end of the loop
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET ended = TRUE;
	-- open cursor
    OPEN gather_email;
    -- start the loop
    grabEmails: LOOP
		-- first fetch the cursor
        FETCH gather_email INTO currentEmail;
        IF ended = TRUE THEN
			LEAVE grabEmails;
		END IF;
        SET emails = CONCAT(currentEmail, "|", emails);
        -- SET stores a value for the variable. CONCAT takes the "currentEmail" string, adds a pipe, and 
        -- then adds to that the second string. Thus, the current line's email address will always appear "before" the prior ones (emails)
	END LOOP grabEmails;

    -- close the cursor
    CLOSE gather_email;
END