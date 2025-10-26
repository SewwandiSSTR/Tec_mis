DELIMITER //
CREATE PROCEDURE medical_mid (IN regnum CHAR(12))
BEGIN

    SELECT Regno,Submited_date,Medical_Status,C_code
    FROM medical_mid 
    WHERE regno = regnum;
END//

CALL medical_mid('TG/2023/002')//

+-------------+---------------+----------------+---------+
| Regno       | Submited_date | Medical_Status | C_code  |
+-------------+---------------+----------------+---------+
| TG/2023/002 | 2025-10-01    | Approved       | ICT1233 |
+-------------+---------------+----------------+---------+