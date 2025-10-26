DELIMITER //
CREATE PROCEDURE attendence_whole_batch_all_course ()
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
    FROM Attendance_eligibility;
END//

CALL attendence_whole_batch_all_course ()//

+---------------------+-------------+------------------+-----------------------+-------------+
| Registration Number | Course Code | Practical/Theory | Attendence Percentage | Eligibility |
+---------------------+-------------+------------------+-----------------------+-------------+
| TG/2023/001         | ENG1222     | Theory           |                100.00 | EL          |
| TG/2023/001         | ICT1212     | Theory           |                100.00 | EL          |
| TG/2023/001         | ICT1222     | Practical        |                100.00 | EL          |
| TG/2023/001         | ICT1233     | Practical        |                100.00 | EL          |
| TG/2023/001         | ICT1233     | Theory           |                100.00 | EL          |
| TG/2023/001         | ICT1242     | Theory           |                100.00 | EL          |
| TG/2023/001         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/001         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/001         | TCS1212     | Theory           |                 92.86 | EL          |
| TG/2023/001         | TMS1233     | Theory           |                100.00 | EL          |
| TG/2023/002         | ENG1222     | Theory           |                100.00 | EL          |
| TG/2023/002         | ICT1212     | Theory           |                100.00 | EL          |
| TG/2023/002         | ICT1222     | Practical        |                100.00 | EL          |
| TG/2023/002         | ICT1233     | Practical        |                100.00 | EL          |
| TG/2023/002         | ICT1233     | Theory           |                100.00 | EL          |
| TG/2023/002         | ICT1242     | Theory           |                100.00 | EL          |
| TG/2023/002         | ICT1253     | Practical        |                 92.86 | EL          |
| TG/2023/002         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/002         | TCS1212     | Theory           |                 92.86 | EL          |
| TG/2023/002         | TMS1233     | Theory           |                100.00 | EL          |
| TG/2023/003         | ENG1222     | Theory           |                100.00 | EL          |
| TG/2023/003         | ICT1212     | Theory           |                100.00 | EL          |
| TG/2023/003         | ICT1222     | Practical        |                100.00 | EL          |
| TG/2023/003         | ICT1233     | Practical        |                100.00 | EL          |
| TG/2023/003         | ICT1233     | Theory           |                100.00 | EL          |
| TG/2023/003         | ICT1242     | Theory           |                100.00 | EL          |
| TG/2023/003         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/003         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/003         | TCS1212     | Theory           |                100.00 | EL          |
| TG/2023/003         | TMS1233     | Theory           |                 92.86 | EL          |
| TG/2023/004         | ENG1222     | Theory           |                100.00 | EL          |
| TG/2023/004         | ICT1212     | Theory           |                100.00 | EL          |
| TG/2023/004         | ICT1222     | Practical        |                 92.86 | EL          |
| TG/2023/004         | ICT1233     | Practical        |                100.00 | EL          |
| TG/2023/004         | ICT1233     | Theory           |                100.00 | EL          |
| TG/2023/004         | ICT1242     | Theory           |                100.00 | EL          |
| TG/2023/004         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/004         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/004         | TCS1212     | Theory           |                100.00 | EL          |
| TG/2023/004         | TMS1233     | Theory           |                100.00 | EL          |
| TG/2023/005         | ENG1222     | Theory           |                100.00 | EL          |
| TG/2023/005         | ICT1212     | Theory           |                 92.86 | EL          |
| TG/2023/005         | ICT1222     | Practical        |                100.00 | EL          |
| TG/2023/005         | ICT1233     | Practical        |                100.00 | EL          |
| TG/2023/005         | ICT1233     | Theory           |                100.00 | EL          |
| TG/2023/005         | ICT1242     | Theory           |                100.00 | EL          |
| TG/2023/005         | ICT1253     | Practical        |                 92.86 | EL          |
| TG/2023/005         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/005         | TCS1212     | Theory           |                100.00 | EL          |
| TG/2023/005         | TMS1233     | Theory           |                100.00 | EL          |
| TG/2023/006         | ENG1222     | Theory           |                 92.86 | EL          |
| TG/2023/006         | ICT1212     | Theory           |                100.00 | EL          |
| TG/2023/006         | ICT1222     | Practical        |                100.00 | EL          |
| TG/2023/006         | ICT1233     | Practical        |                 78.57 | NE          |
| TG/2023/006         | ICT1233     | Theory           |                100.00 | EL          |
| TG/2023/006         | ICT1242     | Theory           |                100.00 | EL          |
| TG/2023/006         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/006         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/006         | TCS1212     | Theory           |                100.00 | EL          |
| TG/2023/006         | TMS1233     | Theory           |                100.00 | EL          |
| TG/2023/007         | ENG1222     | Theory           |                 92.86 | EL          |
| TG/2023/007         | ICT1212     | Theory           |                100.00 | EL          |
| TG/2023/007         | ICT1222     | Practical        |                100.00 | EL          |
| TG/2023/007         | ICT1233     | Practical        |                100.00 | EL          |
| TG/2023/007         | ICT1233     | Theory           |                100.00 | EL          |
| TG/2023/007         | ICT1242     | Theory           |                100.00 | EL          |
| TG/2023/007         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/007         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/007         | TCS1212     | Theory           |                100.00 | EL          |
| TG/2023/007         | TMS1233     | Theory           |                100.00 | EL          |
| TG/2023/008         | ENG1222     | Theory           |                100.00 | EL          |
| TG/2023/008         | ICT1212     | Theory           |                 92.86 | EL          |
| TG/2023/008         | ICT1222     | Practical        |                100.00 | EL          |
| TG/2023/008         | ICT1233     | Practical        |                100.00 | EL          |
| TG/2023/008         | ICT1233     | Theory           |                100.00 | EL          |
| TG/2023/008         | ICT1242     | Theory           |                100.00 | EL          |
| TG/2023/008         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/008         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/008         | TCS1212     | Theory           |                100.00 | EL          |
| TG/2023/008         | TMS1233     | Theory           |                100.00 | EL          |
| TG/2023/009         | ENG1222     | Theory           |                100.00 | EL          |
| TG/2023/009         | ICT1212     | Theory           |                100.00 | EL          |
| TG/2023/009         | ICT1222     | Practical        |                100.00 | EL          |
| TG/2023/009         | ICT1233     | Practical        |                100.00 | EL          |
| TG/2023/009         | ICT1233     | Theory           |                100.00 | EL          |
| TG/2023/009         | ICT1242     | Theory           |                100.00 | EL          |
| TG/2023/009         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/009         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/009         | TCS1212     | Theory           |                100.00 | EL          |
| TG/2023/009         | TMS1233     | Theory           |                100.00 | EL          |
| TG/2023/010         | ENG1222     | Theory           |                 92.86 | EL          |
| TG/2023/010         | ICT1212     | Theory           |                100.00 | EL          |
| TG/2023/010         | ICT1222     | Practical        |                100.00 | EL          |
| TG/2023/010         | ICT1233     | Practical        |                100.00 | EL          |
| TG/2023/010         | ICT1233     | Theory           |                100.00 | EL          |
| TG/2023/010         | ICT1242     | Theory           |                100.00 | EL          |
| TG/2023/010         | ICT1253     | Practical        |                100.00 | EL          |
| TG/2023/010         | ICT1253     | Theory           |                100.00 | EL          |
| TG/2023/010         | TCS1212     | Theory           |                100.00 | EL          |
| TG/2023/010         | TMS1233     | Theory           |                100.00 | EL          |
+---------------------+-------------+------------------+-----------------------+-------------+
