DELIMITER //
CREATE PROCEDURE medical_attendence (IN regnum CHAR(12))
BEGIN
    SELECT Regno,Submited_date,Medical_Status,C_code
    FROM medical_Attendence 
    WHERE regno = regnum;
END//

CALL medical_attendence('TG/2023/007')//

+-------------+---------------+----------------+---------+
| Regno       | Submited_date | Medical_Status | C_code  |
+-------------+---------------+----------------+---------+
| TG/2023/007 | 2025-08-05    | Approved       | ENG1222 |
+-------------+---------------+----------------+---------+