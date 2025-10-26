DELIMITER //
CREATE PROCEDURE attendence_a_student_a_course (IN Ccode CHAR(8), IN Reg_no CHAR(12))
BEGIN
    SELECT 
        C_code AS 'Course Code',
       CASE 
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'           
        END  AS 'Practical/Theory' ,
        Attendance_Percentage AS 'Attendence Percentage',
        Eligibility 
    FROM Attendance_eligibility
    WHERE C_code = Ccode AND Regno = Reg_no;
END//

CALL attendence_a_student_a_course ('ICT1253','TG/2023/002')//

+-------------+------------------+-----------------------+-------------+
| Course Code | Practical/Theory | Attendence Percentage | Eligibility |
+-------------+------------------+-----------------------+-------------+
| ICT1253     | Practical        |                 92.86 | EL          |
| ICT1253     | Theory           |                100.00 | EL          |
+-------------+------------------+-----------------------+-------------+