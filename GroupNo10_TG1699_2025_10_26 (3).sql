DELIMITER //
CREATE PROCEDURE CA_whole_batch_a_course (IN Ccode CHAR(8))
BEGIN
    SELECT 
        C_code AS 'Course Code',
        Regno AS 'Registration Number',
        CASE 
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'           
        END  AS 'Practical/Theory',
         CA AS 'CA Marks'
    FROM Result_status
    WHERE C_code = Ccode;
END//

CALL CA_whole_batch_a_course('ICT1253')//

+-------------+---------------------+------------------+----------+
| Course Code | Registration Number | Practical/Theory | CA Marks |
+-------------+---------------------+------------------+----------+
| ICT1253     | TG/2023/001         | Practical        | 35.33    |
| ICT1253     | TG/2023/002         | Practical        | 40.33    |
| ICT1253     | TG/2023/003         | Practical        | 38.00    |
| ICT1253     | TG/2023/004         | Practical        | MC       |
| ICT1253     | TG/2023/005         | Practical        | 23.75    |
| ICT1253     | TG/2023/006         | Practical        | 21.25    |
| ICT1253     | TG/2023/007         | Practical        | 17.25    |
| ICT1253     | TG/2023/008         | Practical        | 17.75    |
| ICT1253     | TG/2023/009         | Practical        | 21.25    |
| ICT1253     | TG/2023/010         | Practical        | 22.63    |
| ICT1253     | TG/2023/001         | Theory           | 63.77    |
| ICT1253     | TG/2023/002         | Theory           | 79.00    |
| ICT1253     | TG/2023/003         | Theory           | 71.43    |
| ICT1253     | TG/2023/004         | Theory           | 64.17    |
| ICT1253     | TG/2023/005         | Theory           | 41.50    |
| ICT1253     | TG/2023/006         | Theory           | 43.00    |
| ICT1253     | TG/2023/007         | Theory           | MC       |
| ICT1253     | TG/2023/008         | Theory           | 48.83    |
| ICT1253     | TG/2023/009         | Theory           | 45.33    |
| ICT1253     | TG/2023/010         | Theory           | 51.00    |
+-------------+---------------------+------------------+----------+