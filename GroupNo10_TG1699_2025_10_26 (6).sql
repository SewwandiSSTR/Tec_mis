-- Medical Attendence
CREATE TABLE Medical_Attendence(
    C_code CHAR(8) NOT NULL,
    C_type ENUM('P','T') NOT NULL,
    Regno CHAR(12) NOT NULL,
    Medical_id CHAR(20) UNIQUE, 
    Medical_Status ENUM('Approved','Pending','Not-approved') NOT NULL, 
    Handle_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Submited_Date DATE NOT NULL,                                       

    PRIMARY KEY(Regno, C_code, C_type), 
    
    -- Foreign key 1: Relate to the Course
    CONSTRAINT fk_Medical_AttendenceCourse FOREIGN KEY(C_code, C_type) 
        REFERENCES Course(C_code, C_type)
        ON UPDATE CASCADE, 

    -- Foreign key 2: Relate to the Student
    CONSTRAINT fk_Medical_AttendenceStudent FOREIGN KEY(Regno) 
        REFERENCES User(User_id) 
        ON UPDATE CASCADE 
);

+----------------+-------------------------------------------+------+-----+-------------------+-------------------+
| Field          | Type                                      | Null | Key | Default           | Extra             |
+----------------+-------------------------------------------+------+-----+-------------------+-------------------+
| C_code         | char(8)                                   | NO   | PRI | NULL              |                   |
| C_type         | enum('P','T')                             | NO   | PRI | NULL              |                   |
| Regno          | char(12)                                  | NO   | PRI | NULL              |                   |
| Medical_id     | char(20)                                  | YES  | UNI | NULL              |                   |
| Medical_Status | enum('Approved','Pending','Not-approved') | NO   |     | NULL              |                   |
| Handle_at      | timestamp                                 | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| Submited_Date  | date                                      | NO   |     | NULL              |                   |
+----------------+-------------------------------------------+------+-----+-------------------+-------------------+

-- insert data
INSERT INTO Medical_Attendence
		(Regno,C_code,C_type,Medical_id,Medical_Status,Submited_Date)

VALUES
('TG/2023/007','ENG1222','T','ENG1222TG230007','Approved','2025-08-05'),
('TG/2023/004','ICT1233','P','ICT1233TG230004','Approved','2025-08-08'),
('TG/2023/003','ICT1222','P','ICT1222TG230003','Approved','2025-08-15'),
('TG/2023/002','ICT1253','P','ICT1253TG230002','Not-Approved','2025-08-26'),
('TG/2023/004','ICT1222','P','ICT1222TG230004','Not-Approved','2025-09-02'),
('TG/2023/008','ICT1212','T','ICT1212TG230008','Not-Approved','2025-09-11'),
('TG/2023/004','ICT1253','P','ICT1253TG230004','Approved','2025-09-12'),
('TG/2023/006','ICT1233','P','ICT1233TG230006','Not-Approved','2025-09-25'),
('TG/2023/006','ICT1242','T','ICT1242TG230006','Approved','2025-10-04'),
('TG/2023/009','ICT1242','T','ICT1242TG230009','Approved','2025-10-22'),
('TG/2023/003','TMS1233','T','TMS1233TG230003','Pending','2025-10-27');

+---------+--------+-------------+-----------------+----------------+---------------------+---------------+
| C_code  | C_type | Regno       | Medical_id      | Medical_Status | Handle_at           | Submited_Date |
+---------+--------+-------------+-----------------+----------------+---------------------+---------------+
| ICT1253 | P      | TG/2023/002 | ICT1253TG230002 | Not-approved   | 2025-10-26 16:30:14 | 2025-08-26    |
| ICT1222 | P      | TG/2023/003 | ICT1222TG230003 | Approved       | 2025-10-26 16:30:14 | 2025-08-15    |
| TMS1233 | T      | TG/2023/003 | TMS1233TG230003 | Pending        | 2025-10-26 16:30:14 | 2025-10-27    |
| ICT1222 | P      | TG/2023/004 | ICT1222TG230004 | Not-approved   | 2025-10-26 16:30:14 | 2025-09-02    |
| ICT1233 | P      | TG/2023/004 | ICT1233TG230004 | Approved       | 2025-10-26 16:30:14 | 2025-08-08    |
| ICT1253 | P      | TG/2023/004 | ICT1253TG230004 | Approved       | 2025-10-26 16:30:14 | 2025-09-12    |
| ICT1233 | P      | TG/2023/006 | ICT1233TG230006 | Not-approved   | 2025-10-26 16:30:14 | 2025-09-25    |
| ICT1242 | T      | TG/2023/006 | ICT1242TG230006 | Approved       | 2025-10-26 16:30:14 | 2025-10-04    |
| ENG1222 | T      | TG/2023/007 | ENG1222TG230007 | Approved       | 2025-10-26 16:30:14 | 2025-08-05    |
| ICT1212 | T      | TG/2023/008 | ICT1212TG230008 | Not-approved   | 2025-10-26 16:30:14 | 2025-09-11    |
| ICT1242 | T      | TG/2023/009 | ICT1242TG230009 | Approved       | 2025-10-26 16:30:14 | 2025-10-22    |
+---------+--------+-------------+-----------------+----------------+---------------------+---------------+