DELIMITER // 
CREATE PROCEDURE attendence_a_student_all_course (IN Reg_no CHAR(12))
BEGIN
    SELECT 
        C_code AS 'Course Code',
        CASE 
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'           
        END  AS 'Practical/Theory',
        Attendance_Percentage AS 'Attendence Percentage',
        Eligibility 
    FROM Attendance_eligibility
    WHERE  Regno = Reg_no;
END//

CALL attendence_a_student_all_course('TG/2023/004')//

+-------------+------------------+-----------------------+-------------+
| Course Code | Practical/Theory | Attendence Percentage | Eligibility |
+-------------+------------------+-----------------------+-------------+
| ENG1222     | Theory           |                100.00 | EL          |
| ICT1212     | Theory           |                100.00 | EL          |
| ICT1222     | Practical        |                 92.86 | EL          |
| ICT1233     | Practical        |                100.00 | EL          |
| ICT1233     | Theory           |                100.00 | EL          |
| ICT1242     | Theory           |                100.00 | EL          |
| ICT1253     | Practical        |                100.00 | EL          |
| ICT1253     | Theory           |                100.00 | EL          |
| TCS1212     | Theory           |                100.00 | EL          |
| TMS1233     | Theory           |                100.00 | EL          |
+-------------+------------------+-----------------------+-------------+