DELIMITER //
CREATE PROCEDURE medical_end (IN regnum CHAR(12))
BEGIN  
    SELECT Regno,Submited_date,Medical_Status,C_code
    FROM medical_end 
    WHERE regno = regnum;
END//

CALL medical_end('TG/2023/004')//

+-------------+---------------+----------------+---------+
| Regno       | Submited_date | Medical_Status | C_code  |
+-------------+---------------+----------------+---------+
| TG/2023/004 | 2025-11-10    | Approved       | ICT1253 |
+-------------+---------------+----------------+---------+