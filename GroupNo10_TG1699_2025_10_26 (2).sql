DELIMITER //
CREATE PROCEDURE CA_all_course_a_student (IN Reg_no CHAR(12))
BEGIN
    SELECT
        C_code AS 'Course Code',
        CASE
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'  
        END AS 'Practical/Theory',
         CA AS 'CA Marks'
    FROM Result_status
    WHERE Regno = Reg_no;
END//

CALL CA_all_course_a_student('TG/2023/005')//

+-------------+------------------+----------+
| Course Code | Practical/Theory | CA Marks |
+-------------+------------------+----------+
| ICT1212     | Theory           | 58.33    |
| ICT1222     | Practical        | 73.83    |
| ICT1233     | Practical        | 55.63    |
| ICT1233     | Theory           | 51.17    |
| ICT1242     | Theory           | 50.00    |
| ICT1253     | Practical        | 23.75    |
| ICT1253     | Theory           | 41.50    |
| TCS1212     | Theory           | 60.67    |
| TMS1233     | Theory           | 54.07    |
+-------------+------------------+----------+