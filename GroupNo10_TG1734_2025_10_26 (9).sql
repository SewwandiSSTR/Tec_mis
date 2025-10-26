-- Final Mark
DELIMITER //
CREATE PROCEDURE Final_mark_all_course_a_student (IN Reg_no CHAR(12))
BEGIN
    SELECT  
        C_code AS 'Course Code',
        CASE
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'             
        END AS 'Practical/Theory',
         Final_Mark AS 'Final Marks'
    FROM Final_result
    WHERE Regno = Reg_no;
END//

CALL Final_mark_all_course_a_student('TG/2023/004')//

+-------------+------------------+-------------+
| Course Code | Practical/Theory | Final Marks |
+-------------+------------------+-------------+
| ENG1222     | Theory           | 86.75       |
| ICT1212     | Theory           | 64.20       |
| ICT1222     | Practical        | 86.40       |
| ICT1233     | Practical        | 73.30       |
| ICT1233     | Theory           | 76.45       |
| ICT1242     | Theory           | 78.88       |
| ICT1253     | Practical        | WH          |
| ICT1253     | Theory           | 81.90       |
| TCS1212     | Theory           | 86.20       |
| TMS1233     | Theory           | 84.80       |
+-------------+------------------+-------------+