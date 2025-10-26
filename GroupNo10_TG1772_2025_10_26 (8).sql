-- Medical Handle
CREATE TABLE Medical_handle(
    C_code CHAR(8) NOT NULL,
    C_type ENUM('P','T') NOT NULL,
    Regno CHAR(12) NOT NULL,
    Lec_Handler CHAR(12) NOT NULL,
    Handle_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- 2. Added FK to Course table 
    CONSTRAINT fk_Medical_handle_course FOREIGN KEY(C_code, C_type) 
        REFERENCES Course(C_code, C_type)
        ON UPDATE CASCADE, 
        
    -- 3. Added FK to Student table 
    CONSTRAINT fk_Medical_handle_student FOREIGN KEY(Regno) 
        REFERENCES User(User_id) -- Assuming PK in Student is 'Regno' or 'Reg_no'
        ON UPDATE CASCADE,

    -- Foreign key 04 : Related to Lecturer (Lec_Handler)
    CONSTRAINT fk_Medical_handle_lec FOREIGN KEY(Lec_Handler) 
        REFERENCES User(User_id)
        ON UPDATE CASCADE
);

+-------------+---------------+------+-----+-------------------+-------------------+
| Field       | Type          | Null | Key | Default           | Extra             |
+-------------+---------------+------+-----+-------------------+-------------------+
| C_code      | char(8)       | NO   | PRI | NULL              |                   |
| C_type      | enum('P','T') | NO   | PRI | NULL              |                   |
| Regno       | char(12)      | NO   | PRI | NULL              |                   |
| Handler     | varchar(12)   | NO   |     | NULL              |                   |
| Lec_Handler | varchar(12)   | NO   | MUL | NULL              |                   |
| Handle_at   | timestamp     | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+-------------+---------------+------+-----+-------------------+-------------------+

-- insert data
INSERT INTO Medical_handle(C_code, C_type, Regno, lec_handler, Handle_at) VALUES
-- handling for students who submitted mid-semester medicals: 
('ICT1233', 'T', 'TG/2023/002', 'LEC/003', '2025-10-02 09:30:00'),
('ICT1253', 'P', 'TG/2023/004', 'LEC/005', '2025-10-03 10:45:00'),
('ICT1233', 'P', 'TG/2023/009', 'LEC/003', '2025-10-03 11:00:00'),
('ENG1222', 'T', 'TG/2023/010', 'LEC/007', '2025-10-01 14:15:00'),
('ICT1253', 'T', 'TG/2023/007', 'LEC/004', '2025-10-02 15:00:00'),

-- Handling for students who submitted end-semester medicals:
('ICT1253', 'P', 'TG/2023/004', 'LEC/005', '2025-11-11 09:00:00'),
('ICT1253', 'T', 'TG/2023/007', 'LEC/004', '2025-11-11 10:00:00'),
('ICT1242', 'T', 'TG/2023/008', 'LEC/002', '2025-11-15 11:30:00'),
('ICT1222', 'P', 'TG/2023/008', 'LEC/001', '2025-11-21 13:00:00'),
('ICT1253', 'T', 'TG/2023/010', 'LEC/004', '2025-11-11 14:00:00'),

-- Handling for students who submitted attendance medicals:
('ENG1222', 'T', 'TG/2023/007', 'LEC/007', '2025-08-06 09:00:00'),
('ICT1233', 'P', 'TG/2023/004', 'LEC/003', '2025-08-09 10:30:00'),
('ICT1253', 'P', 'TG/2023/003', 'LEC/001', '2025-08-16 11:00:00'),
('ICT1222', 'P', 'TG/2023/002', 'LEC/005', '2025-08-27 12:00:00'),
('ICT1253', 'P', 'TG/2023/004', 'LEC/001', '2025-09-03 13:30:00'),
('ICT1222', 'P', 'TG/2023/008', 'LEC/002', '2025-09-12 14:00:00'),
('ICT1212', 'T', 'TG/2023/004', 'LEC/005', '2025-09-13 09:45:00'),
('ICT1233', 'P', 'TG/2023/006', 'LEC/003', '2025-09-26 10:15:00'),
('ICT1242', 'T', 'TG/2023/006', 'LEC/004', '2025-10-05 11:30:00'),
('ICT1242', 'T', 'TG/2023/009', 'LEC/002', '2025-10-23 13:00:00'),
('ICT1233', 'T', 'TG/2023/003', 'LEC/008', '2025-10-25 14:30:00');

+---------+--------+-------------+-------------+---------------------+
| C_code  | C_type | Regno       | Lec_Handler | Handle_at           |
+---------+--------+-------------+-------------+---------------------+
| ICT1233 | T      | TG/2023/002 | LEC/003     | 2025-10-02 09:30:00 |
| ICT1253 | P      | TG/2023/004 | LEC/005     | 2025-10-03 10:45:00 |
| ICT1233 | P      | TG/2023/009 | LEC/003     | 2025-10-03 11:00:00 |
| ENG1222 | T      | TG/2023/010 | LEC/007     | 2025-10-01 14:15:00 |
| ICT1253 | T      | TG/2023/007 | LEC/004     | 2025-10-02 15:00:00 |
| ICT1253 | P      | TG/2023/004 | LEC/005     | 2025-11-11 09:00:00 |
| ICT1253 | T      | TG/2023/007 | LEC/004     | 2025-11-11 10:00:00 |
| ICT1242 | T      | TG/2023/008 | LEC/002     | 2025-11-15 11:30:00 |
| ICT1222 | P      | TG/2023/008 | LEC/001     | 2025-11-21 13:00:00 |
| ICT1253 | T      | TG/2023/010 | LEC/004     | 2025-11-11 14:00:00 |
| ENG1222 | T      | TG/2023/007 | LEC/007     | 2025-08-06 09:00:00 |
| ICT1233 | P      | TG/2023/004 | LEC/003     | 2025-08-09 10:30:00 |
| ICT1253 | P      | TG/2023/003 | LEC/001     | 2025-08-16 11:00:00 |
| ICT1222 | P      | TG/2023/002 | LEC/005     | 2025-08-27 12:00:00 |
| ICT1253 | P      | TG/2023/004 | LEC/001     | 2025-09-03 13:30:00 |
| ICT1222 | P      | TG/2023/008 | LEC/002     | 2025-09-12 14:00:00 |
| ICT1212 | T      | TG/2023/004 | LEC/005     | 2025-09-13 09:45:00 |
| ICT1233 | P      | TG/2023/006 | LEC/003     | 2025-09-26 10:15:00 |
| ICT1242 | T      | TG/2023/006 | LEC/004     | 2025-10-05 11:30:00 |
| ICT1242 | T      | TG/2023/009 | LEC/002     | 2025-10-23 13:00:00 |
| ICT1233 | T      | TG/2023/003 | LEC/008     | 2025-10-25 14:30:00 |
+---------+--------+-------------+-------------+---------------------+

