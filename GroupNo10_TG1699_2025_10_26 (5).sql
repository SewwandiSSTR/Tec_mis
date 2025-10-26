-- Lecturer
CREATE TABLE Lecturer(
  Lec_id CHAR(10)  NOT NULL,
  Fullname VARCHAR(100),
  position VARCHAR(30),
  email VARCHAR(30)  NOT NULL,
  gender ENUM('Male','Female','Other'),
  dob DATE,
  Dep_id CHAR(5),

  PRIMARY KEY(Lec_id),

  -- Foreign key 01 : Related to Department
  CONSTRAINT fk_lec_dep
  FOREIGN KEY (Dep_id) REFERENCES Department(Dep_id)
  ON UPDATE CASCADE,

-- Foreign key 02 : Related to User
  FOREIGN KEY (Lec_id) REFERENCES User(User_id)
        ON UPDATE CASCADE
);

+----------+-------------------------------+------+-----+---------+-------+
| Field    | Type                          | Null | Key | Default | Extra |
+----------+-------------------------------+------+-----+---------+-------+
| Lec_id   | char(10)                      | NO   | PRI | NULL    |       |
| Fullname | varchar(100)                  | YES  |     | NULL    |       |
| position | varchar(30)                   | YES  |     | NULL    |       |
| email    | varchar(30)                   | NO   |     | NULL    |       |
| gender   | enum('Male','Female','Other') | YES  |     | NULL    |       |
| dob      | date                          | YES  |     | NULL    |       |
| Dep_id   | char(5)                       | YES  | MUL | NULL    |       |
+----------+-------------------------------+------+-----+---------+-------+

-- insert Data
INSERT INTO Lecturer
(Lec_id,Fullname,position,email,Gender,Dob,Dep_id)
VALUES
('LEC/001','A.S.Kumara','Professor','Kumara@gmail.com','Male','1993-02-13','DICT'),
('LEC/002','K.A.Wasantha','Associate Professor','Wasantha@gmail.com','Female','1992-05-26','DICT'),
('LEC/003','S.K.D.Vitharana','Senior Lecturer','vitharana@gmail.com','Male','1991-01-24','DICT'),
('LEC/004','U.D.Asela','Senior Lecturer','Asela@gmail.com','Female','1995-03-14','DICT'),
('LEC/005','W.D.Roopasinghe','Senior Lecturer','Roopasinghe@gmail.com','Female','1991-07-15','DMS'),
('LEC/006','K.D.S.Jayasooriya','Senior Lecturer','Jayasooriya@gmail.com','Female','1994-08-30','DENT'),
('LEC/007','J.S.Weerakkody','Assistant Lecturer','Weerakkody@gmail.com','Male','1995-05-17','DMS'),
('LEC/008','G.D.Silva','Assistant Lecturer','Silva@gmail.com','Male','1997-06-16','DICT');

+---------+-------------------+---------------------+-----------------------+--------+------------+--------+
| Lec_id  | Fullname          | position            | email                 | gender | dob        | Dep_id |
+---------+-------------------+---------------------+-----------------------+--------+------------+--------+
| LEC/001 | A.S.Kumara        | Professor           | Kumara@gmail.com      | Male   | 1993-02-13 | DICT   |
| LEC/002 | K.A.Wasantha      | Associate Professor | Wasantha@gmail.com    | Female | 1992-05-26 | DICT   |
| LEC/003 | S.K.D.Vitharana   | Senior Lecturer     | vitharana@gmail.com   | Male   | 1991-01-24 | DICT   |
| LEC/004 | U.D.Asela         | Senior Lecturer     | Asela@gmail.com       | Female | 1995-03-14 | DICT   |
| LEC/005 | W.D.Roopasinghe   | Senior Lecturer     | Roopasinghe@gmail.com | Female | 1991-07-15 | DMS    |
| LEC/006 | K.D.S.Jayasooriya | Senior Lecturer     | Jayasooriya@gmail.com | Female | 1994-08-30 | DENT   |
| LEC/007 | J.S.Weerakkody    | Assistant Lecturer  | Weerakkody@gmail.com  | Male   | 1995-05-17 | DMS    |
| LEC/008 | G.D.Silva         | Assistant Lecturer  | Silva@gmail.com       | Male   | 1997-06-16 | DICT   |
+---------+-------------------+---------------------+-----------------------+--------+------------+--------+