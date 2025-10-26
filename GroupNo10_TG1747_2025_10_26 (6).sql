DELIMITER //
CREATE PROCEDURE Final_mark_whole_batch_all_course ()
BEGIN
    SELECT  
        Regno AS 'Registration Number',
        C_code AS "Course Code",
        CASE
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'             
        END AS 'Practical/Theory',
         Final_Mark AS 'Final Marks'
    FROM Final_result;
END//

CALL Final_mark_whole_batch_all_course()//

+---------------------+-------------+------------------+-------------+
| Registration Number | Course Code | Practical/Theory | Final Marks |
+---------------------+-------------+------------------+-------------+
| TG/2021/023         | ICT1242     | Theory           | 78.43       |
| TG/2021/088         | TMS1233     | Theory           | 82.75       |
| TG/2023/001         | ENG1222     | Theory           | 91.00       |
| TG/2023/001         | ICT1212     | Theory           | 88.25       |
| TG/2023/001         | ICT1222     | Practical        | 68.29       |
| TG/2023/001         | ICT1233     | Practical        | 77.90       |
| TG/2023/001         | ICT1233     | Theory           | 78.25       |
| TG/2023/001         | ICT1242     | Theory           | 79.75       |
| TG/2023/001         | ICT1253     | Practical        | 46.50       |
| TG/2023/001         | ICT1253     | Theory           | 82.13       |
| TG/2023/001         | TCS1212     | Theory           | 84.95       |
| TG/2023/001         | TMS1233     | Theory           | 71.55       |
| TG/2023/002         | ENG1222     | Theory           | 78.35       |
| TG/2023/002         | ICT1212     | Theory           | 76.38       |
| TG/2023/002         | ICT1222     | Practical        | 63.46       |
| TG/2023/002         | ICT1233     | Practical        | 73.45       |
| TG/2023/002         | ICT1233     | Theory           | WH          |
| TG/2023/002         | ICT1242     | Theory           | 78.50       |
| TG/2023/002         | ICT1253     | Practical        | 58.43       |
| TG/2023/002         | ICT1253     | Theory           | 71.30       |
| TG/2023/002         | TCS1212     | Theory           | 84.15       |
| TG/2023/002         | TMS1233     | Theory           | 68.83       |
| TG/2023/003         | ENG1222     | Theory           | 62.20       |
| TG/2023/003         | ICT1212     | Theory           | 83.05       |
| TG/2023/003         | ICT1222     | Practical        | 84.19       |
| TG/2023/003         | ICT1233     | Practical        | 64.55       |
| TG/2023/003         | ICT1233     | Theory           | 70.68       |
| TG/2023/003         | ICT1242     | Theory           | 66.03       |
| TG/2023/003         | ICT1253     | Practical        | 46.80       |
| TG/2023/003         | ICT1253     | Theory           | 65.53       |
| TG/2023/003         | TCS1212     | Theory           | 85.03       |
| TG/2023/003         | TMS1233     | Theory           | 84.75       |
| TG/2023/004         | ENG1222     | Theory           | 86.75       |
| TG/2023/004         | ICT1212     | Theory           | 64.20       |
| TG/2023/004         | ICT1222     | Practical        | 86.40       |
| TG/2023/004         | ICT1233     | Practical        | 73.30       |
| TG/2023/004         | ICT1233     | Theory           | 76.45       |
| TG/2023/004         | ICT1242     | Theory           | 78.88       |
| TG/2023/004         | ICT1253     | Practical        | WH          |
| TG/2023/004         | ICT1253     | Theory           | 81.90       |
| TG/2023/004         | TCS1212     | Theory           | 86.20       |
| TG/2023/004         | TMS1233     | Theory           | 84.80       |
| TG/2023/005         | ICT1212     | Theory           | 57.75       |
| TG/2023/005         | ICT1222     | Practical        | 70.03       |
| TG/2023/005         | ICT1233     | Practical        | 69.95       |
| TG/2023/005         | ICT1233     | Theory           | 70.30       |
| TG/2023/005         | ICT1242     | Theory           | 68.20       |
| TG/2023/005         | ICT1253     | Practical        | 51.00       |
| TG/2023/005         | ICT1253     | Theory           | 68.10       |
| TG/2023/005         | TCS1212     | Theory           | 77.70       |
| TG/2023/005         | TMS1233     | Theory           | 71.17       |
| TG/2023/006         | ENG1222     | Theory           | 88.00       |
| TG/2023/006         | ICT1212     | Theory           | 75.60       |
| TG/2023/006         | ICT1222     | Practical        | 77.43       |
| TG/2023/006         | ICT1233     | Practical        | WH          |
| TG/2023/006         | ICT1233     | Theory           | 62.10       |
| TG/2023/006         | ICT1242     | Theory           | 65.68       |
| TG/2023/006         | ICT1253     | Practical        | 50.40       |
| TG/2023/006         | ICT1253     | Theory           | 72.05       |
| TG/2023/006         | TCS1212     | Theory           | 72.85       |
| TG/2023/006         | TMS1233     | Theory           | 70.40       |
| TG/2023/007         | ENG1222     | Theory           | 77.75       |
| TG/2023/007         | ICT1212     | Theory           | 72.00       |
| TG/2023/007         | ICT1222     | Practical        | 66.05       |
| TG/2023/007         | ICT1233     | Practical        | 63.60       |
| TG/2023/007         | ICT1233     | Theory           | 67.10       |
| TG/2023/007         | ICT1242     | Theory           | 61.48       |
| TG/2023/007         | ICT1253     | Practical        | 35.40       |
| TG/2023/007         | ICT1253     | Theory           | WH          |
| TG/2023/007         | TCS1212     | Theory           | 70.18       |
| TG/2023/007         | TMS1233     | Theory           | 80.38       |
| TG/2023/008         | ENG1222     | Theory           | 92.35       |
| TG/2023/008         | ICT1212     | Theory           | 40.60       |
| TG/2023/008         | ICT1222     | Practical        | WH          |
| TG/2023/008         | ICT1233     | Practical        | 58.10       |
| TG/2023/008         | ICT1233     | Theory           | 76.50       |
| TG/2023/008         | ICT1242     | Theory           | WH          |
| TG/2023/008         | ICT1253     | Practical        | 40.80       |
| TG/2023/008         | ICT1253     | Theory           | 64.70       |
| TG/2023/008         | TCS1212     | Theory           | 65.58       |
| TG/2023/008         | TMS1233     | Theory           | 80.93       |
| TG/2023/009         | ENG1222     | Theory           | 68.90       |
| TG/2023/009         | ICT1212     | Theory           | 70.65       |
| TG/2023/009         | ICT1222     | Practical        | 64.88       |
| TG/2023/009         | ICT1233     | Practical        | WH          |
| TG/2023/009         | ICT1233     | Theory           | 59.50       |
| TG/2023/009         | ICT1242     | Theory           | 40.25       |
| TG/2023/009         | ICT1253     | Practical        | 47.10       |
| TG/2023/009         | ICT1253     | Theory           | 60.50       |
| TG/2023/009         | TCS1212     | Theory           | 76.00       |
| TG/2023/009         | TMS1233     | Theory           | 77.55       |
| TG/2023/010         | ENG1222     | Theory           | WH          |
| TG/2023/010         | ICT1212     | Theory           | 35.00       |
| TG/2023/010         | ICT1222     | Practical        | 74.40       |
| TG/2023/010         | ICT1233     | Practical        | 65.20       |
| TG/2023/010         | ICT1233     | Theory           | 77.00       |
| TG/2023/010         | ICT1242     | Theory           | 73.88       |
| TG/2023/010         | ICT1253     | Practical        | 54.30       |
| TG/2023/010         | ICT1253     | Theory           | WH          |
| TG/2023/010         | TCS1212     | Theory           | 67.10       |
| TG/2023/010         | TMS1233     | Theory           | 77.03       |
+---------------------+-------------+------------------+-------------+