CREATE TABLE Medical_Mid(
    C_code CHAR(8) NOT NULL,
    C_type ENUM('P','T') NOT NULL,
    Regno CHAR(12) NOT NULL,
    Medical_id CHAR(20) UNIQUE, 
    Medical_Status ENUM('Approved','Pending','Not-approved') NOT NULL, -- Status should probably be NOT NULL
    Submited_Date DATE NOT NULL,                                       -- Date should probably be NOT NULL

    PRIMARY KEY(Regno, C_code, C_type), -- Enforces one medical record per student per course's Mid exam
    
    -- Foreign key 1: Relate to the Course
    CONSTRAINT fk_Medical_MidCourse FOREIGN KEY(C_code, C_type) 
        REFERENCES Course(C_code, C_type)
        ON UPDATE CASCADE, 

    -- Foreign key 2: Relate to the Student
    CONSTRAINT fk_Medical_MidStudent FOREIGN KEY(Regno) 
        REFERENCES User(User_id) 
        ON UPDATE CASCADE 
);

+----------------+-------------------------------------------+------+-----+---------+-------+
| Field          | Type                                      | Null | Key | Default | Extra |
+----------------+-------------------------------------------+------+-----+---------+-------+
| C_code         | char(8)                                   | NO   | PRI | NULL    |       |
| C_type         | enum('P','T')                             | NO   | PRI | NULL    |       |
| Regno          | char(12)                                  | NO   | PRI | NULL    |       |
| Medical_id     | char(20)                                  | YES  | UNI | NULL    |       |
| Medical_Status | enum('Approved','Pending','Not-approved') | NO   |     | NULL    |       |
| Submited_Date  | date                                      | NO   |     | NULL    |       |
+----------------+-------------------------------------------+------+-----+---------+-------+

-- insert data
INSERT INTO Medical_mid
	(Regno,C_code,C_type,Medical_id,Medical_Status,Submited_Date)
VALUES
('TG/2023/002','ICT1233','T','ICT1233TG002' ,'Approved','2025-10-01'),
('TG/2023/004','ICT1253','P','ICT1253TG004','Approved','2025-10-02'),
('TG/2023/009','ICT1233','P','ICT1233TG009', 'Approved','2025-10-02'),
('TG/2023/010','ENG1222','T','ENG122TG010', 'Approved','2025-09-30'),
('TG/2023/007','ICT1253','T','ICT1253TG007', 'Approved','2025-10-01');

+---------+--------+-------------+--------------+----------------+---------------+
| C_code  | C_type | Regno       | Medical_id   | Medical_Status | Submited_Date |
+---------+--------+-------------+--------------+----------------+---------------+
| ICT1233 | T      | TG/2023/002 | ICT1233TG002 | Approved       | 2025-10-01    |
| ICT1253 | P      | TG/2023/004 | ICT1253TG004 | Approved       | 2025-10-02    |
| ICT1253 | T      | TG/2023/007 | ICT1253TG007 | Approved       | 2025-10-01    |
| ICT1233 | P      | TG/2023/009 | ICT1233TG009 | Approved       | 2025-10-02    |
| ENG1222 | T      | TG/2023/010 | ENG122TG010  | Approved       | 2025-09-30    |
+---------+--------+-------------+--------------+----------------+---------------+
