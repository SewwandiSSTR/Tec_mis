CREATE TABLE Medical_End(
    C_code CHAR(8) NOT NULL,
    C_type ENUM('P','T') NOT NULL,
    Regno CHAR(12) NOT NULL,
    Medical_id CHAR(20) UNIQUE, -- Changed to UNIQUE, not PRIMARY KEY
    Medical_Status ENUM('Approved','Pending','Not-approved') NOT NULL,
    Handle_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Submited_Date DATE NOT NULL,

    PRIMARY KEY(Regno, C_code, C_type), -- Enforces one medical record per student per course's End exam

    -- Foreign key 1: Relate to the Course
    CONSTRAINT fk_Medical_EndCourse FOREIGN KEY(C_code, C_type) 
        REFERENCES Course(C_code, C_type)
        ON UPDATE CASCADE, 

    -- Foreign key 2: Relate to the Student
    CONSTRAINT fk_Medical_EndStudent FOREIGN KEY(Regno) 
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
INSERT INTO Medical_end
		(Regno,C_code,C_type,Medical_id,Medical_Status,Submited_Date)

VALUES
('TG/2023/004','ICT1253','P','ICT1253TG004' ,'Approved','2025-11-10'),
('TG/2023/007','ICT1253','T','ICT1253TG007','Approved','2025-11-10'),
('TG/2023/008','ICT1242','T','ICT1242TG008', 'Approved','2025-11-14'),
('TG/2023/008','ICT1222','P','ICT1222TG008', 'Approved','2025-11-20'),
('TG/2023/010','ICT1253','T','ICT1253TG010', 'Approved','2025-11-10');

+---------+--------+-------------+--------------+----------------+---------------------+---------------+
| C_code  | C_type | Regno       | Medical_id   | Medical_Status | Handle_at           | Submited_Date |
+---------+--------+-------------+--------------+----------------+---------------------+---------------+
| ICT1253 | P      | TG/2023/004 | ICT1253TG004 | Approved       | 2025-10-26 16:37:59 | 2025-11-10    |
| ICT1253 | T      | TG/2023/007 | ICT1253TG007 | Approved       | 2025-10-26 16:37:59 | 2025-11-10    |
| ICT1222 | P      | TG/2023/008 | ICT1222TG008 | Approved       | 2025-10-26 16:37:59 | 2025-11-20    |
| ICT1242 | T      | TG/2023/008 | ICT1242TG008 | Approved       | 2025-10-26 16:37:59 | 2025-11-14    |
| ICT1253 | T      | TG/2023/010 | ICT1253TG010 | Approved       | 2025-10-26 16:37:59 | 2025-11-10    |
+---------+--------+-------------+--------------+----------------+---------------------+---------------+