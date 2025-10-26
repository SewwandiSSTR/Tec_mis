-- Course
CREATE TABLE Course(
  C_code CHAR(8) NOT NULL,
  C_type ENUM('P','T') NOT NULL,
  C_name VARCHAR(50) NOT NULL,
  Credit INT NOT NULL,
  Lec_id CHAR(10) NOT NULL, 
  Dep_id CHAR(5),
  PRIMARY KEY(C_code, C_type),
  
  -- Foreign key 01 : Related to Lecturer (use Lecturer(Lec_id))
  CONSTRAINT fk_course_lec
    FOREIGN KEY (Lec_id) REFERENCES Lecturer(Lec_id)
    ON UPDATE CASCADE,

  -- Foreign key 02 : Related to Department
  CONSTRAINT fk_course_dep
    FOREIGN KEY (Dep_id) REFERENCES Department(Dep_id)
    ON UPDATE CASCADE
);

+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| C_code  | char(8)       | NO   | PRI | NULL    |       |
| C_type  | enum('P','T') | NO   | PRI | NULL    |       |
| C_name  | varchar(50)   | NO   |     | NULL    |       |
| Credit  | int           | NO   |     | NULL    |       |
| C_hours | int           | YES  |     | NULL    |       |
| Lec_id  | char(10)      | NO   | MUL | NULL    |       |
| Dep_id  | char(5)       | YES  | MUL | NULL    |       |
+---------+---------------+------+-----+---------+-------+

-- insert data
-- Course
INSERT INTO Course (C_code,C_type,C_name,Credit,Lec_id,Dep_id)
VALUES
('ICT1212','T','Database Management Systems',2,'LEC/001','DICT'),
('ICT1222','P','Database Management Systems Practicum',2,'LEC/001','DICT'),
('ICT1242','T','Computer Architecture',2,'LEC/002','DICT'),
('ICT1233','T','Server Side Development',3,'LEC/003','DICT'),
('ICT1233','P','Server Side Development',3,'LEC/003','DICT'),
('ICT1253','T','Computer Network',3,'LEC/004','DICT'),
('ICT1253','P','Computer Network',3,'LEC/005','DICT'),
('TMS1233','T','Discrete Mathematics',3,'LEC/006','DENT'),
('ENG1222','T','English II',2,'LEC/007','DMS'),
('TCS1212','T','Fundamentals of Management',2,'LEC/008','DMS');

+---------+--------+---------------------------------------+--------+---------+--------+
| C_code  | C_type | C_name                                | Credit | Lec_id  | Dep_id |
+---------+--------+---------------------------------------+--------+---------+--------+
| ENG1222 | T      | English II                            |      2 | LEC/007 | DMS    |
| ICT1212 | T      | Database Management Systems           |      2 | LEC/001 | DICT   |
| ICT1222 | P      | Database Management Systems Practicum |      2 | LEC/001 | DICT   |
| ICT1233 | P      | Server Side Development               |      3 | LEC/003 | DICT   |
| ICT1233 | T      | Server Side Development               |      3 | LEC/003 | DICT   |
| ICT1242 | T      | Computer Architecture                 |      2 | LEC/002 | DICT   |
| ICT1253 | P      | Computer Network                      |      3 | LEC/005 | DICT   |
| ICT1253 | T      | Computer Network                      |      3 | LEC/004 | DICT   |
| TCS1212 | T      | Fundamentals of Management            |      2 | LEC/008 | DMS    |
| TMS1233 | T      | Discrete Mathematics                  |      3 | LEC/006 | DENT   |
+---------+--------+---------------------------------------+--------+---------+--------+