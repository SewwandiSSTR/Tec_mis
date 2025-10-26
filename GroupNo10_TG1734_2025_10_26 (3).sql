DELIMITER //
CREATE PROCEDURE CA_a_course_a_student (IN Reg_no CHAR(12),IN Ccode CHAR(8))
BEGIN
    SELECT 
        C_code AS 'Course Code',
       CASE 
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'           
        END  AS 'Practical/Theory',
         CA AS 'CA Marks'
    FROM Result_status
    WHERE Regno = Reg_no
    AND C_code = Ccode;
END//

CALL CA_a_course_a_student('TG/2023/003','ICT1253')//

+-------------+------------------+----------+
| Course Code | Practical/Theory | CA Marks |
+-------------+------------------+----------+
| ICT1253     | Practical        | 38.00    |
| ICT1253     | Theory           | 71.43    |
+-------------+------------------+----------+