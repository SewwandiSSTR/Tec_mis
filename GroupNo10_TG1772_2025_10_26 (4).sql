DELIMITER //
CREATE PROCEDURE attendence_whole_batch_a_course (IN Ccode CHAR(8))
BEGIN
    SELECT 
        Regno AS 'Registration Number',
        C_code AS 'Course Code',
        CASE 
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'           
        END  AS 'Practical/Theory',    
        
        Attendance_Percentage AS 'Attendence Percentage',
        Eligibility 
    FROM Attendance_eligibility 
    WHERE C_code = Ccode;
END//

CALL attendence_whole_batch_a_course('ICT1253')//

+---------------------+-------------+------------------+-----------------------+-------------+
| Registration Number | Course Code | Practical/Theory | Attendence Percentage | Eligibility |
+---------------------+-------------+------------------+-----------------------+-------------+
| TG/2023/001         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/002         | ICT1253     | Practical        |                 92.86 | EL          |
| TG/2023/003         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/004         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/005         | ICT1253     | Practical        |                 92.86 | EL          |
| TG/2023/006         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/007         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/008         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/009         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/010         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/001         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/002         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/003         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/004         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/005         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/006         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/007         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/008         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/009         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/010         | ICT1253     | Theory           |                100.00 | EL          |
+---------------------+-------------+------------------+-----------------------+-------------+