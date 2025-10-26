
CREATE TABLE Student (
  Reg_no CHAR(12) NOT NULL,
  Fname VARCHAR(50),
  Lname VARCHAR(50),
  dob DATE, 
  email VARCHAR(100) NOT NULL,
  address VARCHAR(150),
  S_type VARCHAR(10) NOT NULL,
  Dep_id CHAR(5),

  PRIMARY KEY (Reg_no),

  CONSTRAINT fk_student_dep FOREIGN KEY (Dep_id) REFERENCES Department(Dep_id)
    ON UPDATE CASCADE ,

  CONSTRAINT fk_student_user FOREIGN KEY (Reg_no) REFERENCES User(User_id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| Reg_no  | char(12)     | NO   | PRI | NULL    |       |
| Fname   | varchar(50)  | YES  |     | NULL    |       |
| Lname   | varchar(50)  | YES  |     | NULL    |       |
| dob     | date         | YES  |     | NULL    |       |
| email   | varchar(100) | NO   |     | NULL    |       |
| address | varchar(150) | YES  |     | NULL    |       |
| S_type  | varchar(10)  | NO   |     | NULL    |       |
| Dep_id  | char(5)      | YES  | MUL | NULL    |       |
+---------+--------------+------+-----+---------+-------+

-- insert data
INSERT INTO Student
(Reg_no,Fname,Lname,dob,email,address, S_type, Dep_id)
VALUES
('TG/2023/001', 'Senali','Wijesinghe', '2003-02-18', 'senali.w@uni.lk','No.2,New Galle Road,Matara','Proper', 'DICT'),
('TG/2023/002', 'Mahela', 'Gamage', '2003-10-25','mahela.g@uni.lk','23/178,Jayapala Road,Kahawatte','Proper', 'DICT'),
('TG/2023/003', 'Ruvini','Bandara', '2003-07-07','ruvini.b@uni.lk','32A,Perera Road,Kelaniya','Proper', 'DICT'),
('TG/2023/004', 'Kasun', 'Liyanage', '2002-04-12','kasun.l@uni.lk','12/75,Seevali Mawatha,Colombo 2','Proper', 'DICT'),
('TG/2023/005', 'Nethmi', 'Fernando', '2004-01-03','nethmi.f@uni.lk','87/345,Gunasinghe Mawatha,Rathmalana','Proper', 'DICT'),
('TG/2023/006', 'Charith', 'Jayasinghe', '2000-12-19','charith.j@uni.lk','65C,First Lane,Kandy','Proper', 'DICT'),
('TG/2023/007', 'Malith', 'Jayaweera', '2002-11-19','malith.jaya@uni.lk','32/1,T.M.Jaya Road,Gampaha','Proper', 'DICT'),
('TG/2023/008', 'Devini','Fonseka', '2003-09-08','devini.f@uni.lk','No.17/2,Sunrise Mawatha,Kandy','Proper', 'DICT'),
('TG/2023/009', 'Praveen','Abeyratne', '2003-05-27','praveen.a@uni.lk','18,Galle Road,Negambo','Proper', 'DICT'),
('TG/2023/010', 'Tharuka','Rodrigo', '2001-03-01','tharuka.r@uni.lk','25/3,Melrose Lane,Colombo 5','Proper', 'DICT'),
('TG/2023/011', 'Nayana','Kaluarachchi', '2003-06-16','nayana.k@uni.lk','Lot 42,Tea-Estate Road,Hatton','Suspend', 'DICT'),
('TG/2022/050', 'Viraj','Costa', '2002-04-05','viraj.c@uni.lk','12/8,Palm Grove Lane,Galle','Repeat', 'DICT'),
('TG/2022/051', 'Malith','Silva', '2001-11-29','malith.s@uni.lk','8/1,Orchid Avenue,Negombo','Repeat', 'DICT'),
('TG/2021/023', 'Gayani','Perera', '2000-08-14','gayani.p@uni.lk','45/7,Coconut Drive,Matara','Repeat', 'DICT'),
('TG/2021/088', 'Buddika','Sadaruwan', '2000-01-20','buddika.s@uni.lk','22A,Rosewood Road,Anuradhapura','Repeat', 'DICT'),
('TG/2021/081', 'Dinith','Maduranga', '2002-01-20','dinith.m@uni.lk','Plot 5,Jasmine Close,Jaffna','Suspend', 'DICT'),
('TG/2020/100', 'Sachini','Karunaratne', '1999-07-03','sachini.k@uni.lk','16/4,Banana Street,Ratnapura','Repeat', 'DICT');

+-------------+---------+--------------+------------+--------------------+--------------------------------------+---------+--------+
| Reg_no      | Fname   | Lname        | dob        | email              | address                              | S_type  | Dep_id |
+-------------+---------+--------------+------------+--------------------+--------------------------------------+---------+--------+
| TG/2020/100 | Sachini | Karunaratne  | 1999-07-03 | sachini.k@uni.lk   | 16/4,Banana Street,Ratnapura         | Repeat  | DICT   |
| TG/2021/023 | Gayani  | Perera       | 2000-08-14 | gayani.p@uni.lk    | 45/7,Coconut Drive,Matara            | Repeat  | DICT   |
| TG/2021/081 | Dinith  | Maduranga    | 2002-01-20 | dinith.m@uni.lk    | Plot 5,Jasmine Close,Jaffna          | Suspend | DICT   |
| TG/2021/088 | Buddika | Sadaruwan    | 2000-01-20 | buddika.s@uni.lk   | 22A,Rosewood Road,Anuradhapura       | Repeat  | DICT   |
| TG/2022/050 | Viraj   | Costa        | 2002-04-05 | viraj.c@uni.lk     | 12/8,Palm Grove Lane,Galle           | Repeat  | DICT   |
| TG/2022/051 | Malith  | Silva        | 2001-11-29 | malith.s@uni.lk    | 8/1,Orchid Avenue,Negombo            | Repeat  | DICT   |
| TG/2023/001 | Senali  | Wijesinghe   | 2003-02-18 | senali.w@uni.lk    | No.2,New Galle Road,Matara           | Proper  | DICT   |
| TG/2023/002 | Mahela  | Gamage       | 2003-10-25 | mahela.g@uni.lk    | 23/178,Jayapala Road,Kahawatte       | Proper  | DICT   |
| TG/2023/003 | Ruvini  | Bandara      | 2003-07-07 | ruvini.b@uni.lk    | 32A,Perera Road,Kelaniya             | Proper  | DICT   |
| TG/2023/004 | Kasun   | Liyanage     | 2002-04-12 | kasun.l@uni.lk     | 12/75,Seevali Mawatha,Colombo 2      | Proper  | DICT   |
| TG/2023/005 | Nethmi  | Fernando     | 2004-01-03 | nethmi.f@uni.lk    | 87/345,Gunasinghe Mawatha,Rathmalana | Proper  | DICT   |
| TG/2023/006 | Charith | Jayasinghe   | 2000-12-19 | charith.j@uni.lk   | 65C,First Lane,Kandy                 | Proper  | DICT   |
| TG/2023/007 | Malith  | Jayaweera    | 2002-11-19 | malith.jaya@uni.lk | 32/1,T.M.Jaya Road,Gampaha           | Proper  | DICT   |
| TG/2023/008 | Devini  | Fonseka      | 2003-09-08 | devini.f@uni.lk    | No.17/2,Sunrise Mawatha,Kandy        | Proper  | DICT   |
| TG/2023/009 | Praveen | Abeyratne    | 2003-05-27 | praveen.a@uni.lk   | 18,Galle Road,Negambo                | Proper  | DICT   |
| TG/2023/010 | Tharuka | Rodrigo      | 2001-03-01 | tharuka.r@uni.lk   | 25/3,Melrose Lane,Colombo 5          | Proper  | DICT   |
| TG/2023/011 | Nayana  | Kaluarachchi | 2003-06-16 | nayana.k@uni.lk    | Lot 42,Tea-Estate Road,Hatton        | Suspend | DICT   |
+-------------+---------+--------------+------------+--------------------+--------------------------------------+---------+--------+