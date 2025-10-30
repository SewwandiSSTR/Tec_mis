-- CREATE database
CREATE DATABASE Tec_mis;

-- Use database
USE Tec_mis;

CREATE TABLE User
(
	User_id CHAR(12)  NOT NULL,
	Role VARCHAR(30) NOT NULL,
	Password VARCHAR(50) NOT NULL,
	PRIMARY KEY(User_id)
);
-- User insert Data
INSERT INTO User
(User_id,Role,Password) -- Must use 'Passwod'
VALUES
('LEC/001','Lecturer','Lec1@fot'),
('LEC/002','Lecturer','Lec2@fot'),
('LEC/003','Lecturer','Lec2@fot'),
('LEC/004','Lecturer','Lec2@fot'),
('LEC/005','Lecturer','Lec2@fot'),
('LEC/006','Lecturer','Lec2@fot'),
('LEC/007','Lecturer','Lec2@fot'),
('LEC/008','Lecturer','Lec2@fot'),
('Admin/Fot/01','Admin','Admin1@fot'),
('Tech/Fot/001','TO','Technical1@fot'), 
('Tech/Fot/002','TO','Technical1@fot'), 
('Tech/Fot/003','TO','Technical1@fot'), 
('Tech/Fot/004','TO','Technical1@fot'), 
('Tech/Fot/005','TO','Technical1@fot'), 
('TG/2023/001','Student','Stu001@fot'),
('TG/2023/002','Student','Stu002@fot'),
('TG/2023/003','Student','Stu003@fot'),
('TG/2023/004','Student','Stu004@fot'),
('TG/2023/005','Student','Stu005@fot'),
('TG/2023/006','Student','Stu006@fot'),
('TG/2023/007','Student','Stu007@fot'),
('TG/2023/008','Student','Stu008@fot'),
('TG/2023/009','Student','Stud009@fot'),
('TG/2023/010','Student','Stu010@fot'),
('TG/2023/011','Student','Stu011@fot'),
('TG/2022/050','Student','Stu050@fot'),
('TG/2022/051','Student','Stu051@fot'),
('TG/2021/023','Student','Stu023@fot'),
('TG/2021/088','Student','Stu088@fot'),
('TG/2021/081','Student','Stu081@fot'),
('TG/2020/100','Student','Stu100@fot'),
('Dean/Fot/001','Dean','Dean1@fot'),
('TG/2020/010', 'Student','Stud010@fot'),
('TG/2021/006','Student','Stud006@fot');

-- Admin
CREATE TABLE Admin(
	Admin_id CHAR(12)  NOT NULL,
	F_name VARCHAR(50) NOT NULL,
	L_name VARCHAR(50) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Dob DATE ,

	PRIMARY KEY(Admin_id),

    -- Foreign key 01 : Related to User
  FOREIGN KEY (Admin_id) REFERENCES User(User_id)
        ON UPDATE CASCADE
);

-- INSERT Admin 
INSERT INTO Admin 
(Admin_id,F_name,L_name,Email,Address,Dob)
VALUES 
('Admin/Fot/01','Amali','Jayawardena','a.jayawardena@uni.lk','2/A Kandy Rd, Colombo 07','1975-08-15');

-- Dean 
CREATE TABLE Dean(
    D_id CHAR(12) NOT NULL PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    Address VARCHAR(100),
    Dob DATE,

    -- Foreign key 01 : Related to User
  FOREIGN KEY (D_id) REFERENCES User(User_id)
        ON UPDATE CASCADE
);
-- To dean Insert
INSERT INTO Dean (D_id, Fname, Lname, Email, Address, Dob) VALUES
('Dean/Fot/001', 'Nimal', 'Perera','n.perera@uni.lk', '45 Galle Rd, Dehiwala', '1993-02-10');

-- Technical_officer
CREATE TABLE Technical_officer(
    Tec_id CHAR(12) NOT NULL,
    F_Name VARCHAR(50) NOT NULL,
    L_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Dob DATE,
    
    PRIMARY KEY(Tec_id),

    -- Foreign key 01 : Related to User
    FOREIGN KEY (Tec_id) REFERENCES User(User_id)
        ON UPDATE CASCADE
);
-- Insert Values
-- TO Tech_officer
INSERT INTO Technical_officer
	(Tec_id,F_Name,L_Name,Email,Address,Dob)
VALUES
('Tech/Fot/001','Dilini','Rathnayake','d.rathnayake@uni.lk','5 School Lane, Matara','1987-03-08'),
('Tech/Fot/002','Asela','Senanayake','a.senanayake@uni.lk','45/1 Beach Road, Trincomalee','1994-11-03'),
('Tech/Fot/003','Priyanka','Hewage','p.hewage@uni.lk','10 Flower Road, Ratnapura','1982-12-15'),
('Tech/Fot/004','Saman','Rajapaksha','s.rajapaksha@uni.lk','7/2 Lake View, Badulla','1976-06-28'),
('Tech/Fot/005','Malani','De Silva','m.desilva@uni.lk','25/1 Rosmaid Place, Colombo 03','1968-10-18');

-- Department
CREATE TABLE Department(
  Dep_id CHAR(5)  NOT NULL,
  Dep_name VARCHAR(50)  NOT NULL,
  PRIMARY KEY(Dep_id)
);

-- insert values
INSERT INTO Department
(Dep_id,Dep_name)
VALUES
('DICT','Information and Communication Technology'),
('DMS','Multidiciplinary Studies'),
('DENT','Engineering Technology');

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

-- Course Enrollment
CREATE TABLE Course_Enrollment(
	C_code CHAR(8) NOT NULL,
	C_type ENUM('P','T') NOT NULL,
	Regno CHAR(12) NOT NULL,
	PRIMARY KEY(C_code,C_type,Regno),

	-- Foreign key 1:Relate to the Course
	CONSTRAINT fk_EnrollCourse FOREIGN KEY(C_code,C_type) REFERENCES Course(C_code,C_type)
    ON UPDATE CASCADE,

	-- Foreign key 2:Relate to the Student
	CONSTRAINT fk_EnrollStudent FOREIGN KEY(Regno) REFERENCES User(User_id) 
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- insert data
INSERT INTO Course_Enrollment
(Regno,C_code,C_type)
VALUES
('TG/2023/001','ENG1222','T'),
('TG/2023/002','ENG1222','T'),
('TG/2023/003','ENG1222','T'),
('TG/2023/004','ENG1222','T'),
('TG/2023/006','ENG1222','T'),
('TG/2023/007','ENG1222','T'),
('TG/2023/008','ENG1222','T'),
('TG/2023/009','ENG1222','T'),
('TG/2023/010','ENG1222','T'),

('TG/2023/001','ICT1212','T'),
('TG/2023/002','ICT1212','T'),
('TG/2023/003','ICT1212','T'),
('TG/2023/004','ICT1212','T'),
('TG/2023/005','ICT1212','T'),
('TG/2023/006','ICT1212','T'),
('TG/2023/007','ICT1212','T'),
('TG/2023/008','ICT1212','T'),
('TG/2023/009','ICT1212','T'),
('TG/2023/010','ICT1212','T'),

('TG/2023/001','ICT1222','P'),
('TG/2023/002','ICT1222','P'),
('TG/2023/003','ICT1222','P'),
('TG/2023/004','ICT1222','P'),
('TG/2023/005','ICT1222','P'),
('TG/2023/006','ICT1222','P'),
('TG/2023/007','ICT1222','P'),
('TG/2023/008','ICT1222','P'),
('TG/2023/009','ICT1222','P'),
('TG/2023/010','ICT1222','P'),

('TG/2023/001','ICT1233','T'),
('TG/2023/002','ICT1233','T'),
('TG/2023/003','ICT1233','T'),
('TG/2023/004','ICT1233','T'),
('TG/2023/005','ICT1233','T'),
('TG/2023/006','ICT1233','T'),
('TG/2023/007','ICT1233','T'),
('TG/2023/008','ICT1233','T'),
('TG/2023/009','ICT1233','T'),
('TG/2023/010','ICT1233','T'),

('TG/2023/001','ICT1233','P'),
('TG/2023/002','ICT1233','P'),
('TG/2023/003','ICT1233','P'),
('TG/2023/004','ICT1233','P'),
('TG/2023/005','ICT1233','P'),
('TG/2023/006','ICT1233','P'),
('TG/2023/007','ICT1233','P'),
('TG/2023/008','ICT1233','P'),
('TG/2023/009','ICT1233','P'),
('TG/2023/010','ICT1233','P'),

('TG/2023/001','ICT1242','T'),
('TG/2023/002','ICT1242','T'),
('TG/2023/003','ICT1242','T'),
('TG/2023/004','ICT1242','T'),
('TG/2023/005','ICT1242','T'),
('TG/2023/006','ICT1242','T'),
('TG/2023/007','ICT1242','T'),
('TG/2023/008','ICT1242','T'),
('TG/2023/009','ICT1242','T'),
('TG/2023/010','ICT1242','T'),

('TG/2023/001','ICT1253','T'),
('TG/2023/002','ICT1253','T'),
('TG/2023/003','ICT1253','T'),
('TG/2023/004','ICT1253','T'),
('TG/2023/005','ICT1253','T'),
('TG/2023/006','ICT1253','T'),
('TG/2023/007','ICT1253','T'),
('TG/2023/008','ICT1253','T'),
('TG/2023/009','ICT1253','T'),
('TG/2023/010','ICT1253','T'),

('TG/2023/001','ICT1253','P'),
('TG/2023/002','ICT1253','P'),
('TG/2023/003','ICT1253','P'),
('TG/2023/004','ICT1253','P'),
('TG/2023/005','ICT1253','P'),
('TG/2023/006','ICT1253','P'),
('TG/2023/007','ICT1253','P'),
('TG/2023/008','ICT1253','P'),
('TG/2023/009','ICT1253','P'),
('TG/2023/010','ICT1253','P'),

('TG/2023/001','TCS1212','T'),
('TG/2023/002','TCS1212','T'),
('TG/2023/003','TCS1212','T'),
('TG/2023/004','TCS1212','T'),
('TG/2023/005','TCS1212','T'),
('TG/2023/006','TCS1212','T'),
('TG/2023/007','TCS1212','T'),
('TG/2023/008','TCS1212','T'),
('TG/2023/009','TCS1212','T'),
('TG/2023/010','TCS1212','T'),

('TG/2023/001','TMS1233','T'),
('TG/2023/002','TMS1233','T'),
('TG/2023/003','TMS1233','T'),
('TG/2023/004','TMS1233','T'),
('TG/2023/005','TMS1233','T'),
('TG/2023/006','TMS1233','T'),
('TG/2023/007','TMS1233','T'),
('TG/2023/008','TMS1233','T'),
('TG/2023/009','TMS1233','T'),
('TG/2023/010','TMS1233','T'),

('TG/2021/006','TMS1233','T'),
('TG/2020/010','TCS1212','T'),
('TG/2021/023','ICT1242','T'),
('TG/2021/088','TMS1233','T');

-- Attendence
CREATE TABLE Attendence(
	C_code CHAR(8) NOT NULL,
	C_type ENUM('P','T') NOT NULL,
	Regno CHAR(12) NOT NULL,
	Week INT NOT NULL,
    Date Date,
	Status VARCHAR(7) NOT NULL,
	L_Hours INT NOT NULL,

	PRIMARY KEY(Regno,C_code,C_type,week),

	-- Foreign key 1:Relate to the Course
	CONSTRAINT fk_CourseAttend FOREIGN KEY(C_code,C_type) REFERENCES Course(C_code,C_type)
    ON UPDATE CASCADE,

	-- Foreign key 2:Relate to the Student
	CONSTRAINT fk_StudentAttend FOREIGN KEY(Regno) REFERENCES User(User_id)
    ON UPDATE CASCADE ON DELETE CASCADE

);

-- insert data
INSERT INTO Attendence (Regno, C_code, C_type, Week, Status, L_Hours, Date)
VALUES
('TG/2023/001','ENG1222','T',1,'Present',2,"2025-08-08"),
('TG/2023/002','ENG1222','T',1,'Present',2,"2025-08-08"),
('TG/2023/003','ENG1222','T',1,'Present',2,"2025-08-08"),
('TG/2023/004','ENG1222','T',1,'Present',2,"2025-08-08"),
('TG/2023/005','ENG1222','T',1,'Present',2,"2025-08-08"),
('TG/2023/006','ENG1222','T',1,'Absent',2,"2025-08-08"),
('TG/2023/007','ENG1222','T',1,'Medical',2,"2025-08-08"),
('TG/2023/008','ENG1222','T',1,'Present',2,"2025-08-08"),
('TG/2023/009','ENG1222','T',1,'Present',2,"2025-08-08"),
('TG/2023/010','ENG1222','T',1,'Present',2,"2025-08-08"),

('TG/2023/001','ICT1212','T',1,'Present',2,"2025-08-07"),
('TG/2023/002','ICT1212','T',1,'Present',2,"2025-08-07"),
('TG/2023/003','ICT1212','T',1,'Present',2,"2025-08-07"),
('TG/2023/004','ICT1212','T',1,'Present',2,"2025-08-07"),
('TG/2023/005','ICT1212','T',1,'Present',2,"2025-08-07"),
('TG/2023/006','ICT1212','T',1,'Present',2,"2025-08-07"),
('TG/2023/007','ICT1212','T',1,'Present',2,"2025-08-07"),
('TG/2023/008','ICT1212','T',1,'Present',2,"2025-08-07"),
('TG/2023/009','ICT1212','T',1,'Present',2,"2025-08-07"),
('TG/2023/010','ICT1212','T',1,'Present',2,"2025-08-07"),
('TG/2023/001','ICT1222','P',1,'Present',4,"2025-08-07"),
('TG/2023/002','ICT1222','P',1,'Present',4,"2025-08-07"),
('TG/2023/003','ICT1222','P',1,'Present',4,"2025-08-07"),
('TG/2023/004','ICT1222','P',1,'Present',4,"2025-08-07"),
('TG/2023/005','ICT1222','P',1,'Present',4,"2025-08-07"),
('TG/2023/006','ICT1222','P',1,'Present',4,"2025-08-07"),
('TG/2023/007','ICT1222','P',1,'Present',4,"2025-08-07"),
('TG/2023/008','ICT1222','P',1,'Present',4,"2025-08-07"),
('TG/2023/009','ICT1222','P',1,'Present',4,"2025-08-07"),
('TG/2023/010','ICT1222','P',1,'Present',4,"2025-08-07"),

('TG/2023/001','ICT1233','P',1,'Present',2,"2025-08-04"),
('TG/2023/002','ICT1233','P',1,'Present',2,"2025-08-04"),
('TG/2023/003','ICT1233','P',1,'Present',2,"2025-08-04"),
('TG/2023/004','ICT1233','P',1,'Medical',2,"2025-08-04"),
('TG/2023/005','ICT1233','P',1,'Present',2,"2025-08-04"),
('TG/2023/006','ICT1233','P',1,'Absent',2,"2025-08-04"),
('TG/2023/007','ICT1233','P',1,'Present',2,"2025-08-04"),
('TG/2023/008','ICT1233','P',1,'Present',2,"2025-08-04"),
('TG/2023/009','ICT1233','P',1,'Present',2,"2025-08-04"),
('TG/2023/010','ICT1233','P',1,'Present',2,"2025-08-04"),

('TG/2023/001','ICT1233','T',1,'Present',2,"2025-08-04"),
('TG/2023/002','ICT1233','T',1,'Present',2,"2025-08-04"),
('TG/2023/003','ICT1233','T',1,'Present',2,"2025-08-04"),
('TG/2023/004','ICT1233','T',1,'Present',2,"2025-08-04"),
('TG/2023/005','ICT1233','T',1,'Present',2,"2025-08-04"),
('TG/2023/006','ICT1233','T',1,'Present',2,"2025-08-04"),
('TG/2023/007','ICT1233','T',1,'Present',2,"2025-08-04"),
('TG/2023/008','ICT1233','T',1,'Present',2,"2025-08-04"),
('TG/2023/009','ICT1233','T',1,'Present',2,"2025-08-04"),
('TG/2023/010','ICT1233','T',1,'Present',2,"2025-08-04"),

('TG/2023/001','ICT1253','P',1,'Present',2,"2025-08-05"),
('TG/2023/002','ICT1253','P',1,'Present',2,"2025-08-05"),
('TG/2023/003','ICT1253','P',1,'Present',2,"2025-08-05"),
('TG/2023/004','ICT1253','P',1,'Present',2,"2025-08-05"),
('TG/2023/005','ICT1253','P',1,'Present',2,"2025-08-05"),
('TG/2023/006','ICT1253','P',1,'Present',2,"2025-08-05"),
('TG/2023/007','ICT1253','P',1,'Present',2,"2025-08-05"),
('TG/2023/008','ICT1253','P',1,'Present',2,"2025-08-05"),
('TG/2023/009','ICT1253','P',1,'Present',2,"2025-08-05"),
('TG/2023/010','ICT1253','P',1,'Present',2,"2025-08-05"),

('TG/2023/001','ICT1253','T',1,'Present',2,"2025-08-05"),
('TG/2023/002','ICT1253','T',1,'Present',2,"2025-08-05"),
('TG/2023/003','ICT1253','T',1,'Present',2,"2025-08-05"),
('TG/2023/004','ICT1253','T',1,'Present',2,"2025-08-05"),
('TG/2023/005','ICT1253','T',1,'Present',2,"2025-08-05"),
('TG/2023/006','ICT1253','T',1,'Present',2,"2025-08-05"),
('TG/2023/007','ICT1253','T',1,'Present',2,"2025-08-05"),
('TG/2023/008','ICT1253','T',1,'Present',2,"2025-08-05"),
('TG/2023/009','ICT1253','T',1,'Present',2,"2025-08-05"),
('TG/2023/010','ICT1253','T',1,'Present',2,"2025-08-05"),

('TG/2023/001','ICT1242','T',1,'Present',2,"2025-08-05"),
('TG/2023/002','ICT1242','T',1,'Present',2,"2025-08-05"),
('TG/2023/003','ICT1242','T',1,'Present',2,"2025-08-05"),
('TG/2023/004','ICT1242','T',1,'Present',2,"2025-08-05"),
('TG/2023/005','ICT1242','T',1,'Present',2,"2025-08-05"),
('TG/2023/006','ICT1242','T',1,'Present',2,"2025-08-05"),
('TG/2023/007','ICT1242','T',1,'Present',2,"2025-08-05"),
('TG/2023/008','ICT1242','T',1,'Present',2,"2025-08-05"),
('TG/2023/009','ICT1242','T',1,'Present',2,"2025-08-05"),
('TG/2023/010','ICT1242','T',1,'Present',2,"2025-08-05"),

('TG/2023/001','TCS1212','T',1,'Present',2,"2025-08-08"),
('TG/2023/002','TCS1212','T',1,'Present',2,"2025-08-08"),
('TG/2023/003','TCS1212','T',1,'Present',2,"2025-08-08"),
('TG/2023/004','TCS1212','T',1,'Present',2,"2025-08-08"),
('TG/2023/005','TCS1212','T',1,'Present',2,"2025-08-08"),
('TG/2023/006','TCS1212','T',1,'Present',2,"2025-08-08"),
('TG/2023/007','TCS1212','T',1,'Present',2,"2025-08-08"),
('TG/2023/008','TCS1212','T',1,'Present',2,"2025-08-08"),
('TG/2023/009','TCS1212','T',1,'Present',2,"2025-08-08"),
('TG/2023/010','TCS1212','T',1,'Present',2,"2025-08-08"),

('TG/2023/001','TMS1233','T',1,'Present',3,"2025-08-06"),
('TG/2023/002','TMS1233','T',1,'Present',3,"2025-08-06"),
('TG/2023/003','TMS1233','T',1,'Present',3,"2025-08-06"),
('TG/2023/004','TMS1233','T',1,'Present',3,"2025-08-06"),
('TG/2023/005','TMS1233','T',1,'Present',3,"2025-08-06"),
('TG/2023/006','TMS1233','T',1,'Present',3,"2025-08-06"),
('TG/2023/007','TMS1233','T',1,'Present',3,"2025-08-06"),
('TG/2023/008','TMS1233','T',1,'Present',3,"2025-08-06"),
('TG/2023/009','TMS1233','T',1,'Present',3,"2025-08-06"),
('TG/2023/010','TMS1233','T',1,'Present',3,"2025-08-06"),

('TG/2023/001','ENG1222','T',2,'Present',2,"2025-08-15"),
('TG/2023/002','ENG1222','T',2,'Present',2,"2025-08-15"),
('TG/2023/003','ENG1222','T',2,'Present',2,"2025-08-15"),
('TG/2023/004','ENG1222','T',2,'Present',2,"2025-08-15"),
('TG/2023/005','ENG1222','T',2,'Present',2,"2025-08-15"),
('TG/2023/006','ENG1222','T',2,'Present',2,"2025-08-15"),
('TG/2023/007','ENG1222','T',2,'Present',2,"2025-08-15"),
('TG/2023/008','ENG1222','T',2,'Present',2,"2025-08-15"),
('TG/2023/009','ENG1222','T',2,'Present',2,"2025-08-15"),
('TG/2023/010','ENG1222','T',2,'Present',2,"2025-08-15"),

('TG/2023/001','ICT1212','T',2,'Present',2,"2025-08-14"),
('TG/2023/002','ICT1212','T',2,'Present',2,"2025-08-14"),
('TG/2023/003','ICT1212','T',2,'Present',2,"2025-08-14"),
('TG/2023/004','ICT1212','T',2,'Present',2,"2025-08-14"),
('TG/2023/005','ICT1212','T',2,'Present',2,"2025-08-14"),
('TG/2023/006','ICT1212','T',2,'Present',2,"2025-08-14"),
('TG/2023/007','ICT1212','T',2,'Present',2,"2025-08-14"),
('TG/2023/008','ICT1212','T',2,'Present',2,"2025-08-14"),
('TG/2023/009','ICT1212','T',2,'Present',2,"2025-08-14"),
('TG/2023/010','ICT1212','T',2,'Present',2,"2025-08-14"),

('TG/2023/001','ICT1222','P',2,'Present',4,"2025-08-14"),
('TG/2023/002','ICT1222','P',2,'Present',4,"2025-08-14"),
('TG/2023/003','ICT1222','P',2,'Medical',4,"2025-08-14"),
('TG/2023/004','ICT1222','P',2,'Present',4,"2025-08-14"),
('TG/2023/005','ICT1222','P',2,'Present',4,"2025-08-14"),
('TG/2023/006','ICT1222','P',2,'Present',4,"2025-08-14"),
('TG/2023/007','ICT1222','P',2,'Present',4,"2025-08-14"), 
('TG/2023/008','ICT1222','P',2,'Present',4,"2025-08-14"),
('TG/2023/009','ICT1222','P',2,'Present',4,"2025-08-14"),
('TG/2023/010','ICT1222','P',2,'Present',4,"2025-08-14"), 

('TG/2023/001','ICT1233','P',2,'Present',2,"2025-08-11"),
('TG/2023/002','ICT1233','P',2,'Present',2,"2025-08-11"),
('TG/2023/003','ICT1233','P',2,'Present',2,"2025-08-11"),
('TG/2023/004','ICT1233','P',2,'Present',2,"2025-08-11"),
('TG/2023/005','ICT1233','P',2,'Present',2,"2025-08-11"),
('TG/2023/006','ICT1233','P',2,'Present',2,"2025-08-11"),
('TG/2023/007','ICT1233','P',2,'Present',2,"2025-08-11"),
('TG/2023/008','ICT1233','P',2,'Present',2,"2025-08-11"),
('TG/2023/009','ICT1233','P',2,'Present',2,"2025-08-11"),
('TG/2023/010','ICT1233','P',2,'Present',2,"2025-08-11"),

('TG/2023/001','ICT1233','T',2,'Present',2,"2025-08-11"),
('TG/2023/002','ICT1233','T',2,'Present',2,"2025-08-11"),
('TG/2023/003','ICT1233','T',2,'Present',2,"2025-08-11"),
('TG/2023/004','ICT1233','T',2,'Present',2,"2025-08-11"),
('TG/2023/005','ICT1233','T',2,'Present',2,"2025-08-11"),
('TG/2023/006','ICT1233','T',2,'Present',2,"2025-08-11"),
('TG/2023/007','ICT1233','T',2,'Present',2,"2025-08-11"),
('TG/2023/008','ICT1233','T',2,'Present',2,"2025-08-11"),
('TG/2023/009','ICT1233','T',2,'Present',2,"2025-08-11"),
('TG/2023/010','ICT1233','T',2,'Present',2,"2025-08-11"),

('TG/2023/001','ICT1253','P',2,'Present',2,"2025-08-12"),
('TG/2023/002','ICT1253','P',2,'Absent',2,"2025-08-12"),
('TG/2023/003','ICT1253','P',2,'Present',2,"2025-08-12"),
('TG/2023/004','ICT1253','P',2,'Present',2,"2025-08-12"),
('TG/2023/005','ICT1253','P',2,'Present',2,"2025-08-12"),
('TG/2023/006','ICT1253','P',2,'Present',2,"2025-08-12"),
('TG/2023/007','ICT1253','P',2,'Present',2,"2025-08-12"),
('TG/2023/008','ICT1253','P',2,'Present',2,"2025-08-12"),
('TG/2023/009','ICT1253','P',2,'Present',2,"2025-08-12"),
('TG/2023/010','ICT1253','P',2,'Present',2,"2025-08-12"),

('TG/2023/001','ICT1253','T',2,'Present',2,"2025-08-12"),
('TG/2023/002','ICT1253','T',2,'Present',2,"2025-08-12"),
('TG/2023/003','ICT1253','T',2,'Present',2,"2025-08-12"),
('TG/2023/004','ICT1253','T',2,'Present',2,"2025-08-12"),
('TG/2023/005','ICT1253','T',2,'Present',2,"2025-08-12"),
('TG/2023/006','ICT1253','T',2,'Present',2,"2025-08-12"),
('TG/2023/007','ICT1253','T',2,'Present',2,"2025-08-12"),
('TG/2023/008','ICT1253','T',2,'Present',2,"2025-08-12"),
('TG/2023/009','ICT1253','T',2,'Present',2,"2025-08-12"),
('TG/2023/010','ICT1253','T',2,'Present',2,"2025-08-12"),

('TG/2023/001','ICT1242','T',2,'Present',2,"2025-08-12"),
('TG/2023/002','ICT1242','T',2,'Present',2,"2025-08-12"),
('TG/2023/003','ICT1242','T',2,'Present',2,"2025-08-12"),
('TG/2023/004','ICT1242','T',2,'Present',2,"2025-08-12"),
('TG/2023/005','ICT1242','T',2,'Present',2,"2025-08-12"),
('TG/2023/006','ICT1242','T',2,'Present',2,"2025-08-12"),
('TG/2023/007','ICT1242','T',2,'Present',2,"2025-08-12"), 
('TG/2023/008','ICT1242','T',2,'Present',2,"2025-08-12"),
('TG/2023/009','ICT1242','T',2,'Present',2,"2025-08-12"),
('TG/2023/010','ICT1242','T',2,'Present',2,"2025-08-12"),

('TG/2023/001','TCS1212','T',2,'Present',2,"2025-08-15"),
('TG/2023/002','TCS1212','T',2,'Present',2,"2025-08-15"),
('TG/2023/003','TCS1212','T',2,'Present',2,"2025-08-15"),
('TG/2023/004','TCS1212','T',2,'Present',2,"2025-08-15"),
('TG/2023/005','TCS1212','T',2,'Present',2,"2025-08-15"),
('TG/2023/006','TCS1212','T',2,'Present',2,"2025-08-15"),
('TG/2023/007','TCS1212','T',2,'Present',2,"2025-08-15"),
('TG/2023/008','TCS1212','T',2,'Present',2,"2025-08-15"),
('TG/2023/009','TCS1212','T',2,'Present',2,"2025-08-15"),
('TG/2023/010','TCS1212','T',2,'Present',2,"2025-08-15"),

('TG/2023/001','TMS1233','T',2,'Present',3,"2025-08-13"),
('TG/2023/002','TMS1233','T',2,'Present',3,"2025-08-13"),
('TG/2023/003','TMS1233','T',2,'Present',3,"2025-08-13"),
('TG/2023/004','TMS1233','T',2,'Present',3,"2025-08-13"),
('TG/2023/005','TMS1233','T',2,'Present',3,"2025-08-13"),
('TG/2023/006','TMS1233','T',2,'Present',3,"2025-08-13"),
('TG/2023/007','TMS1233','T',2,'Present',3,"2025-08-13"),
('TG/2023/008','TMS1233','T',2,'Present',3,"2025-08-13"),
('TG/2023/009','TMS1233','T',2,'Present',3,"2025-08-13"),
('TG/2023/010','TMS1233','T',2,'Present',3,"2025-08-13"),

('TG/2023/001','ENG1222','T',3,'Present',2,"2025-08-22"),
('TG/2023/002','ENG1222','T',3,'Present',2,"2025-08-22"),
('TG/2023/003','ENG1222','T',3,'Present',2,"2025-08-22"),
('TG/2023/004','ENG1222','T',3,'Present',2,"2025-08-22"),
('TG/2023/005','ENG1222','T',3,'Present',2,"2025-08-22"),
('TG/2023/006','ENG1222','T',3,'Present',2,"2025-08-22"),
('TG/2023/007','ENG1222','T',3,'Present',2,"2025-08-22"),
('TG/2023/008','ENG1222','T',3,'Present',2,"2025-08-22"),
('TG/2023/009','ENG1222','T',3,'Present',2,"2025-08-22"),
('TG/2023/010','ENG1222','T',3,'Present',2,"2025-08-22"),

('TG/2023/001','ICT1212','T',3,'Present',2,"2025-08-21"),
('TG/2023/002','ICT1212','T',3,'Present',2,"2025-08-21"),
('TG/2023/003','ICT1212','T',3,'Present',2,"2025-08-21"),
('TG/2023/004','ICT1212','T',3,'Present',2,"2025-08-21"),
('TG/2023/005','ICT1212','T',3,'Present',2,"2025-08-21"),
('TG/2023/006','ICT1212','T',3,'Present',2,"2025-08-21"),
('TG/2023/007','ICT1212','T',3,'Present',2,"2025-08-21"),
('TG/2023/008','ICT1212','T',3,'Present',2,"2025-08-21"),
('TG/2023/009','ICT1212','T',3,'Present',2,"2025-08-21"),
('TG/2023/010','ICT1212','T',3,'Present',2,"2025-08-21"),

('TG/2023/001','ICT1222','P',3,'Present',4,"2025-08-21"),
('TG/2023/002','ICT1222','P',3,'Present',4,"2025-08-21"),
('TG/2023/003','ICT1222','P',3,'Present',4,"2025-08-21"),
('TG/2023/004','ICT1222','P',3,'Absent',4,"2025-08-21"),
('TG/2023/005','ICT1222','P',3,'Present',4,"2025-08-21"),
('TG/2023/006','ICT1222','P',3,'Present',4,"2025-08-21"),
('TG/2023/007','ICT1222','P',3,'Present',4,"2025-08-21"), 
('TG/2023/008','ICT1222','P',3,'Present',4,"2025-08-21"),
('TG/2023/009','ICT1222','P',3,'Present',4,"2025-08-21"),
('TG/2023/010','ICT1222','P',3,'Present',4,"2025-08-21"), 

('TG/2023/001','ICT1233','P',3,'Present',2,"2025-08-18"),
('TG/2023/002','ICT1233','P',3,'Present',2,"2025-08-18"),
('TG/2023/003','ICT1233','P',3,'Present',2,"2025-08-18"),
('TG/2023/004','ICT1233','P',3,'Present',2,"2025-08-18"),
('TG/2023/005','ICT1233','P',3,'Present',2,"2025-08-18"),
('TG/2023/006','ICT1233','P',3,'Absent',2,"2025-08-18"),
('TG/2023/007','ICT1233','P',3,'Present',2,"2025-08-18"),
('TG/2023/008','ICT1233','P',3,'Present',2,"2025-08-18"),
('TG/2023/009','ICT1233','P',3,'Present',2,"2025-08-18"),
('TG/2023/010','ICT1233','P',3,'Present',2,"2025-08-18"),

('TG/2023/001','ICT1233','T',3,'Present',2,"2025-08-18"),
('TG/2023/002','ICT1233','T',3,'Present',2,"2025-08-18"),
('TG/2023/003','ICT1233','T',3,'Present',2,"2025-08-18"),
('TG/2023/004','ICT1233','T',3,'Present',2,"2025-08-18"),
('TG/2023/005','ICT1233','T',3,'Present',2,"2025-08-18"),
('TG/2023/006','ICT1233','T',3,'Present',2,"2025-08-18"),
('TG/2023/007','ICT1233','T',3,'Present',2,"2025-08-18"),
('TG/2023/008','ICT1233','T',3,'Present',2,"2025-08-18"),
('TG/2023/009','ICT1233','T',3,'Present',2,"2025-08-18"),
('TG/2023/010','ICT1233','T',3,'Present',2,"2025-08-18"),

('TG/2023/001','ICT1253','P',3,'Present',2,"2025-08-19"),
('TG/2023/002','ICT1253','P',3,'Present',2,"2025-08-19"),
('TG/2023/003','ICT1253','P',3,'Present',2,"2025-08-19"),
('TG/2023/004','ICT1253','P',3,'Present',2,"2025-08-19"),
('TG/2023/005','ICT1253','P',3,'Present',2,"2025-08-19"),
('TG/2023/006','ICT1253','P',3,'Present',2,"2025-08-19"),
('TG/2023/007','ICT1253','P',3,'Present',2,"2025-08-19"),
('TG/2023/008','ICT1253','P',3,'Present',2,"2025-08-19"),
('TG/2023/009','ICT1253','P',3,'Present',2,"2025-08-19"),
('TG/2023/010','ICT1253','P',3,'Present',2,"2025-08-19"),

('TG/2023/001','ICT1253','T',3,'Present',2,"2025-08-19"),
('TG/2023/002','ICT1253','T',3,'Present',2,"2025-08-19"),
('TG/2023/003','ICT1253','T',3,'Present',2,"2025-08-19"),
('TG/2023/004','ICT1253','T',3,'Present',2,"2025-08-19"),
('TG/2023/005','ICT1253','T',3,'Present',2,"2025-08-19"),
('TG/2023/006','ICT1253','T',3,'Present',2,"2025-08-19"),
('TG/2023/007','ICT1253','T',3,'Present',2,"2025-08-19"),
('TG/2023/008','ICT1253','T',3,'Present',2,"2025-08-19"),
('TG/2023/009','ICT1253','T',3,'Present',2,"2025-08-19"),
('TG/2023/010','ICT1253','T',3,'Present',2,"2025-08-19"),

('TG/2023/001','ICT1242','T',3,'Present',2,"2025-08-19"),
('TG/2023/002','ICT1242','T',3,'Present',2,"2025-08-19"),
('TG/2023/003','ICT1242','T',3,'Present',2,"2025-08-19"),
('TG/2023/004','ICT1242','T',3,'Present',2,"2025-08-19"),
('TG/2023/005','ICT1242','T',3,'Present',2,"2025-08-19"),
('TG/2023/006','ICT1242','T',3,'Present',2,"2025-08-19"),
('TG/2023/007','ICT1242','T',3,'Present',2,"2025-08-19"),
('TG/2023/008','ICT1242','T',3,'Present',2,"2025-08-19"),
('TG/2023/009','ICT1242','T',3,'Present',2,"2025-08-19"),
('TG/2023/010','ICT1242','T',3,'Present',2,"2025-08-19"),

('TG/2023/001','TCS1212','T',3,'Present',2,"2025-08-22"),
('TG/2023/002','TCS1212','T',3,'Present',2,"2025-08-22"),
('TG/2023/003','TCS1212','T',3,'Present',2,"2025-08-22"),
('TG/2023/004','TCS1212','T',3,'Present',2,"2025-08-22"),
('TG/2023/005','TCS1212','T',3,'Present',2,"2025-08-22"),
('TG/2023/006','TCS1212','T',3,'Present',2,"2025-08-22"),
('TG/2023/007','TCS1212','T',3,'Present',2,"2025-08-22"),
('TG/2023/008','TCS1212','T',3,'Present',2,"2025-08-22"),
('TG/2023/009','TCS1212','T',3,'Present',2,"2025-08-22"),
('TG/2023/010','TCS1212','T',3,'Present',2,"2025-08-22"),

('TG/2023/001','TMS1233','T',3,'Present',3,"2025-08-20"),
('TG/2023/002','TMS1233','T',3,'Present',3,"2025-08-20"),
('TG/2023/003','TMS1233','T',3,'Present',3,"2025-08-20"),
('TG/2023/004','TMS1233','T',3,'Present',3,"2025-08-20"),
('TG/2023/005','TMS1233','T',3,'Present',3,"2025-08-20"),
('TG/2023/006','TMS1233','T',3,'Present',3,"2025-08-20"),
('TG/2023/007','TMS1233','T',3,'Present',3,"2025-08-20"),
('TG/2023/008','TMS1233','T',3,'Present',3,"2025-08-20"),
('TG/2023/009','TMS1233','T',3,'Present',3,"2025-08-20"),
('TG/2023/010','TMS1233','T',3,'Present',3,"2025-08-20"),

('TG/2023/001','ENG1222','T',4,'Present',2,"2025-08-29"),
('TG/2023/002','ENG1222','T',4,'Present',2,"2025-08-29"),
('TG/2023/003','ENG1222','T',4,'Present',2,"2025-08-29"),
('TG/2023/004','ENG1222','T',4,'Present',2,"2025-08-29"),
('TG/2023/005','ENG1222','T',4,'Present',2,"2025-08-29"),
('TG/2023/006','ENG1222','T',4,'Present',2,"2025-08-29"),
('TG/2023/007','ENG1222','T',4,'Absent',2,"2025-08-29"),
('TG/2023/008','ENG1222','T',4,'Present',2,"2025-08-29"),
('TG/2023/009','ENG1222','T',4,'Present',2,"2025-08-29"),
('TG/2023/010','ENG1222','T',4,'Absent',2,"2025-08-29"),

('TG/2023/001','ICT1212','T',4,'Present',2,"2025-08-28"),
('TG/2023/002','ICT1212','T',4,'Present',2,"2025-08-28"),
('TG/2023/003','ICT1212','T',4,'Present',2,"2025-08-28"),
('TG/2023/004','ICT1212','T',4,'Present',2,"2025-08-28"),
('TG/2023/005','ICT1212','T',4,'Absent',2,"2025-08-28"),
('TG/2023/006','ICT1212','T',4,'Present',2,"2025-08-28"),
('TG/2023/007','ICT1212','T',4,'Present',2,"2025-08-28"),
('TG/2023/008','ICT1212','T',4,'Absent',2,"2025-08-28"),
('TG/2023/009','ICT1212','T',4,'Present',2,"2025-08-28"),
('TG/2023/010','ICT1212','T',4,'Present',2,"2025-08-28"),

('TG/2023/001','ICT1222','P',4,'Present',4,"2025-08-28"),
('TG/2023/002','ICT1222','P',4,'Present',4,"2025-08-28"),
('TG/2023/003','ICT1222','P',4,'Present',4,"2025-08-28"),
('TG/2023/004','ICT1222','P',4,'Present',4,"2025-08-28"),
('TG/2023/005','ICT1222','P',4,'Present',4,"2025-08-28"),
('TG/2023/006','ICT1222','P',4,'Present',4,"2025-08-28"),
('TG/2023/007','ICT1222','P',4,'Present',4,"2025-08-28"),
('TG/2023/008','ICT1222','P',4,'Present',4,"2025-08-28"),
('TG/2023/009','ICT1222','P',4,'Present',4,"2025-08-28"),
('TG/2023/010','ICT1222','P',4,'Present',4,"2025-08-28"),

('TG/2023/001','ICT1233','P',4,'Present',2,"2025-08-25"),
('TG/2023/002','ICT1233','P',4,'Present',2,"2025-08-25"),
('TG/2023/003','ICT1233','P',4,'Present',2,"2025-08-25"),
('TG/2023/004','ICT1233','P',4,'Present',2,"2025-08-25"),
('TG/2023/005','ICT1233','P',4,'Present',2,"2025-08-25"),
('TG/2023/006','ICT1233','P',4,'Present',2,"2025-08-25"),
('TG/2023/007','ICT1233','P',4,'Present',2,"2025-08-25"),
('TG/2023/008','ICT1233','P',4,'Present',2,"2025-08-25"),
('TG/2023/009','ICT1233','P',4,'Present',2,"2025-08-25"),
('TG/2023/010','ICT1233','P',4,'Present',2,"2025-08-25"),

('TG/2023/001','ICT1233','T',4,'Present',2,"2025-08-25"),
('TG/2023/002','ICT1233','T',4,'Present',2,"2025-08-25"),
('TG/2023/003','ICT1233','T',4,'Present',2,"2025-08-25"),
('TG/2023/004','ICT1233','T',4,'Present',2,"2025-08-25"),
('TG/2023/005','ICT1233','T',4,'Present',2,"2025-08-25"),
('TG/2023/006','ICT1233','T',4,'Present',2,"2025-08-25"),
('TG/2023/007','ICT1233','T',4,'Present',2,"2025-08-25"),
('TG/2023/008','ICT1233','T',4,'Present',2,"2025-08-25"),
('TG/2023/009','ICT1233','T',4,'Present',2,"2025-08-25"),
('TG/2023/010','ICT1233','T',4,'Present',2,"2025-08-25"),

('TG/2023/001','ICT1253','P',4,'Present',2,"2025-08-26"),
('TG/2023/002','ICT1253','P',4,'Present',2,"2025-08-26"), 
('TG/2023/003','ICT1253','P',4,'Present',2,"2025-08-26"),
('TG/2023/004','ICT1253','P',4,'Present',2,"2025-08-26"),
('TG/2023/005','ICT1253','P',4,'Present',2,"2025-08-26"),
('TG/2023/006','ICT1253','P',4,'Present',2,"2025-08-26"),
('TG/2023/007','ICT1253','P',4,'Present',2,"2025-08-26"),
('TG/2023/008','ICT1253','P',4,'Present',2,"2025-08-26"),
('TG/2023/009','ICT1253','P',4,'Present',2,"2025-08-26"),
('TG/2023/010','ICT1253','P',4,'Present',2,"2025-08-26"),

('TG/2023/001','ICT1253','T',4,'Present',2,"2025-08-26"),
('TG/2023/002','ICT1253','T',4,'Present',2,"2025-08-26"),
('TG/2023/003','ICT1253','T',4,'Present',2,"2025-08-26"),
('TG/2023/004','ICT1253','T',4,'Present',2,"2025-08-26"),
('TG/2023/005','ICT1253','T',4,'Present',2,"2025-08-26"),
('TG/2023/006','ICT1253','T',4,'Present',2,"2025-08-26"), 
('TG/2023/007','ICT1253','T',4,'Present',2,"2025-08-26"), 
('TG/2023/008','ICT1253','T',4,'Present',2,"2025-08-26"), 
('TG/2023/009','ICT1253','T',4,'Present',2,"2025-08-26"),
('TG/2023/010','ICT1253','T',4,'Present',2,"2025-08-26"),

('TG/2023/001','ICT1242','T',4,'Present',2,"2025-08-26"),
('TG/2023/002','ICT1242','T',4,'Present',2,"2025-08-26"),
('TG/2023/003','ICT1242','T',4,'Present',2,"2025-08-26"),
('TG/2023/004','ICT1242','T',4,'Present',2,"2025-08-26"),
('TG/2023/005','ICT1242','T',4,'Present',2,"2025-08-26"),
('TG/2023/006','ICT1242','T',4,'Present',2,"2025-08-26"),
('TG/2023/007','ICT1242','T',4,'Present',2,"2025-08-26"),
('TG/2023/008','ICT1242','T',4,'Present',2,"2025-08-26"),
('TG/2023/009','ICT1242','T',4,'Present',2,"2025-08-26"),
('TG/2023/010','ICT1242','T',4,'Present',2,"2025-08-26"),

('TG/2023/001','TCS1212','T',4,'Present',2,"2025-08-29"),
('TG/2023/002','TCS1212','T',4,'Absent',2,"2025-08-29"),
('TG/2023/003','TCS1212','T',4,'Present',2,"2025-08-29"),
('TG/2023/004','TCS1212','T',4,'Present',2,"2025-08-29"),
('TG/2023/005','TCS1212','T',4,'Present',2,"2025-08-29"),
('TG/2023/006','TCS1212','T',4,'Present',2,"2025-08-29"),
('TG/2023/007','TCS1212','T',4,'Present',2,"2025-08-29"),
('TG/2023/008','TCS1212','T',4,'Present',2,"2025-08-29"),
('TG/2023/009','TCS1212','T',4,'Present',2,"2025-08-29"),
('TG/2023/010','TCS1212','T',4,'Present',2,"2025-08-29"),

('TG/2023/001','TMS1233','T',4,'Present',3,"2025-08-27"),
('TG/2023/002','TMS1233','T',4,'Present',3,"2025-08-27"),
('TG/2023/003','TMS1233','T',4,'Present',3,"2025-08-27"),
('TG/2023/004','TMS1233','T',4,'Present',3,"2025-08-27"),
('TG/2023/005','TMS1233','T',4,'Present',3,"2025-08-27"),
('TG/2023/006','TMS1233','T',4,'Present',3,"2025-08-27"),
('TG/2023/007','TMS1233','T',4,'Present',3,"2025-08-27"),
('TG/2023/008','TMS1233','T',4,'Present',3,"2025-08-27"),
('TG/2023/009','TMS1233','T',4,'Present',3,"2025-08-27"),
('TG/2023/010','TMS1233','T',4,'Present',3,"2025-08-27"),

('TG/2023/001','ENG1222','T',5,'Present',2,"2025-09-05"),
('TG/2023/002','ENG1222','T',5,'Present',2,"2025-09-05"),
('TG/2023/003','ENG1222','T',5,'Present',2,"2025-09-05"),
('TG/2023/004','ENG1222','T',5,'Present',2,"2025-09-05"),
('TG/2023/005','ENG1222','T',5,'Present',2,"2025-09-05"),
('TG/2023/006','ENG1222','T',5,'Present',2,"2025-09-05"),
('TG/2023/007','ENG1222','T',5,'Present',2,"2025-09-05"), 
('TG/2023/008','ENG1222','T',5,'Present',2,"2025-09-05"),
('TG/2023/009','ENG1222','T',5,'Present',2,"2025-09-05"),
('TG/2023/010','ENG1222','T',5,'Present',2,"2025-09-05"),

('TG/2023/001','ICT1212','T',5,'Present',2,"2025-09-04"),
('TG/2023/002','ICT1212','T',5,'Present',2,"2025-09-04"),
('TG/2023/003','ICT1212','T',5,'Present',2,"2025-09-04"),
('TG/2023/004','ICT1212','T',5,'Present',2,"2025-09-04"),
('TG/2023/005','ICT1212','T',5,'Present',2,"2025-09-04"),
('TG/2023/006','ICT1212','T',5,'Present',2,"2025-09-04"),
('TG/2023/007','ICT1212','T',5,'Present',2,"2025-09-04"),
('TG/2023/008','ICT1212','T',5,'Present',2,"2025-09-04"),
('TG/2023/009','ICT1212','T',5,'Present',2,"2025-09-04"),
('TG/2023/010','ICT1212','T',5,'Present',2,"2025-09-04"),

('TG/2023/001','ICT1222','P',5,'Present',4,"2025-09-04"),
('TG/2023/002','ICT1222','P',5,'Present',4,"2025-09-04"),
('TG/2023/003','ICT1222','P',5,'Present',4,"2025-09-04"),
('TG/2023/004','ICT1222','P',5,'Present',4,"2025-09-04"),
('TG/2023/005','ICT1222','P',5,'Present',4,"2025-09-04"),
('TG/2023/006','ICT1222','P',5,'Present',4,"2025-09-04"),
('TG/2023/007','ICT1222','P',5,'Present',4,"2025-09-04"),
('TG/2023/008','ICT1222','P',5,'Present',4,"2025-09-04"),
('TG/2023/009','ICT1222','P',5,'Present',4,"2025-09-04"),
('TG/2023/010','ICT1222','P',5,'Present',4,"2025-09-04"),

('TG/2023/001','ICT1233','P',5,'Present',2,"2025-09-01"),
('TG/2023/002','ICT1233','P',5,'Present',2,"2025-09-01"),
('TG/2023/003','ICT1233','P',5,'Present',2,"2025-09-01"),
('TG/2023/004','ICT1233','P',5,'Present',2,"2025-09-01"),
('TG/2023/005','ICT1233','P',5,'Present',2,"2025-09-01"),
('TG/2023/006','ICT1233','P',5,'Present',2,"2025-09-01"),
('TG/2023/007','ICT1233','P',5,'Present',2,"2025-09-01"),
('TG/2023/008','ICT1233','P',5,'Present',2,"2025-09-01"),
('TG/2023/009','ICT1233','P',5,'Present',2,"2025-09-01"),
('TG/2023/010','ICT1233','P',5,'Present',2,"2025-09-01"),

('TG/2023/001','ICT1233','T',5,'Present',2,"2025-09-01"),
('TG/2023/002','ICT1233','T',5,'Present',2,"2025-09-01"),
('TG/2023/003','ICT1233','T',5,'Present',2,"2025-09-01"),
('TG/2023/004','ICT1233','T',5,'Present',2,"2025-09-01"),
('TG/2023/005','ICT1233','T',5,'Present',2,"2025-09-01"),
('TG/2023/006','ICT1233','T',5,'Present',2,"2025-09-01"),
('TG/2023/007','ICT1233','T',5,'Present',2,"2025-09-01"),
('TG/2023/008','ICT1233','T',5,'Present',2,"2025-09-01"),
('TG/2023/009','ICT1233','T',5,'Present',2,"2025-09-01"),
('TG/2023/010','ICT1233','T',5,'Present',2,"2025-09-01"),

('TG/2023/001','ICT1253','P',5,'Present',2,"2025-09-02"),
('TG/2023/002','ICT1253','P',5,'Present',2,"2025-09-02"),
('TG/2023/003','ICT1253','P',5,'Present',2,"2025-09-02"),
('TG/2023/004','ICT1253','P',5,'Present',2,"2025-09-02"),
('TG/2023/005','ICT1253','P',5,'Present',2,"2025-09-02"),
('TG/2023/006','ICT1253','P',5,'Present',2,"2025-09-02"),
('TG/2023/007','ICT1253','P',5,'Present',2,"2025-09-02"),
('TG/2023/008','ICT1253','P',5,'Present',2,"2025-09-02"),
('TG/2023/009','ICT1253','P',5,'Present',2,"2025-09-02"),
('TG/2023/010','ICT1253','P',5,'Present',2,"2025-09-02"),

('TG/2023/001','ICT1253','T',5,'Present',2,"2025-09-02"),
('TG/2023/002','ICT1253','T',5,'Present',2,"2025-09-02"),
('TG/2023/003','ICT1253','T',5,'Present',2,"2025-09-02"),
('TG/2023/004','ICT1253','T',5,'Present',2,"2025-09-02"),
('TG/2023/005','ICT1253','T',5,'Present',2,"2025-09-02"),
('TG/2023/006','ICT1253','T',5,'Present',2,"2025-09-02"),
('TG/2023/007','ICT1253','T',5,'Present',2,"2025-09-02"),
('TG/2023/008','ICT1253','T',5,'Present',2,"2025-09-02"),
('TG/2023/009','ICT1253','T',5,'Present',2,"2025-09-02"),
('TG/2023/010','ICT1253','T',5,'Present',2,"2025-09-02"),

('TG/2023/001','ICT1242','T',5,'Present',2,"2025-09-02"),
('TG/2023/002','ICT1242','T',5,'Present',2,"2025-09-02"),
('TG/2023/003','ICT1242','T',5,'Present',2,"2025-09-02"),
('TG/2023/004','ICT1242','T',5,'Present',2,"2025-09-02"),
('TG/2023/005','ICT1242','T',5,'Present',2,"2025-09-02"),
('TG/2023/006','ICT1242','T',5,'Present',2,"2025-09-02"),
('TG/2023/007','ICT1242','T',5,'Present',2,"2025-09-02"),
('TG/2023/008','ICT1242','T',5,'Present',2,"2025-09-02"),
('TG/2023/009','ICT1242','T',5,'Present',2,"2025-09-02"),
('TG/2023/010','ICT1242','T',5,'Present',2,"2025-09-02"),

('TG/2023/001','TCS1212','T',5,'Present',2,"2025-09-05"),
('TG/2023/002','TCS1212','T',5,'Present',2,"2025-09-05"),
('TG/2023/003','TCS1212','T',5,'Present',2,"2025-09-05"),
('TG/2023/004','TCS1212','T',5,'Present',2,"2025-09-05"),
('TG/2023/005','TCS1212','T',5,'Present',2,"2025-09-05"),
('TG/2023/006','TCS1212','T',5,'Present',2,"2025-09-05"),
('TG/2023/007','TCS1212','T',5,'Present',2,"2025-09-05"),
('TG/2023/008','TCS1212','T',5,'Present',2,"2025-09-05"),
('TG/2023/009','TCS1212','T',5,'Present',2,"2025-09-05"),
('TG/2023/010','TCS1212','T',5,'Present',2,"2025-09-05"),

('TG/2023/001','TMS1233','T',5,'Present',3,"2025-09-03"),
('TG/2023/002','TMS1233','T',5,'Present',3,"2025-09-03"),
('TG/2023/003','TMS1233','T',5,'Present',3,"2025-09-03"),
('TG/2023/004','TMS1233','T',5,'Present',3,"2025-09-03"),
('TG/2023/005','TMS1233','T',5,'Present',3,"2025-09-03"),
('TG/2023/006','TMS1233','T',5,'Present',3,"2025-09-03"),
('TG/2023/007','TMS1233','T',5,'Present',3,"2025-09-03"),
('TG/2023/008','TMS1233','T',5,'Present',3,"2025-09-03"),
('TG/2023/009','TMS1233','T',5,'Present',3,"2025-09-03"),
('TG/2023/010','TMS1233','T',5,'Present',3,"2025-09-03"),

('TG/2023/001','ENG1222','T',6,'Present',2,"2025-09-12"),
('TG/2023/002','ENG1222','T',6,'Present',2,"2025-09-12"),
('TG/2023/003','ENG1222','T',6,'Present',2,"2025-09-12"),
('TG/2023/004','ENG1222','T',6,'Present',2,"2025-09-12"),
('TG/2023/005','ENG1222','T',6,'Present',2,"2025-09-12"),
('TG/2023/006','ENG1222','T',6,'Present',2,"2025-09-12"),
('TG/2023/007','ENG1222','T',6,'Present',2,"2025-09-12"),
('TG/2023/008','ENG1222','T',6,'Present',2,"2025-09-12"),
('TG/2023/009','ENG1222','T',6,'Present',2,"2025-09-12"),
('TG/2023/010','ENG1222','T',6,'Present',2,"2025-09-12"),

('TG/2023/001','ICT1212','T',6,'Present',2,"2025-09-11"),
('TG/2023/002','ICT1212','T',6,'Present',2,"2025-09-11"),
('TG/2023/003','ICT1212','T',6,'Present',2,"2025-09-11"),
('TG/2023/004','ICT1212','T',6,'Present',2,"2025-09-11"),
('TG/2023/005','ICT1212','T',6,'Present',2,"2025-09-11"),
('TG/2023/006','ICT1212','T',6,'Present',2,"2025-09-11"),
('TG/2023/007','ICT1212','T',6,'Present',2,"2025-09-11"),
('TG/2023/008','ICT1212','T',6,'Present',2,"2025-09-11"),
('TG/2023/009','ICT1212','T',6,'Present',2,"2025-09-11"),
('TG/2023/010','ICT1212','T',6,'Present',2,"2025-09-11"),

('TG/2023/001','ICT1222','P',6,'Present',4,"2025-09-11"),
('TG/2023/002','ICT1222','P',6,'Present',4,"2025-09-11"),
('TG/2023/003','ICT1222','P',6,'Present',4,"2025-09-11"),
('TG/2023/004','ICT1222','P',6,'Present',4,"2025-09-11"),
('TG/2023/005','ICT1222','P',6,'Present',4,"2025-09-11"),
('TG/2023/006','ICT1222','P',6,'Present',4,"2025-09-11"),
('TG/2023/007','ICT1222','P',6,'Present',4,"2025-09-11"),
('TG/2023/008','ICT1222','P',6,'Present',4,"2025-09-11"),
('TG/2023/009','ICT1222','P',6,'Present',4,"2025-09-11"),
('TG/2023/010','ICT1222','P',6,'Present',4,"2025-09-11"),

('TG/2023/001','ICT1233','P',6,'Present',2,"2025-09-08"),
('TG/2023/002','ICT1233','P',6,'Present',2,"2025-09-08"),
('TG/2023/003','ICT1233','P',6,'Present',2,"2025-09-08"),
('TG/2023/004','ICT1233','P',6,'Present',2,"2025-09-08"),
('TG/2023/005','ICT1233','P',6,'Present',2,"2025-09-08"),
('TG/2023/006','ICT1233','P',6,'Present',2,"2025-09-08"),
('TG/2023/007','ICT1233','P',6,'Present',2,"2025-09-08"),
('TG/2023/008','ICT1233','P',6,'Present',2,"2025-09-08"),
('TG/2023/009','ICT1233','P',6,'Present',2,"2025-09-08"),
('TG/2023/010','ICT1233','P',6,'Present',2,"2025-09-08"),

('TG/2023/001','ICT1233','T',6,'Present',2,"2025-09-08"),
('TG/2023/002','ICT1233','T',6,'Present',2,"2025-09-08"),
('TG/2023/003','ICT1233','T',6,'Present',2,"2025-09-08"),
('TG/2023/004','ICT1233','T',6,'Present',2,"2025-09-08"),
('TG/2023/005','ICT1233','T',6,'Present',2,"2025-09-08"),
('TG/2023/006','ICT1233','T',6,'Present',2,"2025-09-08"),
('TG/2023/007','ICT1233','T',6,'Present',2,"2025-09-08"),
('TG/2023/008','ICT1233','T',6,'Present',2,"2025-09-08"),
('TG/2023/009','ICT1233','T',6,'Present',2,"2025-09-08"),
('TG/2023/010','ICT1233','T',6,'Present',2,"2025-09-08"),

('TG/2023/001','ICT1253','P',6,'Present',2,"2025-09-09"),
('TG/2023/002','ICT1253','P',6,'Present',2,"2025-09-09"),
('TG/2023/003','ICT1253','P',6,'Present',2,"2025-09-09"),
('TG/2023/004','ICT1253','P',6,'Medical',2,"2025-09-09"),
('TG/2023/005','ICT1253','P',6,'Present',2,"2025-09-09"),
('TG/2023/006','ICT1253','P',6,'Present',2,"2025-09-09"),
('TG/2023/007','ICT1253','P',6,'Present',2,"2025-09-09"),
('TG/2023/008','ICT1253','P',6,'Present',2,"2025-09-09"),
('TG/2023/009','ICT1253','P',6,'Present',2,"2025-09-09"),
('TG/2023/010','ICT1253','P',6,'Present',2,"2025-09-09"),

('TG/2023/001','ICT1253','T',6,'Present',2,"2025-09-09"),
('TG/2023/002','ICT1253','T',6,'Present',2,"2025-09-09"),
('TG/2023/003','ICT1253','T',6,'Present',2,"2025-09-09"),
('TG/2023/004','ICT1253','T',6,'Present',2,"2025-09-09"),
('TG/2023/005','ICT1253','T',6,'Present',2,"2025-09-09"),
('TG/2023/006','ICT1253','T',6,'Present',2,"2025-09-09"),
('TG/2023/007','ICT1253','T',6,'Present',2,"2025-09-09"),
('TG/2023/008','ICT1253','T',6,'Present',2,"2025-09-09"),
('TG/2023/009','ICT1253','T',6,'Present',2,"2025-09-09"),
('TG/2023/010','ICT1253','T',6,'Present',2,"2025-09-09"),

('TG/2023/001','ICT1242','T',6,'Present',2,"2025-09-09"),
('TG/2023/002','ICT1242','T',6,'Present',2,"2025-09-09"),
('TG/2023/003','ICT1242','T',6,'Present',2,"2025-09-09"),
('TG/2023/004','ICT1242','T',6,'Present',2,"2025-09-09"),
('TG/2023/005','ICT1242','T',6,'Present',2,"2025-09-09"),
('TG/2023/006','ICT1242','T',6,'Present',2,"2025-09-09"),
('TG/2023/007','ICT1242','T',6,'Present',2,"2025-09-09"),
('TG/2023/008','ICT1242','T',6,'Present',2,"2025-09-09"),
('TG/2023/009','ICT1242','T',6,'Present',2,"2025-09-09"),
('TG/2023/010','ICT1242','T',6,'Present',2,"2025-09-09"),

('TG/2023/001','TCS1212','T',6,'Present',2,"2025-09-12"),
('TG/2023/002','TCS1212','T',6,'Present',2,"2025-09-12"),
('TG/2023/003','TCS1212','T',6,'Present',2,"2025-09-12"),
('TG/2023/004','TCS1212','T',6,'Present',2,"2025-09-12"),
('TG/2023/005','TCS1212','T',6,'Present',2,"2025-09-12"),
('TG/2023/006','TCS1212','T',6,'Present',2,"2025-09-12"),
('TG/2023/007','TCS1212','T',6,'Present',2,"2025-09-12"),
('TG/2023/008','TCS1212','T',6,'Present',2,"2025-09-12"),
('TG/2023/009','TCS1212','T',6,'Present',2,"2025-09-12"),
('TG/2023/010','TCS1212','T',6,'Present',2,"2025-09-12"),

('TG/2023/001','TMS1233','T',6,'Present',3,"2025-09-10"),
('TG/2023/002','TMS1233','T',6,'Present',3,"2025-09-10"),
('TG/2023/003','TMS1233','T',6,'Present',3,"2025-09-10"),
('TG/2023/004','TMS1233','T',6,'Present',3,"2025-09-10"),
('TG/2023/005','TMS1233','T',6,'Present',3,"2025-09-10"),
('TG/2023/006','TMS1233','T',6,'Present',3,"2025-09-10"),
('TG/2023/007','TMS1233','T',6,'Present',3,"2025-09-10"),
('TG/2023/008','TMS1233','T',6,'Present',3,"2025-09-10"),
('TG/2023/009','TMS1233','T',6,'Present',3,"2025-09-10"),
('TG/2023/010','TMS1233','T',6,'Present',3,"2025-09-10"),

('TG/2023/001','ENG1222','T',7,'Present',2,"2025-09-19"),
('TG/2023/002','ENG1222','T',7,'Present',2,"2025-09-19"),
('TG/2023/003','ENG1222','T',7,'Present',2,"2025-09-19"),
('TG/2023/004','ENG1222','T',7,'Present',2,"2025-09-19"),
('TG/2023/005','ENG1222','T',7,'Present',2,"2025-09-19"),
('TG/2023/006','ENG1222','T',7,'Present',2,"2025-09-19"),
('TG/2023/007','ENG1222','T',7,'Present',2,"2025-09-19"),
('TG/2023/008','ENG1222','T',7,'Present',2,"2025-09-19"),
('TG/2023/009','ENG1222','T',7,'Present',2,"2025-09-19"),
('TG/2023/010','ENG1222','T',7,'Present',2,"2025-09-19"),

('TG/2023/001','ICT1212','T',7,'Present',2,"2025-09-18"),
('TG/2023/002','ICT1212','T',7,'Present',2,"2025-09-18"),
('TG/2023/003','ICT1212','T',7,'Present',2,"2025-09-18"),
('TG/2023/004','ICT1212','T',7,'Present',2,"2025-09-18"),
('TG/2023/005','ICT1212','T',7,'Present',2,"2025-09-18"),
('TG/2023/006','ICT1212','T',7,'Present',2,"2025-09-18"),
('TG/2023/007','ICT1212','T',7,'Present',2,"2025-09-18"),
('TG/2023/008','ICT1212','T',7,'Present',2,"2025-09-18"),
('TG/2023/009','ICT1212','T',7,'Present',2,"2025-09-18"),
('TG/2023/010','ICT1212','T',7,'Present',2,"2025-09-18"),

('TG/2023/001','ICT1222','P',7,'Present',4,"2025-09-18"),
('TG/2023/002','ICT1222','P',7,'Present',4,"2025-09-18"),
('TG/2023/003','ICT1222','P',7,'Present',4,"2025-09-18"),
('TG/2023/004','ICT1222','P',7,'Present',4,"2025-09-18"),
('TG/2023/005','ICT1222','P',7,'Present',4,"2025-09-18"),
('TG/2023/006','ICT1222','P',7,'Present',4,"2025-09-18"),
('TG/2023/007','ICT1222','P',7,'Present',4,"2025-09-18"),
('TG/2023/008','ICT1222','P',7,'Present',4,"2025-09-18"),
('TG/2023/009','ICT1222','P',7,'Present',4,"2025-09-18"),
('TG/2023/010','ICT1222','P',7,'Present',4,"2025-09-18"),

('TG/2023/001','ICT1233','P',7,'Present',2,"2025-09-15"),
('TG/2023/002','ICT1233','P',7,'Present',2,"2025-09-15"),
('TG/2023/003','ICT1233','P',7,'Present',2,"2025-09-15"),
('TG/2023/004','ICT1233','P',7,'Present',2,"2025-09-15"),
('TG/2023/005','ICT1233','P',7,'Present',2,"2025-09-15"),
('TG/2023/006','ICT1233','P',7,'Absent',2,"2025-09-15"),
('TG/2023/007','ICT1233','P',7,'Present',2,"2025-09-15"),
('TG/2023/008','ICT1233','P',7,'Present',2,"2025-09-15"),
('TG/2023/009','ICT1233','P',7,'Present',2,"2025-09-15"),
('TG/2023/010','ICT1233','P',7,'Present',2,"2025-09-15"),

('TG/2023/001','ICT1233','T',7,'Present',2,"2025-09-15"),
('TG/2023/002','ICT1233','T',7,'Present',2,"2025-09-15"),
('TG/2023/003','ICT1233','T',7,'Present',2,"2025-09-15"),
('TG/2023/004','ICT1233','T',7,'Present',2,"2025-09-15"),
('TG/2023/005','ICT1233','T',7,'Present',2,"2025-09-15"),
('TG/2023/006','ICT1233','T',7,'Present',2,"2025-09-15"),
('TG/2023/007','ICT1233','T',7,'Present',2,"2025-09-15"),
('TG/2023/008','ICT1233','T',7,'Present',2,"2025-09-15"),
('TG/2023/009','ICT1233','T',7,'Present',2,"2025-09-15"),
('TG/2023/010','ICT1233','T',7,'Present',2,"2025-09-15"),

('TG/2023/001','ICT1253','P',7,'Present',2,"2025-09-16"),
('TG/2023/002','ICT1253','P',7,'Present',2,"2025-09-16"),
('TG/2023/003','ICT1253','P',7,'Present',2,"2025-09-16"),
('TG/2023/004','ICT1253','P',7,'Present',2,"2025-09-16"),
('TG/2023/005','ICT1253','P',7,'Present',2,"2025-09-16"),
('TG/2023/006','ICT1253','P',7,'Present',2,"2025-09-16"),
('TG/2023/007','ICT1253','P',7,'Present',2,"2025-09-16"),
('TG/2023/008','ICT1253','P',7,'Present',2,"2025-09-16"),
('TG/2023/009','ICT1253','P',7,'Present',2,"2025-09-16"),
('TG/2023/010','ICT1253','P',7,'Present',2,"2025-09-16"),

('TG/2023/001','ICT1253','T',7,'Present',2,"2025-09-16"),
('TG/2023/002','ICT1253','T',7,'Present',2,"2025-09-16"),
('TG/2023/003','ICT1253','T',7,'Present',2,"2025-09-16"),
('TG/2023/004','ICT1253','T',7,'Present',2,"2025-09-16"),
('TG/2023/005','ICT1253','T',7,'Present',2,"2025-09-16"),
('TG/2023/006','ICT1253','T',7,'Present',2,"2025-09-16"),
('TG/2023/007','ICT1253','T',7,'Present',2,"2025-09-16"),
('TG/2023/008','ICT1253','T',7,'Present',2,"2025-09-16"),
('TG/2023/009','ICT1253','T',7,'Present',2,"2025-09-16"),
('TG/2023/010','ICT1253','T',7,'Present',2,"2025-09-16"),

('TG/2023/001','ICT1242','T',7,'Present',2,"2025-09-16"),
('TG/2023/002','ICT1242','T',7,'Present',2,"2025-09-16"),
('TG/2023/003','ICT1242','T',7,'Present',2,"2025-09-16"),
('TG/2023/004','ICT1242','T',7,'Present',2,"2025-09-16"),
('TG/2023/005','ICT1242','T',7,'Present',2,"2025-09-16"),
('TG/2023/006','ICT1242','T',7,'Present',2,"2025-09-16"),
('TG/2023/007','ICT1242','T',7,'Present',2,"2025-09-16"),
('TG/2023/008','ICT1242','T',7,'Present',2,"2025-09-16"),
('TG/2023/009','ICT1242','T',7,'Present',2,"2025-09-16"),
('TG/2023/010','ICT1242','T',7,'Present',2,"2025-09-16"),

('TG/2023/001','TCS1212','T',7,'Present',2,"2025-09-19"),
('TG/2023/002','TCS1212','T',7,'Present',2,"2025-09-19"),
('TG/2023/003','TCS1212','T',7,'Present',2,"2025-09-19"),
('TG/2023/004','TCS1212','T',7,'Present',2,"2025-09-19"),
('TG/2023/005','TCS1212','T',7,'Present',2,"2025-09-19"),
('TG/2023/006','TCS1212','T',7,'Present',2,"2025-09-19"),
('TG/2023/007','TCS1212','T',7,'Present',2,"2025-09-19"),
('TG/2023/008','TCS1212','T',7,'Present',2,"2025-09-19"),
('TG/2023/009','TCS1212','T',7,'Present',2,"2025-09-19"),
('TG/2023/010','TCS1212','T',7,'Present',2,"2025-09-19"),

('TG/2023/001','TMS1233','T',7,'Present',3,"2025-09-17"),
('TG/2023/002','TMS1233','T',7,'Present',3,"2025-09-17"),
('TG/2023/003','TMS1233','T',7,'Absent',3,"2025-09-17"),
('TG/2023/004','TMS1233','T',7,'Present',3,"2025-09-17"),
('TG/2023/005','TMS1233','T',7,'Present',3,"2025-09-17"),
('TG/2023/006','TMS1233','T',7,'Present',3,"2025-09-17"),
('TG/2023/007','TMS1233','T',7,'Present',3,"2025-09-17"),
('TG/2023/008','TMS1233','T',7,'Present',3,"2025-09-17"),
('TG/2023/009','TMS1233','T',7,'Present',3,"2025-09-17"),
('TG/2023/010','TMS1233','T',7,'Present',3,"2025-09-17"),

('TG/2023/001','ENG1222','T',8,'Present',2,"2025-09-26"),
('TG/2023/002','ENG1222','T',8,'Present',2,"2025-09-26"),
('TG/2023/003','ENG1222','T',8,'Present',2,"2025-09-26"),
('TG/2023/004','ENG1222','T',8,'Present',2,"2025-09-26"),
('TG/2023/005','ENG1222','T',8,'Present',2,"2025-09-26"),
('TG/2023/006','ENG1222','T',8,'Present',2,"2025-09-26"),
('TG/2023/007','ENG1222','T',8,'Present',2,"2025-09-26"),
('TG/2023/008','ENG1222','T',8,'Present',2,"2025-09-26"),
('TG/2023/009','ENG1222','T',8,'Present',2,"2025-09-26"),
('TG/2023/010','ENG1222','T',8,'Present',2,"2025-09-26"),

('TG/2023/001','ICT1212','T',8,'Present',2,"2025-09-25"),
('TG/2023/002','ICT1212','T',8,'Present',2,"2025-09-25"),
('TG/2023/003','ICT1212','T',8,'Present',2,"2025-09-25"),
('TG/2023/004','ICT1212','T',8,'Present',2,"2025-09-25"),
('TG/2023/005','ICT1212','T',8,'Present',2,"2025-09-25"),
('TG/2023/006','ICT1212','T',8,'Present',2,"2025-09-25"),
('TG/2023/007','ICT1212','T',8,'Present',2,"2025-09-25"),
('TG/2023/008','ICT1212','T',8,'Present',2,"2025-09-25"),
('TG/2023/009','ICT1212','T',8,'Present',2,"2025-09-25"),
('TG/2023/010','ICT1212','T',8,'Present',2,"2025-09-25"),

('TG/2023/001','ICT1222','P',8,'Present',4,"2025-09-25"),
('TG/2023/002','ICT1222','P',8,'Present',4,"2025-09-25"),
('TG/2023/003','ICT1222','P',8,'Present',4,"2025-09-25"),
('TG/2023/004','ICT1222','P',8,'Present',4,"2025-09-25"),
('TG/2023/005','ICT1222','P',8,'Present',4,"2025-09-25"),
('TG/2023/006','ICT1222','P',8,'Present',4,"2025-09-25"),
('TG/2023/007','ICT1222','P',8,'Present',4,"2025-09-25"),
('TG/2023/008','ICT1222','P',8,'Present',4,"2025-09-25"),
('TG/2023/009','ICT1222','P',8,'Present',4,"2025-09-25"),
('TG/2023/010','ICT1222','P',8,'Present',4,"2025-09-25"),

('TG/2023/001','ICT1233','P',8,'Present',2,"2025-09-22"),
('TG/2023/002','ICT1233','P',8,'Present',2,"2025-09-22"),
('TG/2023/003','ICT1233','P',8,'Present',2,"2025-09-22"),
('TG/2023/004','ICT1233','P',8,'Present',2,"2025-09-22"),
('TG/2023/005','ICT1233','P',8,'Present',2,"2025-09-22"),
('TG/2023/006','ICT1233','P',8,'Present',2,"2025-09-22"),
('TG/2023/007','ICT1233','P',8,'Present',2,"2025-09-22"),
('TG/2023/008','ICT1233','P',8,'Present',2,"2025-09-22"),
('TG/2023/009','ICT1233','P',8,'Present',2,"2025-09-22"),
('TG/2023/010','ICT1233','P',8,'Present',2,"2025-09-22"),

('TG/2023/001','ICT1233','T',8,'Present',2,"2025-09-22"),
('TG/2023/002','ICT1233','T',8,'Present',2,"2025-09-22"),
('TG/2023/003','ICT1233','T',8,'Present',2,"2025-09-22"),
('TG/2023/004','ICT1233','T',8,'Present',2,"2025-09-22"),
('TG/2023/005','ICT1233','T',8,'Present',2,"2025-09-22"),
('TG/2023/006','ICT1233','T',8,'Present',2,"2025-09-22"),
('TG/2023/007','ICT1233','T',8,'Present',2,"2025-09-22"),
('TG/2023/008','ICT1233','T',8,'Present',2,"2025-09-22"),
('TG/2023/009','ICT1233','T',8,'Present',2,"2025-09-22"),
('TG/2023/010','ICT1233','T',8,'Present',2,"2025-09-22"),

('TG/2023/001','ICT1253','P',8,'Present',2,"2025-09-23"),
('TG/2023/002','ICT1253','P',8,'Present',2,"2025-09-23"),
('TG/2023/003','ICT1253','P',8,'Present',2,"2025-09-23"),
('TG/2023/004','ICT1253','P',8,'Present',2,"2025-09-23"),
('TG/2023/005','ICT1253','P',8,'Absent',2,"2025-09-23"),
('TG/2023/006','ICT1253','P',8,'Present',2,"2025-09-23"),
('TG/2023/007','ICT1253','P',8,'Present',2,"2025-09-23"),
('TG/2023/008','ICT1253','P',8,'Present',2,"2025-09-23"),
('TG/2023/009','ICT1253','P',8,'Present',2,"2025-09-23"),
('TG/2023/010','ICT1253','P',8,'Present',2,"2025-09-23"),

('TG/2023/001','ICT1253','T',8,'Present',2,"2025-09-23"),
('TG/2023/002','ICT1253','T',8,'Present',2,"2025-09-23"),
('TG/2023/003','ICT1253','T',8,'Present',2,"2025-09-23"),
('TG/2023/004','ICT1253','T',8,'Present',2,"2025-09-23"),
('TG/2023/005','ICT1253','T',8,'Present',2,"2025-09-23"),
('TG/2023/006','ICT1253','T',8,'Present',2,"2025-09-23"),
('TG/2023/007','ICT1253','T',8,'Present',2,"2025-09-23"),
('TG/2023/008','ICT1253','T',8,'Present',2,"2025-09-23"),
('TG/2023/009','ICT1253','T',8,'Present',2,"2025-09-23"),
('TG/2023/010','ICT1253','T',8,'Present',2,"2025-09-23"),

('TG/2023/001','ICT1242','T',8,'Present',2,"2025-09-23"),
('TG/2023/002','ICT1242','T',8,'Present',2,"2025-09-23"),
('TG/2023/003','ICT1242','T',8,'Present',2,"2025-09-23"),
('TG/2023/004','ICT1242','T',8,'Present',2,"2025-09-23"),
('TG/2023/005','ICT1242','T',8,'Present',2,"2025-09-23"),
('TG/2023/006','ICT1242','T',8,'Present',2,"2025-09-23"),
('TG/2023/007','ICT1242','T',8,'Present',2,"2025-09-23"),
('TG/2023/008','ICT1242','T',8,'Present',2,"2025-09-23"),
('TG/2023/009','ICT1242','T',8,'Present',2,"2025-09-23"),
('TG/2023/010','ICT1242','T',8,'Present',2,"2025-09-23"),

('TG/2023/001','TCS1212','T',8,'Absent',2,"2025-09-26"),
('TG/2023/002','TCS1212','T',8,'Present',2,"2025-09-26"),
('TG/2023/003','TCS1212','T',8,'Present',2,"2025-09-26"),
('TG/2023/004','TCS1212','T',8,'Present',2,"2025-09-26"),
('TG/2023/005','TCS1212','T',8,'Present',2,"2025-09-26"),
('TG/2023/006','TCS1212','T',8,'Present',2,"2025-09-26"),
('TG/2023/007','TCS1212','T',8,'Present',2,"2025-09-26"),
('TG/2023/008','TCS1212','T',8,'Present',2,"2025-09-26"),
('TG/2023/009','TCS1212','T',8,'Present',2,"2025-09-26"),
('TG/2023/010','TCS1212','T',8,'Present',2,"2025-09-26"),

('TG/2023/001','TMS1233','T',8,'Present',3,"2025-09-24"),
('TG/2023/002','TMS1233','T',8,'Present',3,"2025-09-24"),
('TG/2023/003','TMS1233','T',8,'Present',3,"2025-09-24"),
('TG/2023/004','TMS1233','T',8,'Present',3,"2025-09-24"),
('TG/2023/005','TMS1233','T',8,'Present',3,"2025-09-24"),
('TG/2023/006','TMS1233','T',8,'Present',3,"2025-09-24"),
('TG/2023/007','TMS1233','T',8,'Present',3,"2025-09-24"),
('TG/2023/008','TMS1233','T',8,'Present',3,"2025-09-24"),
('TG/2023/009','TMS1233','T',8,'Present',3,"2025-09-24"),
('TG/2023/010','TMS1233','T',8,'Present',3,"2025-09-24"),

('TG/2023/001','ENG1222','T',9,'Present',2,"2025-10-03"),
('TG/2023/002','ENG1222','T',9,'Present',2,"2025-10-03"),
('TG/2023/003','ENG1222','T',9,'Present',2,"2025-10-03"),
('TG/2023/004','ENG1222','T',9,'Present',2,"2025-10-03"),
('TG/2023/005','ENG1222','T',9,'Present',2,"2025-10-03"),
('TG/2023/006','ENG1222','T',9,'Present',2,"2025-10-03"),
('TG/2023/007','ENG1222','T',9,'Present',2,"2025-10-03"),
('TG/2023/008','ENG1222','T',9,'Present',2,"2025-10-03"),
('TG/2023/009','ENG1222','T',9,'Present',2,"2025-10-03"),
('TG/2023/010','ENG1222','T',9,'Present',2,"2025-10-03"),

('TG/2023/001','ICT1212','T',9,'Present',2,"2025-10-02"),
('TG/2023/002','ICT1212','T',9,'Present',2,"2025-10-02"),
('TG/2023/003','ICT1212','T',9,'Present',2,"2025-10-02"),
('TG/2023/004','ICT1212','T',9,'Present',2,"2025-10-02"),
('TG/2023/005','ICT1212','T',9,'Present',2,"2025-10-02"),
('TG/2023/006','ICT1212','T',9,'Present',2,"2025-10-02"),
('TG/2023/007','ICT1212','T',9,'Present',2,"2025-10-02"),
('TG/2023/008','ICT1212','T',9,'Present',2,"2025-10-02"),
('TG/2023/009','ICT1212','T',9,'Present',2,"2025-10-02"),
('TG/2023/010','ICT1212','T',9,'Present',2,"2025-10-02"),

('TG/2023/001','ICT1222','P',9,'Present',4,"2025-10-02"),
('TG/2023/002','ICT1222','P',9,'Present',4,"2025-10-02"),
('TG/2023/003','ICT1222','P',9,'Present',4,"2025-10-02"),
('TG/2023/004','ICT1222','P',9,'Present',4,"2025-10-02"),
('TG/2023/005','ICT1222','P',9,'Present',4,"2025-10-02"),
('TG/2023/006','ICT1222','P',9,'Present',4,"2025-10-02"),
('TG/2023/007','ICT1222','P',9,'Present',4,"2025-10-02"),
('TG/2023/008','ICT1222','P',9,'Present',4,"2025-10-02"),
('TG/2023/009','ICT1222','P',9,'Present',4,"2025-10-02"),
('TG/2023/010','ICT1222','P',9,'Present',4,"2025-10-02"),

('TG/2023/001','ICT1233','P',9,'Present',2,"2025-09-29"),
('TG/2023/002','ICT1233','P',9,'Present',2,"2025-09-29"),
('TG/2023/003','ICT1233','P',9,'Present',2,"2025-09-29"),
('TG/2023/004','ICT1233','P',9,'Present',2,"2025-09-29"),
('TG/2023/005','ICT1233','P',9,'Present',2,"2025-09-29"),
('TG/2023/006','ICT1233','P',9,'Present',2,"2025-09-29"),
('TG/2023/007','ICT1233','P',9,'Present',2,"2025-09-29"),
('TG/2023/008','ICT1233','P',9,'Present',2,"2025-09-29"),
('TG/2023/009','ICT1233','P',9,'Present',2,"2025-09-29"),
('TG/2023/010','ICT1233','P',9,'Present',2,"2025-09-29"),

('TG/2023/001','ICT1233','T',9,'Present',2,"2025-09-29"),
('TG/2023/002','ICT1233','T',9,'Present',2,"2025-09-29"),
('TG/2023/003','ICT1233','T',9,'Present',2,"2025-09-29"),
('TG/2023/004','ICT1233','T',9,'Present',2,"2025-09-29"),
('TG/2023/005','ICT1233','T',9,'Present',2,"2025-09-29"),
('TG/2023/006','ICT1233','T',9,'Present',2,"2025-09-29"),
('TG/2023/007','ICT1233','T',9,'Present',2,"2025-09-29"),
('TG/2023/008','ICT1233','T',9,'Present',2,"2025-09-29"),
('TG/2023/009','ICT1233','T',9,'Present',2,"2025-09-29"),
('TG/2023/010','ICT1233','T',9,'Present',2,"2025-09-29"),

('TG/2023/001','ICT1253','P',9,'Present',2,"2025-09-30"),
('TG/2023/002','ICT1253','P',9,'Present',2,"2025-09-30"),
('TG/2023/003','ICT1253','P',9,'Present',2,"2025-09-30"),
('TG/2023/004','ICT1253','P',9,'Medical',2,"2025-09-30"),
('TG/2023/005','ICT1253','P',9,'Present',2,"2025-09-30"),
('TG/2023/006','ICT1253','P',9,'Present',2,"2025-09-30"),
('TG/2023/007','ICT1253','P',9,'Present',2,"2025-09-30"),
('TG/2023/008','ICT1253','P',9,'Present',2,"2025-09-30"),
('TG/2023/009','ICT1253','P',9,'Present',2,"2025-09-30"),
('TG/2023/010','ICT1253','P',9,'Present',2,"2025-09-30"),

('TG/2023/001','ICT1253','T',9,'Present',2,"2025-09-30"),
('TG/2023/002','ICT1253','T',9,'Present',2,"2025-09-30"),
('TG/2023/003','ICT1253','T',9,'Present',2,"2025-09-30"),
('TG/2023/004','ICT1253','T',9,'Present',2,"2025-09-30"),
('TG/2023/005','ICT1253','T',9,'Present',2,"2025-09-30"),
('TG/2023/006','ICT1253','T',9,'Present',2,"2025-09-30"),
('TG/2023/007','ICT1253','T',9,'Present',2,"2025-09-30"),
('TG/2023/008','ICT1253','T',9,'Present',2,"2025-09-30"),
('TG/2023/009','ICT1253','T',9,'Present',2,"2025-09-30"),
('TG/2023/010','ICT1253','T',9,'Present',2,"2025-09-30"),

('TG/2023/001','ICT1242','T',9,'Present',2,"2025-09-30"),
('TG/2023/002','ICT1242','T',9,'Present',2,"2025-09-30"),
('TG/2023/003','ICT1242','T',9,'Present',2,"2025-09-30"),
('TG/2023/004','ICT1242','T',9,'Present',2,"2025-09-30"),
('TG/2023/005','ICT1242','T',9,'Present',2,"2025-09-30"),
('TG/2023/006','ICT1242','T',9,'Present',2,"2025-09-30"),
('TG/2023/007','ICT1242','T',9,'Present',2,"2025-09-30"),
('TG/2023/008','ICT1242','T',9,'Present',2,"2025-09-30"),
('TG/2023/009','ICT1242','T',9,'Present',2,"2025-09-30"),
('TG/2023/010','ICT1242','T',9,'Present',2,"2025-09-30"),

('TG/2023/001','TCS1212','T',9,'Present',2,"2025-10-03"),
('TG/2023/002','TCS1212','T',9,'Present',2,"2025-10-03"),
('TG/2023/003','TCS1212','T',9,'Present',2,"2025-10-03"),
('TG/2023/004','TCS1212','T',9,'Present',2,"2025-10-03"),
('TG/2023/005','TCS1212','T',9,'Present',2,"2025-10-03"),
('TG/2023/006','TCS1212','T',9,'Present',2,"2025-10-03"),
('TG/2023/007','TCS1212','T',9,'Present',2,"2025-10-03"),
('TG/2023/008','TCS1212','T',9,'Present',2,"2025-10-03"),
('TG/2023/009','TCS1212','T',9,'Present',2,"2025-10-03"),
('TG/2023/010','TCS1212','T',9,'Present',2,"2025-10-03"),

('TG/2023/001','TMS1233','T',9,'Present',3,"2025-10-01"),
('TG/2023/002','TMS1233','T',9,'Present',3,"2025-10-01"),
('TG/2023/003','TMS1233','T',9,'Present',3,"2025-10-01"),
('TG/2023/004','TMS1233','T',9,'Present',3,"2025-10-01"),
('TG/2023/005','TMS1233','T',9,'Present',3,"2025-10-01"),
('TG/2023/006','TMS1233','T',9,'Present',3,"2025-10-01"),
('TG/2023/007','TMS1233','T',9,'Present',3,"2025-10-01"),
('TG/2023/008','TMS1233','T',9,'Present',3,"2025-10-01"),
('TG/2023/009','TMS1233','T',9,'Present',3,"2025-10-01"),
('TG/2023/010','TMS1233','T',9,'Present',3,"2025-10-01"),

('TG/2023/001','ENG1222','T',10,'Present',2,"2025-10-10"),
('TG/2023/002','ENG1222','T',10,'Present',2,"2025-10-10"),
('TG/2023/003','ENG1222','T',10,'Present',2,"2025-10-10"),
('TG/2023/004','ENG1222','T',10,'Present',2,"2025-10-10"),
('TG/2023/005','ENG1222','T',10,'Present',2,"2025-10-10"),
('TG/2023/006','ENG1222','T',10,'Present',2,"2025-10-10"),
('TG/2023/007','ENG1222','T',10,'Present',2,"2025-10-10"),
('TG/2023/008','ENG1222','T',10,'Present',2,"2025-10-10"),
('TG/2023/009','ENG1222','T',10,'Present',2,"2025-10-10"),
('TG/2023/010','ENG1222','T',10,'Present',2,"2025-10-10"),

('TG/2023/001','ICT1212','T',10,'Present',2,"2025-10-09"),
('TG/2023/002','ICT1212','T',10,'Present',2,"2025-10-09"),
('TG/2023/003','ICT1212','T',10,'Present',2,"2025-10-09"),
('TG/2023/004','ICT1212','T',10,'Present',2,"2025-10-09"),
('TG/2023/005','ICT1212','T',10,'Present',2,"2025-10-09"),
('TG/2023/006','ICT1212','T',10,'Present',2,"2025-10-09"),
('TG/2023/007','ICT1212','T',10,'Present',2,"2025-10-09"),
('TG/2023/008','ICT1212','T',10,'Present',2,"2025-10-09"),
('TG/2023/009','ICT1212','T',10,'Present',2,"2025-10-09"),
('TG/2023/010','ICT1212','T',10,'Present',2,"2025-10-09"),

('TG/2023/001','ICT1222','P',10,'Present',4,"2025-10-09"),
('TG/2023/002','ICT1222','P',10,'Present',4,"2025-10-09"),
('TG/2023/003','ICT1222','P',10,'Present',4,"2025-10-09"),
('TG/2023/004','ICT1222','P',10,'Present',4,"2025-10-09"),
('TG/2023/005','ICT1222','P',10,'Present',4,"2025-10-09"),
('TG/2023/006','ICT1222','P',10,'Present',4,"2025-10-09"),
('TG/2023/007','ICT1222','P',10,'Present',4,"2025-10-09"),
('TG/2023/008','ICT1222','P',10,'Present',4,"2025-10-09"),
('TG/2023/009','ICT1222','P',10,'Present',4,"2025-10-09"),
('TG/2023/010','ICT1222','P',10,'Present',4,"2025-10-09"),

('TG/2023/001','ICT1233','P',10,'Present',2,"2025-10-06"),
('TG/2023/002','ICT1233','P',10,'Present',2,"2025-10-06"),
('TG/2023/003','ICT1233','P',10,'Present',2,"2025-10-06"),
('TG/2023/004','ICT1233','P',10,'Present',2,"2025-10-06"),
('TG/2023/005','ICT1233','P',10,'Present',2,"2025-10-06"),
('TG/2023/006','ICT1233','P',10,'Present',2,"2025-10-06"),
('TG/2023/007','ICT1233','P',10,'Present',2,"2025-10-06"),
('TG/2023/008','ICT1233','P',10,'Present',2,"2025-10-06"),
('TG/2023/009','ICT1233','P',10,'Present',2,"2025-10-06"),
('TG/2023/010','ICT1233','P',10,'Present',2,"2025-10-06"),

('TG/2023/001','ICT1233','T',10,'Present',2,"2025-10-06"),
('TG/2023/002','ICT1233','T',10,'Present',2,"2025-10-06"),
('TG/2023/003','ICT1233','T',10,'Present',2,"2025-10-06"),
('TG/2023/004','ICT1233','T',10,'Present',2,"2025-10-06"),
('TG/2023/005','ICT1233','T',10,'Present',2,"2025-10-06"),
('TG/2023/006','ICT1233','T',10,'Present',2,"2025-10-06"),
('TG/2023/007','ICT1233','T',10,'Present',2,"2025-10-06"),
('TG/2023/008','ICT1233','T',10,'Present',2,"2025-10-06"),
('TG/2023/009','ICT1233','T',10,'Present',2,"2025-10-06"),
('TG/2023/010','ICT1233','T',10,'Present',2,"2025-10-06"),

('TG/2023/001','ICT1253','P',10,'Present',2,"2025-10-07"),
('TG/2023/002','ICT1253','P',10,'Present',2,"2025-10-07"),
('TG/2023/003','ICT1253','P',10,'Present',2,"2025-10-07"),
('TG/2023/004','ICT1253','P',10,'Present',2,"2025-10-07"),
('TG/2023/005','ICT1253','P',10,'Present',2,"2025-10-07"),
('TG/2023/006','ICT1253','P',10,'Present',2,"2025-10-07"),
('TG/2023/007','ICT1253','P',10,'Present',2,"2025-10-07"),
('TG/2023/008','ICT1253','P',10,'Present',2,"2025-10-07"),
('TG/2023/009','ICT1253','P',10,'Present',2,"2025-10-07"),
('TG/2023/010','ICT1253','P',10,'Present',2,"2025-10-07"),

('TG/2023/001','ICT1253','T',10,'Present',2,"2025-10-07"),
('TG/2023/002','ICT1253','T',10,'Present',2,"2025-10-07"),
('TG/2023/003','ICT1253','T',10,'Present',2,"2025-10-07"),
('TG/2023/004','ICT1253','T',10,'Present',2,"2025-10-07"),
('TG/2023/005','ICT1253','T',10,'Present',2,"2025-10-07"),
('TG/2023/006','ICT1253','T',10,'Present',2,"2025-10-07"),
('TG/2023/007','ICT1253','T',10,'Present',2,"2025-10-07"),
('TG/2023/008','ICT1253','T',10,'Present',2,"2025-10-07"),
('TG/2023/009','ICT1253','T',10,'Present',2,"2025-10-07"),
('TG/2023/010','ICT1253','T',10,'Present',2,"2025-10-07"),

('TG/2023/001','ICT1242','T',10,'Present',2,"2025-10-07"),
('TG/2023/002','ICT1242','T',10,'Present',2,"2025-10-07"),
('TG/2023/003','ICT1242','T',10,'Present',2,"2025-10-07"),
('TG/2023/004','ICT1242','T',10,'Present',2,"2025-10-07"),
('TG/2023/005','ICT1242','T',10,'Present',2,"2025-10-07"),
('TG/2023/006','ICT1242','T',10,'Present',2,"2025-10-07"),
('TG/2023/007','ICT1242','T',10,'Present',2,"2025-10-07"),
('TG/2023/008','ICT1242','T',10,'Present',2,"2025-10-07"),
('TG/2023/009','ICT1242','T',10,'Present',2,"2025-10-07"),
('TG/2023/010','ICT1242','T',10,'Present',2,"2025-10-07"),

('TG/2023/001','TCS1212','T',10,'Present',2,"2025-10-10"),
('TG/2023/002','TCS1212','T',10,'Present',2,"2025-10-10"),
('TG/2023/003','TCS1212','T',10,'Present',2,"2025-10-10"),
('TG/2023/004','TCS1212','T',10,'Present',2,"2025-10-10"),
('TG/2023/005','TCS1212','T',10,'Present',2,"2025-10-10"),
('TG/2023/006','TCS1212','T',10,'Present',2,"2025-10-10"),
('TG/2023/007','TCS1212','T',10,'Present',2,"2025-10-10"),
('TG/2023/008','TCS1212','T',10,'Present',2,"2025-10-10"),
('TG/2023/009','TCS1212','T',10,'Present',2,"2025-10-10"),
('TG/2023/010','TCS1212','T',10,'Present',2,"2025-10-10"),

('TG/2023/001','TMS1233','T',10,'Present',3,"2025-10-08"),
('TG/2023/002','TMS1233','T',10,'Present',3,"2025-10-08"),
('TG/2023/003','TMS1233','T',10,'Present',3,"2025-10-08"),
('TG/2023/004','TMS1233','T',10,'Present',3,"2025-10-08"),
('TG/2023/005','TMS1233','T',10,'Present',3,"2025-10-08"),
('TG/2023/006','TMS1233','T',10,'Present',3,"2025-10-08"),
('TG/2023/007','TMS1233','T',10,'Present',3,"2025-10-08"),
('TG/2023/008','TMS1233','T',10,'Present',3,"2025-10-08"),
('TG/2023/009','TMS1233','T',10,'Present',3,"2025-10-08"),
('TG/2023/010','TMS1233','T',10,'Present',3,"2025-10-08"),

('TG/2023/001','ENG1222','T',11,'Present',2,"2025-10-17"),
('TG/2023/002','ENG1222','T',11,'Present',2,"2025-10-17"),
('TG/2023/003','ENG1222','T',11,'Present',2,"2025-10-17"),
('TG/2023/004','ENG1222','T',11,'Present',2,"2025-10-17"),
('TG/2023/005','ENG1222','T',11,'Present',2,"2025-10-17"),
('TG/2023/006','ENG1222','T',11,'Present',2,"2025-10-17"),
('TG/2023/007','ENG1222','T',11,'Present',2,"2025-10-17"),
('TG/2023/008','ENG1222','T',11,'Present',2,"2025-10-17"),
('TG/2023/009','ENG1222','T',11,'Present',2,"2025-10-17"),
('TG/2023/010','ENG1222','T',11,'Present',2,"2025-10-17"),

('TG/2023/001','ICT1212','T',11,'Present',2,"2025-10-16"),
('TG/2023/002','ICT1212','T',11,'Present',2,"2025-10-16"),
('TG/2023/003','ICT1212','T',11,'Present',2,"2025-10-16"),
('TG/2023/004','ICT1212','T',11,'Present',2,"2025-10-16"),
('TG/2023/005','ICT1212','T',11,'Present',2,"2025-10-16"),
('TG/2023/006','ICT1212','T',11,'Present',2,"2025-10-16"),
('TG/2023/007','ICT1212','T',11,'Present',2,"2025-10-16"),
('TG/2023/008','ICT1212','T',11,'Present',2,"2025-10-16"),
('TG/2023/009','ICT1212','T',11,'Present',2,"2025-10-16"),
('TG/2023/010','ICT1212','T',11,'Present',2,"2025-10-16"),

('TG/2023/001','ICT1222','P',11,'Present',4,"2025-10-16"),
('TG/2023/002','ICT1222','P',11,'Present',4,"2025-10-16"),
('TG/2023/003','ICT1222','P',11,'Present',4,"2025-10-16"),
('TG/2023/004','ICT1222','P',11,'Present',4,"2025-10-16"),
('TG/2023/005','ICT1222','P',11,'Present',4,"2025-10-16"),
('TG/2023/006','ICT1222','P',11,'Present',4,"2025-10-16"),
('TG/2023/007','ICT1222','P',11,'Present',4,"2025-10-16"),
('TG/2023/008','ICT1222','P',11,'Present',4,"2025-10-16"),
('TG/2023/009','ICT1222','P',11,'Present',4,"2025-10-16"),
('TG/2023/010','ICT1222','P',11,'Present',4,"2025-10-16"),

('TG/2023/001','ICT1233','P',11,'Present',2,"2025-10-13"),
('TG/2023/002','ICT1233','P',11,'Present',2,"2025-10-13"),
('TG/2023/003','ICT1233','P',11,'Present',2,"2025-10-13"),
('TG/2023/004','ICT1233','P',11,'Present',2,"2025-10-13"),
('TG/2023/005','ICT1233','P',11,'Present',2,"2025-10-13"),
('TG/2023/006','ICT1233','P',11,'Present',2,"2025-10-13"),
('TG/2023/007','ICT1233','P',11,'Present',2,"2025-10-13"),
('TG/2023/008','ICT1233','P',11,'Present',2,"2025-10-13"),
('TG/2023/009','ICT1233','P',11,'Present',2,"2025-10-13"),
('TG/2023/010','ICT1233','P',11,'Present',2,"2025-10-13"),

('TG/2023/001','ICT1233','T',11,'Present',2,"2025-10-13"),
('TG/2023/002','ICT1233','T',11,'Present',2,"2025-10-13"),
('TG/2023/003','ICT1233','T',11,'Present',2,"2025-10-13"),
('TG/2023/004','ICT1233','T',11,'Present',2,"2025-10-13"),
('TG/2023/005','ICT1233','T',11,'Present',2,"2025-10-13"),
('TG/2023/006','ICT1233','T',11,'Present',2,"2025-10-13"),
('TG/2023/007','ICT1233','T',11,'Present',2,"2025-10-13"),
('TG/2023/008','ICT1233','T',11,'Present',2,"2025-10-13"),
('TG/2023/009','ICT1233','T',11,'Present',2,"2025-10-13"),
('TG/2023/010','ICT1233','T',11,'Present',2,"2025-10-13"),

('TG/2023/001','ICT1253','P',11,'Present',2,"2025-10-14"),
('TG/2023/002','ICT1253','P',11,'Present',2,"2025-10-14"),
('TG/2023/003','ICT1253','P',11,'Present',2,"2025-10-14"),
('TG/2023/004','ICT1253','P',11,'Present',2,"2025-10-14"),
('TG/2023/005','ICT1253','P',11,'Present',2,"2025-10-14"),
('TG/2023/006','ICT1253','P',11,'Present',2,"2025-10-14"),
('TG/2023/007','ICT1253','P',11,'Present',2,"2025-10-14"),
('TG/2023/008','ICT1253','P',11,'Present',2,"2025-10-14"),
('TG/2023/009','ICT1253','P',11,'Present',2,"2025-10-14"),
('TG/2023/010','ICT1253','P',11,'Present',2,"2025-10-14"),

('TG/2023/001','ICT1253','T',11,'Present',2,"2025-10-14"),
('TG/2023/002','ICT1253','T',11,'Present',2,"2025-10-14"),
('TG/2023/003','ICT1253','T',11,'Present',2,"2025-10-14"),
('TG/2023/004','ICT1253','T',11,'Present',2,"2025-10-14"),
('TG/2023/005','ICT1253','T',11,'Present',2,"2025-10-14"),
('TG/2023/006','ICT1253','T',11,'Present',2,"2025-10-14"),
('TG/2023/007','ICT1253','T',11,'Present',2,"2025-10-14"),
('TG/2023/008','ICT1253','T',11,'Present',2,"2025-10-14"),
('TG/2023/009','ICT1253','T',11,'Present',2,"2025-10-14"),
('TG/2023/010','ICT1253','T',11,'Present',2,"2025-10-14"),

('TG/2023/001','ICT1242','T',11,'Present',2,"2025-10-14"),
('TG/2023/002','ICT1242','T',11,'Present',2,"2025-10-14"),
('TG/2023/003','ICT1242','T',11,'Present',2,"2025-10-14"),
('TG/2023/004','ICT1242','T',11,'Present',2,"2025-10-14"),
('TG/2023/005','ICT1242','T',11,'Present',2,"2025-10-14"),
('TG/2023/006','ICT1242','T',11,'Present',2,"2025-10-14"),
('TG/2023/007','ICT1242','T',11,'Present',2,"2025-10-14"),
('TG/2023/008','ICT1242','T',11,'Present',2,"2025-10-14"),
('TG/2023/009','ICT1242','T',11,'Present',2,"2025-10-14"),
('TG/2023/010','ICT1242','T',11,'Present',2,"2025-10-14"),

('TG/2023/001','TCS1212','T',11,'Present',2,"2025-10-17"),
('TG/2023/002','TCS1212','T',11,'Present',2,"2025-10-17"),
('TG/2023/003','TCS1212','T',11,'Present',2,"2025-10-17"),
('TG/2023/004','TCS1212','T',11,'Present',2,"2025-10-17"),
('TG/2023/005','TCS1212','T',11,'Present',2,"2025-10-17"),
('TG/2023/006','TCS1212','T',11,'Present',2,"2025-10-17"),
('TG/2023/007','TCS1212','T',11,'Present',2,"2025-10-17"),
('TG/2023/008','TCS1212','T',11,'Present',2,"2025-10-17"),
('TG/2023/009','TCS1212','T',11,'Present',2,"2025-10-17"),
('TG/2023/010','TCS1212','T',11,'Present',2,"2025-10-17"),

('TG/2023/001','TMS1233','T',11,'Present',3,"2025-10-15"),
('TG/2023/002','TMS1233','T',11,'Present',3,"2025-10-15"),
('TG/2023/003','TMS1233','T',11,'Present',3,"2025-10-15"),
('TG/2023/004','TMS1233','T',11,'Present',3,"2025-10-15"),
('TG/2023/005','TMS1233','T',11,'Present',3,"2025-10-15"),
('TG/2023/006','TMS1233','T',11,'Present',3,"2025-10-15"),
('TG/2023/007','TMS1233','T',11,'Present',3,"2025-10-15"),
('TG/2023/008','TMS1233','T',11,'Present',3,"2025-10-15"),
('TG/2023/009','TMS1233','T',11,'Present',3,"2025-10-15"),
('TG/2023/010','TMS1233','T',11,'Present',3,"2025-10-15"),

('TG/2023/001','ENG1222','T',12,'Present',2,"2025-10-24"),
('TG/2023/002','ENG1222','T',12,'Present',2,"2025-10-24"),
('TG/2023/003','ENG1222','T',12,'Present',2,"2025-10-24"),
('TG/2023/004','ENG1222','T',12,'Present',2,"2025-10-24"),
('TG/2023/005','ENG1222','T',12,'Present',2,"2025-10-24"),
('TG/2023/006','ENG1222','T',12,'Present',2,"2025-10-24"),
('TG/2023/007','ENG1222','T',12,'Present',2,"2025-10-24"),
('TG/2023/008','ENG1222','T',12,'Present',2,"2025-10-24"),
('TG/2023/009','ENG1222','T',12,'Present',2,"2025-10-24"),
('TG/2023/010','ENG1222','T',12,'Present',2,"2025-10-24"),

('TG/2023/001','ICT1212','T',12,'Present',2,"2025-10-23"),
('TG/2023/002','ICT1212','T',12,'Present',2,"2025-10-23"),
('TG/2023/003','ICT1212','T',12,'Present',2,"2025-10-23"),
('TG/2023/004','ICT1212','T',12,'Present',2,"2025-10-23"),
('TG/2023/005','ICT1212','T',12,'Present',2,"2025-10-23"),
('TG/2023/006','ICT1212','T',12,'Present',2,"2025-10-23"),
('TG/2023/007','ICT1212','T',12,'Present',2,"2025-10-23"),
('TG/2023/008','ICT1212','T',12,'Present',2,"2025-10-23"),
('TG/2023/009','ICT1212','T',12,'Present',2,"2025-10-23"),
('TG/2023/010','ICT1212','T',12,'Present',2,"2025-10-23"),

('TG/2023/001','ICT1222','P',12,'Present',4,"2025-10-23"),
('TG/2023/002','ICT1222','P',12,'Present',4,"2025-10-23"),
('TG/2023/003','ICT1222','P',12,'Present',4,"2025-10-23"),
('TG/2023/004','ICT1222','P',12,'Present',4,"2025-10-23"),
('TG/2023/005','ICT1222','P',12,'Present',4,"2025-10-23"),
('TG/2023/006','ICT1222','P',12,'Present',4,"2025-10-23"),
('TG/2023/007','ICT1222','P',12,'Present',4,"2025-10-23"),
('TG/2023/008','ICT1222','P',12,'Present',4,"2025-10-23"),
('TG/2023/009','ICT1222','P',12,'Present',4,"2025-10-23"),
('TG/2023/010','ICT1222','P',12,'Present',4,"2025-10-23"),

('TG/2023/001','ICT1233','P',12,'Present',2,"2025-10-20"),
('TG/2023/002','ICT1233','P',12,'Present',2,"2025-10-20"),
('TG/2023/003','ICT1233','P',12,'Present',2,"2025-10-20"),
('TG/2023/004','ICT1233','P',12,'Present',2,"2025-10-20"),
('TG/2023/005','ICT1233','P',12,'Present',2,"2025-10-20"),
('TG/2023/006','ICT1233','P',12,'Present',2,"2025-10-20"),
('TG/2023/007','ICT1233','P',12,'Present',2,"2025-10-20"),
('TG/2023/008','ICT1233','P',12,'Present',2,"2025-10-20"),
('TG/2023/009','ICT1233','P',12,'Present',2,"2025-10-20"),
('TG/2023/010','ICT1233','P',12,'Present',2,"2025-10-20"),

('TG/2023/001','ICT1233','T',12,'Present',2,"2025-10-20"),
('TG/2023/002','ICT1233','T',12,'Present',2,"2025-10-20"),
('TG/2023/003','ICT1233','T',12,'Present',2,"2025-10-20"),
('TG/2023/004','ICT1233','T',12,'Present',2,"2025-10-20"),
('TG/2023/005','ICT1233','T',12,'Present',2,"2025-10-20"),
('TG/2023/006','ICT1233','T',12,'Present',2,"2025-10-20"),
('TG/2023/007','ICT1233','T',12,'Present',2,"2025-10-20"),
('TG/2023/008','ICT1233','T',12,'Present',2,"2025-10-20"),
('TG/2023/009','ICT1233','T',12,'Present',2,"2025-10-20"),
('TG/2023/010','ICT1233','T',12,'Present',2,"2025-10-20"),

('TG/2023/001','ICT1253','P',12,'Present',2,"2025-10-21"),
('TG/2023/002','ICT1253','P',12,'Present',2,"2025-10-21"),
('TG/2023/003','ICT1253','P',12,'Present',2,"2025-10-21"),
('TG/2023/004','ICT1253','P',12,'Present',2,"2025-10-21"),
('TG/2023/005','ICT1253','P',12,'Present',2,"2025-10-21"),
('TG/2023/006','ICT1253','P',12,'Present',2,"2025-10-21"),
('TG/2023/007','ICT1253','P',12,'Present',2,"2025-10-21"),
('TG/2023/008','ICT1253','P',12,'Present',2,"2025-10-21"),
('TG/2023/009','ICT1253','P',12,'Present',2,"2025-10-21"),
('TG/2023/010','ICT1253','P',12,'Present',2,"2025-10-21"),

('TG/2023/001','ICT1253','T',12,'Present',2,"2025-10-21"),
('TG/2023/002','ICT1253','T',12,'Present',2,"2025-10-21"),
('TG/2023/003','ICT1253','T',12,'Present',2,"2025-10-21"),
('TG/2023/004','ICT1253','T',12,'Present',2,"2025-10-21"),
('TG/2023/005','ICT1253','T',12,'Present',2,"2025-10-21"),
('TG/2023/006','ICT1253','T',12,'Present',2,"2025-10-21"),
('TG/2023/007','ICT1253','T',12,'Present',2,"2025-10-21"),
('TG/2023/008','ICT1253','T',12,'Present',2,"2025-10-21"),
('TG/2023/009','ICT1253','T',12,'Present',2,"2025-10-21"),
('TG/2023/010','ICT1253','T',12,'Present',2,"2025-10-21"),

('TG/2023/001','ICT1242','T',12,'Present',2,"2025-10-21"),
('TG/2023/002','ICT1242','T',12,'Present',2,"2025-10-21"),
('TG/2023/003','ICT1242','T',12,'Present',2,"2025-10-21"),
('TG/2023/004','ICT1242','T',12,'Present',2,"2025-10-21"),
('TG/2023/005','ICT1242','T',12,'Present',2,"2025-10-21"),
('TG/2023/006','ICT1242','T',12,'Present',2,"2025-10-21"),
('TG/2023/007','ICT1242','T',12,'Present',2,"2025-10-21"),
('TG/2023/008','ICT1242','T',12,'Present',2,"2025-10-21"),
('TG/2023/009','ICT1242','T',12,'Present',2,"2025-10-21"),
('TG/2023/010','ICT1242','T',12,'Present',2,"2025-10-21"),

('TG/2023/001','TCS1212','T',12,'Present',2,"2025-10-24"),
('TG/2023/002','TCS1212','T',12,'Present',2,"2025-10-24"),
('TG/2023/003','TCS1212','T',12,'Present',2,"2025-10-24"),
('TG/2023/004','TCS1212','T',12,'Present',2,"2025-10-24"),
('TG/2023/005','TCS1212','T',12,'Present',2,"2025-10-24"),
('TG/2023/006','TCS1212','T',12,'Present',2,"2025-10-24"),
('TG/2023/007','TCS1212','T',12,'Present',2,"2025-10-24"),
('TG/2023/008','TCS1212','T',12,'Present',2,"2025-10-24"),
('TG/2023/009','TCS1212','T',12,'Present',2,"2025-10-24"),
('TG/2023/010','TCS1212','T',12,'Present',2,"2025-10-24"),

('TG/2023/001','TMS1233','T',12,'Present',3,"2025-10-22"),
('TG/2023/002','TMS1233','T',12,'Present',3,"2025-10-22"),
('TG/2023/003','TMS1233','T',12,'Present',3,"2025-10-22"),
('TG/2023/004','TMS1233','T',12,'Present',3,"2025-10-22"),
('TG/2023/005','TMS1233','T',12,'Present',3,"2025-10-22"),
('TG/2023/006','TMS1233','T',12,'Present',3,"2025-10-22"),
('TG/2023/007','TMS1233','T',12,'Present',3,"2025-10-22"),
('TG/2023/008','TMS1233','T',12,'Present',3,"2025-10-22"),
('TG/2023/009','TMS1233','T',12,'Present',3,"2025-10-22"),
('TG/2023/010','TMS1233','T',12,'Present',3,"2025-10-22"),

('TG/2023/001','ENG1222','T',13,'Present',2,"2025-10-31"),
('TG/2023/002','ENG1222','T',13,'Present',2,"2025-10-31"),
('TG/2023/003','ENG1222','T',13,'Present',2,"2025-10-31"),
('TG/2023/004','ENG1222','T',13,'Present',2,"2025-10-31"),
('TG/2023/005','ENG1222','T',13,'Present',2,"2025-10-31"),
('TG/2023/006','ENG1222','T',13,'Present',2,"2025-10-31"),
('TG/2023/007','ENG1222','T',13,'Present',2,"2025-10-31"),
('TG/2023/008','ENG1222','T',13,'Present',2,"2025-10-31"),
('TG/2023/009','ENG1222','T',13,'Present',2,"2025-10-31"),
('TG/2023/010','ENG1222','T',13,'Present',2,"2025-10-31"),

('TG/2023/001','ICT1212','T',13,'Present',2,"2025-10-30"),
('TG/2023/002','ICT1212','T',13,'Present',2,"2025-10-30"),
('TG/2023/003','ICT1212','T',13,'Present',2,"2025-10-30"),
('TG/2023/004','ICT1212','T',13,'Present',2,"2025-10-30"),
('TG/2023/005','ICT1212','T',13,'Present',2,"2025-10-30"),
('TG/2023/006','ICT1212','T',13,'Present',2,"2025-10-30"),
('TG/2023/007','ICT1212','T',13,'Present',2,"2025-10-30"),
('TG/2023/008','ICT1212','T',13,'Present',2,"2025-10-30"),
('TG/2023/009','ICT1212','T',13,'Present',2,"2025-10-30"),
('TG/2023/010','ICT1212','T',13,'Present',2,"2025-10-30"),

('TG/2023/001','ICT1222','P',13,'Present',4,"2025-10-30"),
('TG/2023/002','ICT1222','P',13,'Present',4,"2025-10-30"),
('TG/2023/003','ICT1222','P',13,'Present',4,"2025-10-30"),
('TG/2023/004','ICT1222','P',13,'Present',4,"2025-10-30"),
('TG/2023/005','ICT1222','P',13,'Present',4,"2025-10-30"),
('TG/2023/006','ICT1222','P',13,'Present',4,"2025-10-30"),
('TG/2023/007','ICT1222','P',13,'Present',4,"2025-10-30"),
('TG/2023/008','ICT1222','P',13,'Present',4,"2025-10-30"),
('TG/2023/009','ICT1222','P',13,'Present',4,"2025-10-30"),
('TG/2023/010','ICT1222','P',13,'Present',4,"2025-10-30"),

('TG/2023/001','ICT1233','P',13,'Present',2,"2025-10-27"),
('TG/2023/002','ICT1233','P',13,'Present',2,"2025-10-27"),
('TG/2023/003','ICT1233','P',13,'Present',2,"2025-10-27"),
('TG/2023/004','ICT1233','P',13,'Present',2,"2025-10-27"),
('TG/2023/005','ICT1233','P',13,'Present',2,"2025-10-27"),
('TG/2023/006','ICT1233','P',13,'Present',2,"2025-10-27"),
('TG/2023/007','ICT1233','P',13,'Present',2,"2025-10-27"),
('TG/2023/008','ICT1233','P',13,'Present',2,"2025-10-27"),
('TG/2023/009','ICT1233','P',13,'Present',2,"2025-10-27"),
('TG/2023/010','ICT1233','P',13,'Present',2,"2025-10-27"),

('TG/2023/001','ICT1233','T',13,'Present',2,"2025-10-27"),
('TG/2023/002','ICT1233','T',13,'Present',2,"2025-10-27"),
('TG/2023/003','ICT1233','T',13,'Present',2,"2025-10-27"),
('TG/2023/004','ICT1233','T',13,'Present',2,"2025-10-27"),
('TG/2023/005','ICT1233','T',13,'Present',2,"2025-10-27"),
('TG/2023/006','ICT1233','T',13,'Present',2,"2025-10-27"),
('TG/2023/007','ICT1233','T',13,'Present',2,"2025-10-27"),
('TG/2023/008','ICT1233','T',13,'Present',2,"2025-10-27"),
('TG/2023/009','ICT1233','T',13,'Present',2,"2025-10-27"),
('TG/2023/010','ICT1233','T',13,'Present',2,"2025-10-27"),

('TG/2023/001','ICT1253','P',13,'Present',2,"2025-10-28"),
('TG/2023/002','ICT1253','P',13,'Present',2,"2025-10-28"),
('TG/2023/003','ICT1253','P',13,'Present',2,"2025-10-28"),
('TG/2023/004','ICT1253','P',13,'Present',2,"2025-10-28"),
('TG/2023/005','ICT1253','P',13,'Present',2,"2025-10-28"),
('TG/2023/006','ICT1253','P',13,'Present',2,"2025-10-28"),
('TG/2023/007','ICT1253','P',13,'Present',2,"2025-10-28"),
('TG/2023/008','ICT1253','P',13,'Present',2,"2025-10-28"),
('TG/2023/009','ICT1253','P',13,'Present',2,"2025-10-28"),
('TG/2023/010','ICT1253','P',13,'Present',2,"2025-10-28"),

('TG/2023/001','ICT1253','T',13,'Present',2,"2025-10-28"),
('TG/2023/002','ICT1253','T',13,'Present',2,"2025-10-28"),
('TG/2023/003','ICT1253','T',13,'Present',2,"2025-10-28"),
('TG/2023/004','ICT1253','T',13,'Present',2,"2025-10-28"),
('TG/2023/005','ICT1253','T',13,'Present',2,"2025-10-28"),
('TG/2023/006','ICT1253','T',13,'Present',2,"2025-10-28"),
('TG/2023/007','ICT1253','T',13,'Present',2,"2025-10-28"),
('TG/2023/008','ICT1253','T',13,'Present',2,"2025-10-28"),
('TG/2023/009','ICT1253','T',13,'Present',2,"2025-10-28"),
('TG/2023/010','ICT1253','T',13,'Present',2,"2025-10-28"),

('TG/2023/001','ICT1242','T',13,'Present',2,"2025-10-28"),
('TG/2023/002','ICT1242','T',13,'Present',2,"2025-10-28"),
('TG/2023/003','ICT1242','T',13,'Present',2,"2025-10-28"),
('TG/2023/004','ICT1242','T',13,'Present',2,"2025-10-28"),
('TG/2023/005','ICT1242','T',13,'Present',2,"2025-10-28"),
('TG/2023/006','ICT1242','T',13,'Present',2,"2025-10-28"),
('TG/2023/007','ICT1242','T',13,'Present',2,"2025-10-28"),
('TG/2023/008','ICT1242','T',13,'Present',2,"2025-10-28"),
('TG/2023/009','ICT1242','T',13,'Present',2,"2025-10-28"),
('TG/2023/010','ICT1242','T',13,'Present',2,"2025-10-28"),

('TG/2023/001','TCS1212','T',13,'Present',2,"2025-10-31"),
('TG/2023/002','TCS1212','T',13,'Present',2,"2025-10-31"),
('TG/2023/003','TCS1212','T',13,'Present',2,"2025-10-31"),
('TG/2023/004','TCS1212','T',13,'Present',2,"2025-10-31"),
('TG/2023/005','TCS1212','T',13,'Present',2,"2025-10-31"),
('TG/2023/006','TCS1212','T',13,'Present',2,"2025-10-31"),
('TG/2023/007','TCS1212','T',13,'Present',2,"2025-10-31"),
('TG/2023/008','TCS1212','T',13,'Present',2,"2025-10-31"),
('TG/2023/009','TCS1212','T',13,'Present',2,"2025-10-31"),
('TG/2023/010','TCS1212','T',13,'Present',2,"2025-10-31"),

('TG/2023/001','TMS1233','T',13,'Present',3,"2025-10-29"),
('TG/2023/002','TMS1233','T',13,'Present',3,"2025-10-29"),
('TG/2023/003','TMS1233','T',13,'Present',3,"2025-10-29"),
('TG/2023/004','TMS1233','T',13,'Present',3,"2025-10-29"),
('TG/2023/005','TMS1233','T',13,'Present',3,"2025-10-29"),
('TG/2023/006','TMS1233','T',13,'Present',3,"2025-10-29"),
('TG/2023/007','TMS1233','T',13,'Present',3,"2025-10-29"),
('TG/2023/008','TMS1233','T',13,'Present',3,"2025-10-29"),
('TG/2023/009','TMS1233','T',13,'Present',3,"2025-10-29"),
('TG/2023/010','TMS1233','T',13,'Present',3,"2025-10-29"),

('TG/2023/001','ENG1222','T',14,'Present',2,"2025-11-07"),
('TG/2023/002','ENG1222','T',14,'Present',2,"2025-11-07"),
('TG/2023/003','ENG1222','T',14,'Present',2,"2025-11-07"),
('TG/2023/004','ENG1222','T',14,'Present',2,"2025-11-07"),
('TG/2023/005','ENG1222','T',14,'Present',2,"2025-11-07"),
('TG/2023/006','ENG1222','T',14,'Present',2,"2025-11-07"),
('TG/2023/007','ENG1222','T',14,'Present',2,"2025-11-07"),
('TG/2023/008','ENG1222','T',14,'Present',2,"2025-11-07"),
('TG/2023/009','ENG1222','T',14,'Present',2,"2025-11-07"),
('TG/2023/010','ENG1222','T',14,'Present',2,"2025-11-07"),

('TG/2023/001','ICT1212','T',14,'Present',2,"2025-11-06"),
('TG/2023/002','ICT1212','T',14,'Present',2,"2025-11-06"),
('TG/2023/003','ICT1212','T',14,'Present',2,"2025-11-06"),
('TG/2023/004','ICT1212','T',14,'Present',2,"2025-11-06"),
('TG/2023/005','ICT1212','T',14,'Present',2,"2025-11-06"),
('TG/2023/006','ICT1212','T',14,'Present',2,"2025-11-06"),
('TG/2023/007','ICT1212','T',14,'Present',2,"2025-11-06"),
('TG/2023/008','ICT1212','T',14,'Present',2,"2025-11-06"),
('TG/2023/009','ICT1212','T',14,'Present',2,"2025-11-06"),
('TG/2023/010','ICT1212','T',14,'Present',2,"2025-11-06"),

('TG/2023/001','ICT1222','P',14,'Present',4,"2025-11-06"),
('TG/2023/002','ICT1222','P',14,'Present',4,"2025-11-06"),
('TG/2023/003','ICT1222','P',14,'Present',4,"2025-11-06"),
('TG/2023/004','ICT1222','P',14,'Present',4,"2025-11-06"),
('TG/2023/005','ICT1222','P',14,'Present',4,"2025-11-06"),
('TG/2023/006','ICT1222','P',14,'Present',4,"2025-11-06"),
('TG/2023/007','ICT1222','P',14,'Present',4,"2025-11-06"),
('TG/2023/008','ICT1222','P',14,'Present',4,"2025-11-06"),
('TG/2023/009','ICT1222','P',14,'Present',4,"2025-11-06"),
('TG/2023/010','ICT1222','P',14,'Present',4,"2025-11-06"),

('TG/2023/001','ICT1233','P',14,'Present',2,"2025-11-03"),
('TG/2023/002','ICT1233','P',14,'Present',2,"2025-11-03"),
('TG/2023/003','ICT1233','P',14,'Present',2,"2025-11-03"),
('TG/2023/004','ICT1233','P',14,'Present',2,"2025-11-03"),
('TG/2023/005','ICT1233','P',14,'Present',2,"2025-11-03"),
('TG/2023/006','ICT1233','P',14,'Present',2,"2025-11-03"),
('TG/2023/007','ICT1233','P',14,'Present',2,"2025-11-03"),
('TG/2023/008','ICT1233','P',14,'Present',2,"2025-11-03"),
('TG/2023/009','ICT1233','P',14,'Present',2,"2025-11-03"),
('TG/2023/010','ICT1233','P',14,'Present',2,"2025-11-03"),

('TG/2023/001','ICT1233','T',14,'Present',2,"2025-11-03"),
('TG/2023/002','ICT1233','T',14,'Present',2,"2025-11-03"),
('TG/2023/003','ICT1233','T',14,'Present',2,"2025-11-03"),
('TG/2023/004','ICT1233','T',14,'Present',2,"2025-11-03"),
('TG/2023/005','ICT1233','T',14,'Present',2,"2025-11-03"),
('TG/2023/006','ICT1233','T',14,'Present',2,"2025-11-03"),
('TG/2023/007','ICT1233','T',14,'Present',2,"2025-11-03"),
('TG/2023/008','ICT1233','T',14,'Present',2,"2025-11-03"),
('TG/2023/009','ICT1233','T',14,'Present',2,"2025-11-03"),
('TG/2023/010','ICT1233','T',14,'Present',2,"2025-11-03"),

('TG/2023/001','ICT1253','P',14,'Present',2,"2025-11-04"),
('TG/2023/002','ICT1253','P',14,'Present',2,"2025-11-04"),
('TG/2023/003','ICT1253','P',14,'Present',2,"2025-11-04"),
('TG/2023/004','ICT1253','P',14,'Present',2,"2025-11-04"),
('TG/2023/005','ICT1253','P',14,'Present',2,"2025-11-04"),
('TG/2023/006','ICT1253','P',14,'Present',2,"2025-11-04"),
('TG/2023/007','ICT1253','P',14,'Present',2,"2025-11-04"),
('TG/2023/008','ICT1253','P',14,'Present',2,"2025-11-04"),
('TG/2023/009','ICT1253','P',14,'Present',2,"2025-11-04"),
('TG/2023/010','ICT1253','P',14,'Present',2,"2025-11-04"),

('TG/2023/001','ICT1253','T',14,'Present',2,"2025-11-04"),
('TG/2023/002','ICT1253','T',14,'Present',2,"2025-11-04"),
('TG/2023/003','ICT1253','T',14,'Present',2,"2025-11-04"),
('TG/2023/004','ICT1253','T',14,'Present',2,"2025-11-04"),
('TG/2023/005','ICT1253','T',14,'Present',2,"2025-11-04"),
('TG/2023/006','ICT1253','T',14,'Present',2,"2025-11-04"),
('TG/2023/007','ICT1253','T',14,'Present',2,"2025-11-04"),
('TG/2023/008','ICT1253','T',14,'Present',2,"2025-11-04"),
('TG/2023/009','ICT1253','T',14,'Present',2,"2025-11-04"),
('TG/2023/010','ICT1253','T',14,'Present',2,"2025-11-04"),

('TG/2023/001','ICT1242','T',14,'Present',2,"2025-11-04"),
('TG/2023/002','ICT1242','T',14,'Present',2,"2025-11-04"),
('TG/2023/003','ICT1242','T',14,'Present',2,"2025-11-04"),
('TG/2023/004','ICT1242','T',14,'Present',2,"2025-11-04"),
('TG/2023/005','ICT1242','T',14,'Present',2,"2025-11-04"),
('TG/2023/006','ICT1242','T',14,'Present',2,"2025-11-04"),
('TG/2023/007','ICT1242','T',14,'Present',2,"2025-11-04"),
('TG/2023/008','ICT1242','T',14,'Present',2,"2025-11-04"),
('TG/2023/009','ICT1242','T',14,'Present',2,"2025-11-04"),
('TG/2023/010','ICT1242','T',14,'Present',2,"2025-11-04"),

('TG/2023/001','TCS1212','T',14,'Present',2,"2025-11-07"),
('TG/2023/002','TCS1212','T',14,'Present',2,"2025-11-07"),
('TG/2023/003','TCS1212','T',14,'Present',2,"2025-11-07"),
('TG/2023/004','TCS1212','T',14,'Present',2,"2025-11-07"),
('TG/2023/005','TCS1212','T',14,'Present',2,"2025-11-07"),
('TG/2023/006','TCS1212','T',14,'Present',2,"2025-11-07"),
('TG/2023/007','TCS1212','T',14,'Present',2,"2025-11-07"),
('TG/2023/008','TCS1212','T',14,'Present',2,"2025-11-07"),
('TG/2023/009','TCS1212','T',14,'Present',2,"2025-11-07"),
('TG/2023/010','TCS1212','T',14,'Present',2,"2025-11-07"),

('TG/2023/001','TMS1233','T',14,'Present',3,"2025-11-05"),
('TG/2023/002','TMS1233','T',14,'Present',3,"2025-11-05"),
('TG/2023/003','TMS1233','T',14,'Present',3,"2025-11-05"),
('TG/2023/004','TMS1233','T',14,'Present',3,"2025-11-05"),
('TG/2023/005','TMS1233','T',14,'Present',3,"2025-11-05"),
('TG/2023/006','TMS1233','T',14,'Present',3,"2025-11-05"),
('TG/2023/007','TMS1233','T',14,'Present',3,"2025-11-05"),
('TG/2023/008','TMS1233','T',14,'Present',3,"2025-11-05"),
('TG/2023/009','TMS1233','T',14,'Present',3,"2025-11-05"),
('TG/2023/010','TMS1233','T',14,'Present',3,"2025-11-05");

CREATE TABLE Attendence_handle(
	C_code CHAR(8) NOT NULL,
	C_type ENUM('P','T') NOT NULL,
	Week INT NOT NULL,
	Tec_id CHAR(12) NOT NULL,
    Handle_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(C_code,C_type,week),

	-- Foreign key 2:Relate to the Course
	CONSTRAINT fk_AttendenceHandle FOREIGN KEY(C_code,C_type) REFERENCES Course(C_code,C_type)
    ON UPDATE CASCADE,
	
	-- Foreign key 3:Relate to Technical_officer
	CONSTRAINT fk_Officerhandle FOREIGN KEY(Tec_id) REFERENCES User(User_id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- insert data
INSERT INTO Attendence_handle 
	(C_code,C_type,Week,Tec_id)
VALUES
	('ENG1222','T',1,'Tech/Fot/002'),
	('ICT1212','T',1,'Tech/Fot/002'),
	('ICT1222','P',1,'Tech/Fot/002'),
	('ICT1233','T',1,'Tech/Fot/002'),
	('ICT1233','P',1,'Tech/Fot/002'),
	('ICT1242','T',1,'Tech/Fot/004'),
	('ICT1253','T',1,'Tech/Fot/004'),
	('ICT1253','P',1,'Tech/Fot/004'),
	('TCS1212','T',1,'Tech/Fot/004'),
	('TMS1233','T',1,'Tech/Fot/004'),
	('ENG1222','T',2,'Tech/Fot/005'),
	('ICT1212','T',2,'Tech/Fot/005'),
	('ICT1222','P',2,'Tech/Fot/005'),
	('ICT1233','T',2,'Tech/Fot/005'),
	('ICT1233','P',2,'Tech/Fot/005'),
	('ICT1242','T',2,'Tech/Fot/003'),
	('ICT1253','T',2,'Tech/Fot/003'),
	('ICT1253','P',2,'Tech/Fot/003'),
	('TCS1212','T',2,'Tech/Fot/003'),
	('TMS1233','T',2,'Tech/Fot/003'),
	('ENG1222','T',3,'Tech/Fot/002'),
	('ICT1212','T',3,'Tech/Fot/002'),
	('ICT1222','P',3,'Tech/Fot/002'),
	('ICT1233','T',3,'Tech/Fot/002'),
	('ICT1233','P',3,'Tech/Fot/001'),
	('ICT1242','T',3,'Tech/Fot/001'),
	('ICT1253','T',3,'Tech/Fot/001'),
	('ICT1253','P',3,'Tech/Fot/001'),
	('TCS1212','T',3,'Tech/Fot/001'),
	('TMS1233','T',3,'Tech/Fot/001'),
	('ENG1222','T',4,'Tech/Fot/005'),
	('ICT1212','T',4,'Tech/Fot/005'),
	('ICT1222','P',4,'Tech/Fot/005'),
	('ICT1233','T',4,'Tech/Fot/005'),
	('ICT1233','P',4,'Tech/Fot/005'),
	('ICT1242','T',4,'Tech/Fot/004'),
	('ICT1253','T',4,'Tech/Fot/004'),
	('ICT1253','P',4,'Tech/Fot/004'),
	('TCS1212','T',4,'Tech/Fot/004'),
	('TMS1233','T',4,'Tech/Fot/004'),
	('ENG1222','T',5,'Tech/Fot/003'),
	('ICT1212','T',5,'Tech/Fot/003'),
	('ICT1222','P',5,'Tech/Fot/003'),
	('ICT1233','T',5,'Tech/Fot/003'),
	('ICT1233','P',5,'Tech/Fot/003'),
	('ICT1242','T',5,'Tech/Fot/003'),
	('ICT1253','T',5,'Tech/Fot/002'),
	('ICT1253','P',5,'Tech/Fot/002'),
	('TCS1212','T',5,'Tech/Fot/002'),
	('TMS1233','T',5,'Tech/Fot/002'),
	('ENG1222','T',6,'Tech/Fot/002'),
	('ICT1212','T',6,'Tech/Fot/001'),
	('ICT1222','P',6,'Tech/Fot/001'),
	('ICT1233','T',6,'Tech/Fot/001'),
	('ICT1233','P',6,'Tech/Fot/001'),
	('ICT1242','T',6,'Tech/Fot/001'),
	('ICT1253','T',6,'Tech/Fot/004'),
	('ICT1253','P',6,'Tech/Fot/004'),
	('TCS1212','T',6,'Tech/Fot/004'),
	('TMS1233','T',6,'Tech/Fot/004'),
	('ENG1222','T',7,'Tech/Fot/005'),
	('ICT1212','T',7,'Tech/Fot/005'),
	('ICT1222','P',7,'Tech/Fot/005'),
	('ICT1233','T',7,'Tech/Fot/005'),
	('ICT1233','P',7,'Tech/Fot/005'),
	('ICT1242','T',7,'Tech/Fot/003'),
	('ICT1253','T',7,'Tech/Fot/003'),
	('ICT1253','P',7,'Tech/Fot/003'),
	('TCS1212','T',7,'Tech/Fot/003'),
	('TMS1233','T',7,'Tech/Fot/003'),
	('ENG1222','T',8,'Tech/Fot/002'),
	('ICT1212','T',8,'Tech/Fot/002'),
	('ICT1222','P',8,'Tech/Fot/002'),
	('ICT1233','T',8,'Tech/Fot/002'),
	('ICT1233','P',8,'Tech/Fot/002'),
	('ICT1242','T',8,'Tech/Fot/002'),
	('ICT1253','T',8,'Tech/Fot/001'),
	('ICT1253','P',8,'Tech/Fot/001'),
	('TCS1212','T',8,'Tech/Fot/001'),
	('TMS1233','T',8,'Tech/Fot/001'),
	('ENG1222','T',9,'Tech/Fot/004'),
	('ICT1212','T',9,'Tech/Fot/004'),
	('ICT1222','P',9,'Tech/Fot/004'),
	('ICT1233','T',9,'Tech/Fot/004'),
	('ICT1233','P',9,'Tech/Fot/004'),
	('ICT1242','T',9,'Tech/Fot/003'),
	('ICT1253','T',9,'Tech/Fot/003'),
	('ICT1253','P',9,'Tech/Fot/003'),
	('TCS1212','T',9,'Tech/Fot/003'),
	('TMS1233','T',9,'Tech/Fot/003'),
	('ENG1222','T',10,'Tech/Fot/005'),
	('ICT1212','T',10,'Tech/Fot/005'),
	('ICT1222','P',10,'Tech/Fot/005'),
	('ICT1233','T',10,'Tech/Fot/005'),
	('ICT1233','P',10,'Tech/Fot/005'),
	('ICT1242','T',10,'Tech/Fot/001'),
	('ICT1253','T',10,'Tech/Fot/001'),
	('ICT1253','P',10,'Tech/Fot/001'),
	('TCS1212','T',10,'Tech/Fot/001'),
	('TMS1233','T',10,'Tech/Fot/001'),
	('ENG1222','T',11,'Tech/Fot/004'),
	('ICT1212','T',11,'Tech/Fot/004'),
	('ICT1222','P',11,'Tech/Fot/004'),
	('ICT1233','T',11,'Tech/Fot/004'),
	('ICT1233','P',11,'Tech/Fot/004'),
	('ICT1242','T',11,'Tech/Fot/002'),
	('ICT1253','T',11,'Tech/Fot/002'),
	('ICT1253','P',11,'Tech/Fot/002'),
	('TCS1212','T',11,'Tech/Fot/002'),
	('TMS1233','T',11,'Tech/Fot/002'),
	('ENG1222','T',12,'Tech/Fot/003'),
	('ICT1212','T',12,'Tech/Fot/003'),
	('ICT1222','P',12,'Tech/Fot/003'),
	('ICT1233','T',12,'Tech/Fot/003'),
	('ICT1233','P',12,'Tech/Fot/003'),
	('ICT1242','T',12,'Tech/Fot/005'),
	('ICT1253','T',12,'Tech/Fot/005'),
	('ICT1253','P',12,'Tech/Fot/005'),
	('TCS1212','T',12,'Tech/Fot/005'),
	('TMS1233','T',12,'Tech/Fot/005'),
	('ENG1222','T',13,'Tech/Fot/001'),
	('ICT1212','T',13,'Tech/Fot/001'),
	('ICT1222','P',13,'Tech/Fot/001'),
	('ICT1233','T',13,'Tech/Fot/001'),
	('ICT1233','P',13,'Tech/Fot/001'),
	('ICT1242','T',13,'Tech/Fot/004'),
	('ICT1253','T',13,'Tech/Fot/004'),
	('ICT1253','P',13,'Tech/Fot/004'),
	('TCS1212','T',13,'Tech/Fot/004'),
	('TMS1233','T',13,'Tech/Fot/004'),
	('ENG1222','T',14,'Tech/Fot/002'),
	('ICT1212','T',14,'Tech/Fot/002'),
	('ICT1222','P',14,'Tech/Fot/002'),
	('ICT1233','T',14,'Tech/Fot/002'),
	('ICT1233','P',14,'Tech/Fot/003'),
	('ICT1242','T',14,'Tech/Fot/003'),
	('ICT1253','T',14,'Tech/Fot/003'),
	('ICT1253','P',14,'Tech/Fot/003'),
	('TCS1212','T',14,'Tech/Fot/003'),
	('TMS1233','T',14,'Tech/Fot/003'),
	('ENG1222','T',15,'Tech/Fot/005'),
	('ICT1212','T',15,'Tech/Fot/005'),
	('ICT1222','P',15,'Tech/Fot/005'),
	('ICT1233','T',15,'Tech/Fot/005'),
	('ICT1233','P',15,'Tech/Fot/005'),
	('ICT1242','T',15,'Tech/Fot/005'),
	('ICT1253','T',15,'Tech/Fot/001'),
	('ICT1253','P',15,'Tech/Fot/001'),
	('TCS1212','T',15,'Tech/Fot/001'),
	('TMS1233','T',15,'Tech/Fot/001');

    -- Quiz
CREATE TABLE Quiz(
    C_code CHAR(8) NOT NULL,
    C_type ENUM('P','T') NOT NULL,
    Regno CHAR(12) NOT NULL,
    Mark FLOAT(5,2) CHECK (Mark >= 0 AND Mark <= 100),
    Q_no INT NOT NULL CHECK (Q_no >= 1 AND Q_no <= 3),

    PRIMARY KEY(C_code, C_type, Regno, Q_no),

    -- Foreign_Key 1: Relate to the course
    CONSTRAINT fk_QCourse FOREIGN KEY(C_code, C_type) REFERENCES Course(C_code, C_type)
    ON UPDATE CASCADE,

    -- FOREIGN_KEY 2: Relate to the student
    CONSTRAINT fk_Qregno FOREIGN KEY(Regno) REFERENCES User(User_id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- insert data
INSERT INTO Quiz (Regno, C_code, C_type, Q_no, Mark)VALUES
('TG/2023/001','ICT1233','T', 1, 85.0),
('TG/2023/001','ICT1233','P', 1, 90.0),
('TG/2023/001','ICT1253','T', 1, 75.0),
('TG/2023/001','ICT1253','P', 1, 50.0),
('TG/2023/001','ICT1242','T', 1, 67.5),
('TG/2023/001','TMS1233','T', 1, 92.0),
('TG/2023/001','ICT1212','T', 1, 95.0),
('TG/2023/001','ICT1222','P', 1, 92.5),
('TG/2023/001','TCS1212','T', 1, 80.0),
('TG/2023/001','ICT1233','T', 2, 62.5),
('TG/2023/001','ICT1233','P', 2, 50.0),
('TG/2023/001','ICT1253','T', 2, 75.0),
('TG/2023/001','ICT1253','P', 2, 67.5),
('TG/2023/001','ICT1242','T', 2, 72.0),
('TG/2023/001','TMS1233','T', 2, 81.0),
('TG/2023/001','ICT1212','T', 2, 87.5),
('TG/2023/001','ICT1222','P', 2, 85.0),
('TG/2023/001','TCS1212','T', 2, 79.0),
('TG/2023/001','ICT1233','T', 3, 70.0),
('TG/2023/001','ICT1233','P', 3, 68.0),
('TG/2023/001','ICT1253','T', 3, 77.5),
('TG/2023/001','ICT1253','P', 3, 80.0),
('TG/2023/001','ICT1242','T', 3, 69.0),
('TG/2023/001','TMS1233','T', 3, 85.0),
('TG/2023/001','ICT1212','T', 3, 90.0),
('TG/2023/001','ICT1222','P', 3, 91.0),
('TG/2023/001','TCS1212','T', 3, 82.5),

('TG/2023/002','ICT1233','T', 1, 80.0),
('TG/2023/002','ICT1233','P', 1, 79.0),
('TG/2023/002','ICT1253','T', 1, 70.0),
('TG/2023/002','ICT1253','P', 1, 67.5),
('TG/2023/002','ICT1242','T', 1, 72.0),
('TG/2023/002','TMS1233','T', 1, 85.0),
('TG/2023/002','ICT1212','T', 1, 80.0),
('TG/2023/002','ICT1222','P', 1, 82.0),
('TG/2023/002','TCS1212','T', 1, 77.5),
('TG/2023/002','ICT1233','T', 2, 78.0),
('TG/2023/002','ICT1233','P', 2, 82.0),
('TG/2023/002','ICT1253','T', 2, 69.0),
('TG/2023/002','ICT1253','P', 2, 75.0),
('TG/2023/002','ICT1242','T', 2, 81.0),
('TG/2023/002','TMS1233','T', 2, 92.5),
('TG/2023/002','ICT1212','T', 2, 86.0),
('TG/2023/002','ICT1222','P', 2, 84.5),
('TG/2023/002','TCS1212','T', 2, 79.5),
('TG/2023/002','ICT1233','T', 3, 81.0),
('TG/2023/002','ICT1233','P', 3, 76.0),
('TG/2023/002','ICT1253','T', 3, 67.5),
('TG/2023/002','ICT1253','P', 3, 65.0),
('TG/2023/002','ICT1242','T', 3, 74.0),
('TG/2023/002','TMS1233','T', 3, 89.0),
('TG/2023/002','ICT1212','T', 3, 87.5),
('TG/2023/002','ICT1222','P', 3, 90.0),
('TG/2023/002','TCS1212','T', 3, 83.0),

('TG/2023/003','ICT1233','T', 1, 87.5),
('TG/2023/003','ICT1233','P', 1, 91.0),
('TG/2023/003','ICT1253','T', 1, 80.0),
('TG/2023/003','ICT1253','P', 1, 78.0),
('TG/2023/003','ICT1242','T', 1, 85.0),
('TG/2023/003','TMS1233','T', 1, 93.0),
('TG/2023/003','ICT1212','T', 1, 90.0),
('TG/2023/003','ICT1222','P', 1, 88.5),
('TG/2023/003','TCS1212','T', 1, 86.0),
('TG/2023/003','ICT1233','T', 2, 69.5),
('TG/2023/003','ICT1233','P', 2, 74.0),
('TG/2023/003','ICT1253','T', 2, 72.5),
('TG/2023/003','ICT1253','P', 2, 68.0),
('TG/2023/003','ICT1242','T', 2, 76.0),
('TG/2023/003','TMS1233','T', 2, 81.0),
('TG/2023/003','ICT1212','T', 2, 85.0),
('TG/2023/003','ICT1222','P', 2, 87.0),
('TG/2023/003','TCS1212','T', 2, 78.5),
('TG/2023/003','ICT1233','T', 3, 80.0),
('TG/2023/003','ICT1233','P', 3, 72.0),
('TG/2023/003','ICT1253','T', 3, 65.0),
('TG/2023/003','ICT1253','P', 3, 70.0),
('TG/2023/003','ICT1242','T', 3, 82.5),
('TG/2023/003','TMS1233','T', 3, 86.0),
('TG/2023/003','ICT1212','T', 3, 91.0),
('TG/2023/003','ICT1222','P', 3, 89.0),
('TG/2023/003','TCS1212','T', 3, 85.0),

('TG/2023/004','ICT1233','T', 1, 83.0),
('TG/2023/004','ICT1233','P', 1, 81.0),
('TG/2023/004','ICT1253','T', 1, 78.0),
('TG/2023/004','ICT1253','P', 1, 80.0),
('TG/2023/004','ICT1242','T', 1, 87.0),
('TG/2023/004','TMS1233','T', 1, 94.0),
('TG/2023/004','ICT1212','T', 1, 91.5),
('TG/2023/004','ICT1222','P', 1, 90.0),
('TG/2023/004','TCS1212','T', 1, 86.0),
('TG/2023/004','ICT1233','T', 2, 80.0);

-- Assignmnet
CREATE TABLE Assignment(
    C_code CHAR(8) NOT NULL,
    C_type ENUM('P','T') NOT NULL,
    Regno CHAR(12) NOT NULL,
    A_mark FLOAT(5,2) NOT NULL CHECK (A_mark >= 0 AND A_mark <= 100),
    A_no INT NOT NULL,

    PRIMARY KEY(C_code, C_type, Regno, A_no),
    
    -- Foreign key 1: Relate to the Course
    CONSTRAINT fk_AssignmentCourse FOREIGN KEY(C_code, C_type) 
        REFERENCES Course(C_code, C_type) 
        ON UPDATE CASCADE, 
    
    -- Foreign key 2: Relate to the Student 
    CONSTRAINT fk_AssignmentStudent FOREIGN KEY(Regno) 
        REFERENCES User(User_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- insert data
INSERT INTO Assignment
	(Regno,C_code,C_type,A_no,A_mark)
VALUES
	('TG/2023/001','ENG1222','T',1,75),
	('TG/2023/001','ICT1212','T',1,58),
	('TG/2023/001','ICT1242','T',1,90),
	('TG/2023/001','ICT1233','T',1,65),
	('TG/2023/001','ICT1253','T',1,45),
	('TG/2023/001','TCS1212','T',1,79),
	('TG/2023/001','TMS1233','T',1,89),
	('TG/2023/002','ENG1222','T',1,85),
	('TG/2023/002','ICT1212','T',1,58),
	('TG/2023/002','ICT1242','T',1,76),
	('TG/2023/002','ICT1233','T',1,63),
	('TG/2023/002','ICT1253','T',1,79),
	('TG/2023/002','TCS1212','T',1,70),
	('TG/2023/002','TMS1233','T',1,91),
	('TG/2023/003','ENG1222','T',1,32),
	('TG/2023/003','ICT1212','T',1,58),
	('TG/2023/003','ICT1242','T',1,70),
	('TG/2023/003','ICT1233','T',1,65),
	('TG/2023/003','ICT1253','T',1,45),
	('TG/2023/003','TCS1212','T',1,79),
	('TG/2023/003','TMS1233','T',1,85),
	('TG/2023/004','ENG1222','T',1,75),
	('TG/2023/004','ICT1212','T',1,62),
	('TG/2023/004','ICT1242','T',1,38),
	('TG/2023/004','ICT1233','T',1,65),
	('TG/2023/004','ICT1253','T',1,45),
	('TG/2023/004','TCS1212','T',1,90),
	('TG/2023/004','TMS1233','T',1,80),
	('TG/2023/005','ENG1222','T',1,75),
	('TG/2023/005','ICT1212','T',1,88),
	('TG/2023/005','ICT1242','T',1,90),
	('TG/2023/005','ICT1233','T',1,75),
	('TG/2023/005','ICT1253','T',1,45),
	('TG/2023/005','TCS1212','T',1,79),
	('TG/2023/005','TMS1233','T',1,86),
	('TG/2023/006','ENG1222','T',1,95),
	('TG/2023/006','ICT1212','T',1,58),
	('TG/2023/006','ICT1242','T',1,90),
	('TG/2023/006','ICT1233','T',1,65),
	('TG/2023/006','ICT1253','T',1,45),
	('TG/2023/006','TCS1212','T',1,79),
	('TG/2023/006','TMS1233','T',1,75),
	('TG/2023/007','ENG1222','T',1,75),
	('TG/2023/007','ICT1212','T',1,58),
	('TG/2023/007','ICT1242','T',1,60),
	('TG/2023/007','ICT1233','T',1,65),
	('TG/2023/007','ICT1253','T',1,45),
	('TG/2023/007','TCS1212','T',1,69),
	('TG/2023/007','TMS1233','T',1,70),
	('TG/2023/008','ENG1222','T',1,75),
	('TG/2023/008','ICT1212','T',1,88),
	('TG/2023/008','ICT1242','T',1,70),
	('TG/2023/008','ICT1233','T',1,85),
	('TG/2023/008','ICT1253','T',1,65),
	('TG/2023/008','TCS1212','T',1,79),
	('TG/2023/008','TMS1233','T',1,80),
	('TG/2023/009','ENG1222','T',1,95),
	('TG/2023/009','ICT1212','T',1,78),
	('TG/2023/009','ICT1242','T',1,60),
	('TG/2023/009','ICT1233','T',1,59),
	('TG/2023/009','ICT1253','T',1,69),
	('TG/2023/009','TCS1212','T',1,75),
	('TG/2023/009','TMS1233','T',1,88),
	('TG/2023/010','ENG1222','T',1,83),
	('TG/2023/010','ICT1212','T',1,64),
	('TG/2023/010','ICT1242','T',1,76),
	('TG/2023/010','ICT1233','T',1,90),
	('TG/2023/010','ICT1253','T',1,82),
	('TG/2023/010','TCS1212','T',1,80),
	('TG/2023/010','TMS1233','T',1,91),
	('TG/2021/023','ICT1242','T',1,65),
	('TG/2021/088','TMS1233','T',1,70);

    -- Project
CREATE TABLE Project(
	C_code CHAR(8) NOT NULL,
	C_type ENUM('P','T') NOT NULL,
	Regno CHAR(12) NOT NULL,
	P_mark FLOAT(9,2) NOT NULL CHECK (P_mark >= 0 AND P_mark <= 100),

	PRIMARY KEY(C_code,C_type,Regno),
	
	-- Foreign key 1:Relate to the Course
	CONSTRAINT fk_Courseproject FOREIGN KEY(C_code,C_type) REFERENCES Course(C_code,C_type),

	-- Foreign key 2:Relate to the Student
	CONSTRAINT fk_ProjectStudent FOREIGN KEY(Regno) REFERENCES User(User_id)
 ON UPDATE CASCADE ON DELETE CASCADE
);

-- insert data
INSERT INTO Project
	(Regno,C_code,C_type,P_mark)
VALUES
	('TG/2023/001','ICT1222','P',71),
	('TG/2023/002','ICT1222','P',78),
	('TG/2023/003','ICT1222','P',80),
	('TG/2023/004','ICT1222','P',75),
	('TG/2023/005','ICT1222','P',82),
	('TG/2023/006','ICT1222','P',89),
	('TG/2023/007','ICT1222','P',79),
	('TG/2023/008','ICT1222','P',81),
	('TG/2023/009','ICT1222','P',90),
	('TG/2023/010','ICT1222','P',72),
	('TG/2023/001','ICT1233','P',60),
	('TG/2023/002','ICT1233','P',84),
	('TG/2023/003','ICT1233','P',78),
	('TG/2023/004','ICT1233','P',76),
	('TG/2023/005','ICT1233','P',87),
	('TG/2023/006','ICT1233','P',89),
	('TG/2023/007','ICT1233','P',88),
	('TG/2023/008','ICT1233','P',78),
	('TG/2023/009','ICT1233','P',83),
	('TG/2023/010','ICT1233','P',80);

-- Mid
CREATE TABLE Mid_exam(
    C_code CHAR(8) NOT NULL,
    C_type ENUM('P','T') NOT NULL,
    Regno CHAR(12) NOT NULL,
    Mid_mark FLOAT(9,2) NOT NULL CHECK (Mid_mark >= 0 AND Mid_mark <= 100),

    PRIMARY KEY(C_code, C_type, Regno),
    
    -- Foreign key 1: Relate to the Course
    CONSTRAINT fk_MidCourse FOREIGN KEY(C_code, C_type) 
        REFERENCES Course(C_code, C_type)
        ON UPDATE CASCADE, 

    -- Foreign key 2: Relate to the Student
    CONSTRAINT fk_MidStudent FOREIGN KEY(Regno) 
        REFERENCES User(User_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- insert data
INSERT INTO Mid_Exam(Regno, C_code, C_type, Mid_Mark)VALUES
('TG/2023/001','ICT1233','T', 80.0),
('TG/2023/001','ICT1233','P', 79.0),
('TG/2023/001','ICT1253','T', 70.0),
('TG/2023/001','ICT1253','P', 67.5),
('TG/2023/001','ICT1242','T', 72.0),
('TG/2023/001','TMS1233','T', 85.0),
('TG/2023/001','ICT1212','T', 80.0),
('TG/2023/001','ICT1222','P', 82.0),
('TG/2023/001','TCS1212','T', 77.5),
('TG/2023/001','ENG1222','T', 85.0),

('TG/2023/002','ICT1233','T', 80.0),
('TG/2023/002','ICT1253','T', 88.5),
('TG/2023/002','ICT1253','P', 90.0),
('TG/2023/002','ICT1242','T', 87.0),
('TG/2023/002','TMS1233','T', 81.0),
('TG/2023/002','ICT1212','T', 83.0),
('TG/2023/002','ICT1222','P', 82.0),
('TG/2023/002','TCS1212','T', 77.5),
('TG/2023/002','ENG1222','T', 85.0),

('TG/2023/003','ICT1233','T', 78.5),
('TG/2023/003','ICT1233','P', 89.0),
('TG/2023/003','ICT1253','T', 93.0),
('TG/2023/003','ICT1253','P', 78.0),
('TG/2023/003','ICT1242','T', 88.0),
('TG/2023/003','TMS1233','T', 92.0),
('TG/2023/003','ICT1212','T', 90.0),
('TG/2023/003','ICT1222','P', 85.0),
('TG/2023/003','TCS1212','T', 77.5),
('TG/2023/003','ENG1222','T', 50.0),

('TG/2023/004','ICT1233','T', 86.0),
('TG/2023/004','ICT1233','P', 85.0),
('TG/2023/004','ICT1253','T', 69.5),
('TG/2023/004','ICT1242','T', 72.5),
('TG/2023/004','TMS1233','T', 70.0),
('TG/2023/004','ICT1212','T', 77.5),
('TG/2023/004','ICT1222','P', 84.0),
('TG/2023/004','TCS1212','T', 86.0),
('TG/2023/004','ENG1222','T', 86.5),

('TG/2023/005','ICT1233','T', 78.5),
('TG/2023/005','ICT1233','P', 92.0),
('TG/2023/005','ICT1253','T', 79.5),
('TG/2023/005','ICT1253','P', 95.0),
('TG/2023/005','ICT1242','T', 70.0),
('TG/2023/005','TMS1233','T', 79.5),
('TG/2023/005','ICT1212','T', 87.5),
('TG/2023/005','ICT1222','P', 87.5),
('TG/2023/005','TCS1212','T', 95.0),
('TG/2023/005','ENG1222','T', 85.0),

('TG/2023/006','ICT1233','T', 69.5),
('TG/2023/006','ICT1233','P', 70.0),
('TG/2023/006','ICT1253','T', 84.0),
('TG/2023/006','ICT1253','P', 85.0),
('TG/2023/006','ICT1242','T', 90.5),
('TG/2023/006','TMS1233','T', 78.0),
('TG/2023/006','ICT1212','T', 84.0),
('TG/2023/006','ICT1222','P', 87.5),
('TG/2023/006','TCS1212','T', 93.0), 
('TG/2023/006','ENG1222','T', 95.0),

('TG/2023/007','ICT1233','T', 84.5),
('TG/2023/007','ICT1233','P', 72.0),
('TG/2023/007','ICT1253','P', 69.0),
('TG/2023/007','ICT1242','T', 93.5),
('TG/2023/007','TMS1233','T', 57.5),
('TG/2023/007','ICT1212','T', 80.0),
('TG/2023/007','ICT1222','P', 91.0),
('TG/2023/007','TCS1212','T', 78.5),
('TG/2023/007','ENG1222','T', 62.5),

('TG/2023/008','ICT1233','T', 85.0),
('TG/2023/008','ICT1233','P', 92.0),
('TG/2023/008','ICT1253','T', 81.5),
('TG/2023/008','ICT1253','P', 71.0),
('TG/2023/008','ICT1242','T', 71.0),
('TG/2023/008','TMS1233','T', 90.5),
('TG/2023/008','ICT1212','T', 58.0),
('TG/2023/008','ICT1222','P', 86.5),
('TG/2023/008','TCS1212','T', 72.5),
('TG/2023/008','ENG1222','T', 93.5),

('TG/2023/009','ICT1233','T', 67.0),
('TG/2023/009','ICT1253','T', 67.0),
('TG/2023/009','ICT1253','P', 85.0),
('TG/2023/009','ICT1242','T', 57.5),
('TG/2023/009','TMS1233','T', 91.0),
('TG/2023/009','ICT1212','T', 78.5),
('TG/2023/009','ICT1222','P', 62.5),
('TG/2023/009','TCS1212','T', 85.0),
('TG/2023/009','ENG1222','T', 66.0),

('TG/2023/010','ICT1233','T', 85.0),
('TG/2023/010','ICT1233','P', 76.0),
('TG/2023/010','ICT1253','T', 71.0),
('TG/2023/010','ICT1253','P', 90.5),
('TG/2023/010','ICT1242','T', 91.5),
('TG/2023/010','TMS1233','T', 93.5),
('TG/2023/010','ICT1212','T', 50.0),
('TG/2023/010','ICT1222','P', 88.0),
('TG/2023/010','TCS1212','T', 66.0),

('TG/2021/023','ICT1242','T', 90.5),

('TG/2021/088','TMS1233','T', 85.0);

-- End
CREATE TABLE End_exam(
    C_code CHAR(8) NOT NULL,
    C_type ENUM('P','T') NOT NULL,
    Regno CHAR(12) NOT NULL,
    End_mark FLOAT(9,2) NOT NULL CHECK (End_mark >= 0 AND End_mark <= 100),

    PRIMARY KEY(C_code, C_type, Regno),
    
    -- Foreign key 1: Relate to the Course
    CONSTRAINT fk_EndCourse FOREIGN KEY(C_code, C_type) 
        REFERENCES Course(C_code, C_type)
        ON UPDATE CASCADE, 

    -- Foreign key 2: Relate to the Student
    CONSTRAINT fk_EndStudent FOREIGN KEY(Regno) 
        REFERENCES User(User_id) 
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- insert data
INSERT INTO End_Exam(Regno, C_code, C_type, End_Mark) VALUES
('TG/2023/001','ICT1233','T', 80.0),
('TG/2023/001','ICT1233','P', 88.5),
('TG/2023/001','ICT1253','T', 90.0),
('TG/2023/001','ICT1253','P', 77.5),
('TG/2023/001','ICT1242','T', 82.0),
('TG/2023/001','TMS1233','T', 65.0),
('TG/2023/001','ICT1212','T', 90.0),
('TG/2023/001','ICT1222','P', 62.0),
('TG/2023/001','TCS1212','T', 87.5),
('TG/2023/001','ENG1222','T', 95.0),

('TG/2023/002','ICT1233','T', 78.0),
('TG/2023/002','ICT1233','P', 88.0),
('TG/2023/002','ICT1253','T', 68.0),
('TG/2023/002','ICT1253','P', 70.5),
('TG/2023/002','ICT1242','T', 77.0),
('TG/2023/002','TMS1233','T', 61.5),
('TG/2023/002','ICT1212','T', 73.0),
('TG/2023/002','ICT1222','P', 52.0),
('TG/2023/002','TCS1212','T', 87.0),
('TG/2023/002','ENG1222','T', 75.5),

('TG/2023/003','ICT1233','T', 68.5),
('TG/2023/003','ICT1233','P', 59.5),
('TG/2023/003','ICT1253','T', 63.0),
('TG/2023/003','ICT1253','P', 78.0),
('TG/2023/003','ICT1242','T', 58.5),
('TG/2023/003','TMS1233','T', 82.5),
('TG/2023/003','ICT1212','T', 80.0),
('TG/2023/003','ICT1222','P', 85.0),
('TG/2023/003','TCS1212','T', 87.0),
('TG/2023/003','ENG1222','T', 70.0),

('TG/2023/004','ICT1233','T', 76.0),
('TG/2023/004','ICT1233','P', 75.5),
('TG/2023/004','ICT1253','T', 89.5),

('TG/2023/004','ICT1242','T', 82.0),
('TG/2023/004','TMS1233','T', 87.0),
('TG/2023/004','ICT1212','T', 56.5),
('TG/2023/004','ICT1222','P', 90.5),
('TG/2023/004','TCS1212','T', 86.0),
('TG/2023/004','ENG1222','T', 88.5),

('TG/2023/005','ICT1233','T', 78.5),
('TG/2023/005','ICT1233','P', 79.5),
('TG/2023/005','ICT1253','T', 79.5),
('TG/2023/005','ICT1253','P', 85.0),
('TG/2023/005','ICT1242','T', 76.0),
('TG/2023/005','TMS1233','T', 78.5),
('TG/2023/005','ICT1212','T', 57.5),
('TG/2023/005','ICT1222','P', 67.5),
('TG/2023/005','TCS1212','T', 85.0),
('TG/2023/005','ENG1222','T', 95.0),

('TG/2023/006','ICT1233','T', 69.5),
('TG/2023/006','ICT1233','P', 86.0),
('TG/2023/006','ICT1253','T', 84.5),
('TG/2023/006','ICT1253','P', 84.0),
('TG/2023/006','ICT1242','T', 68.0),
('TG/2023/006','TMS1233','T', 78.5),
('TG/2023/006','ICT1212','T', 84.0),
('TG/2023/006','ICT1222','P', 77.5),
('TG/2023/006','TCS1212','T', 78.5),
('TG/2023/006','ENG1222','T', 85.0),

('TG/2023/007','ICT1233','T', 74.5),
('TG/2023/007','ICT1233','P', 72.0),

('TG/2023/007','ICT1253','P', 59.0),
('TG/2023/007','ICT1242','T', 63.5),
('TG/2023/007','TMS1233','T', 97.5),
('TG/2023/007','ICT1212','T', 80.0),
('TG/2023/007','ICT1222','P', 61.0),
('TG/2023/007','TCS1212','T', 78.5),
('TG/2023/007','ENG1222','T', 82.5),

('TG/2023/008','ICT1233','T', 85.0),
('TG/2023/008','ICT1233','P', 62.0),
('TG/2023/008','ICT1253','T', 71.5),
('TG/2023/008','ICT1253','P', 68.0),
('TG/2023/008','TMS1233','T', 90.5),
('TG/2023/008','ICT1212','T', 58.0),
('TG/2023/008','TCS1212','T', 72.5),
('TG/2023/008','ENG1222','T', 94.5),

('TG/2023/009','ICT1233','T', 67.0),
('TG/2023/009','ICT1233','P', 70.0),
('TG/2023/009','ICT1253','T', 67.0),
('TG/2023/009','ICT1253','P', 78.5),
('TG/2023/009','ICT1242','T', 57.5),
('TG/2023/009','TMS1233','T', 85.0),
('TG/2023/009','ICT1212','T', 78.5),
('TG/2023/009','ICT1222','P', 62.5),
('TG/2023/009','TCS1212','T', 85.0),
('TG/2023/009','ENG1222','T', 66.0),

('TG/2023/010','ICT1233','T', 85.0),
('TG/2023/010','ICT1233','P', 76.0),
('TG/2023/010','ICT1253','P', 90.5),
('TG/2023/010','ICT1242','T', 80.5),
('TG/2023/010','TMS1233','T', 83.5),
('TG/2023/010','ICT1212','T', 50.0),
('TG/2023/010','ICT1222','P', 78.0),
('TG/2023/010','TCS1212','T', 76.0),
('TG/2023/010','ENG1222','T', 88.0),

('TG/2021/023','ICT1242','T', 88.0),

('TG/2021/088','TMS1233','T', 95.0);

CREATE TABLE Grade_point (
    Grade CHAR(3) NOT NULL PRIMARY KEY,
    Point DECIMAL(3, 2) NOT NULL CHECK (Point >= 0.00 AND Point <= 4.00)
);

-- insert value
INSERT INTO Grade_point (Grade, Point) VALUES
('A+', 4.00),
('A', 4.00),
('A-', 3.70),
('B+', 3.30),
('B', 3.00),
('B-', 2.70),
('C+', 2.30),
('C', 2.00),
('C-', 1.70),
('D', 1.00),
('E', 0.00),
('F', 0.00);

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

-- insert data
INSERT INTO Medical_end
		(Regno,C_code,C_type,Medical_id,Medical_Status,Submited_Date)

VALUES
('TG/2023/004','ICT1253','P','ICT1253TG004' ,'Approved','2025-11-10'),
('TG/2023/007','ICT1253','T','ICT1253TG007','Approved','2025-11-10'),
('TG/2023/008','ICT1242','T','ICT1242TG008', 'Approved','2025-11-14'),
('TG/2023/008','ICT1222','P','ICT1222TG008', 'Approved','2025-11-20'),
('TG/2023/010','ICT1253','T','ICT1253TG010', 'Approved','2025-11-10');

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

-- insert data
INSERT INTO Medical_mid
	(Regno,C_code,C_type,Medical_id,Medical_Status,Submited_Date)
VALUES
('TG/2023/002','ICT1233','T','ICT1233TG002' ,'Approved','2025-10-01'),
('TG/2023/004','ICT1253','P','ICT1253TG004','Approved','2025-10-02'),
('TG/2023/009','ICT1233','P','ICT1233TG009', 'Approved','2025-10-02'),
('TG/2023/010','ENG1222','T','ENG122TG010', 'Approved','2025-09-30'),
('TG/2023/007','ICT1253','T','ICT1253TG007', 'Approved','2025-10-01');

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

-- Medical Handle
CREATE TABLE Medical_handle(
    C_code CHAR(8) NOT NULL,
    C_type ENUM('P','T') NOT NULL,
    Regno CHAR(12) NOT NULL,
    Medical_type enum('Mid','End','Attendance') NOT NULL,
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

-- Insert data for Medical_handle table
INSERT INTO Medical_handle(C_code, C_type, Regno, Medical_Type, Lec_Handler, Handle_at) 
VALUES
-- Handling for students who submitted mid-semester medicals: 
('ICT1233', 'T', 'TG/2023/002', 'Mid', 'LEC/003', '2025-10-02 09:30:00'),
('ICT1253', 'P', 'TG/2023/004', 'Mid', 'LEC/005', '2025-10-03 10:45:00'),
('ICT1233', 'P', 'TG/2023/009', 'Mid', 'LEC/003', '2025-10-03 11:00:00'),
('ENG1222', 'T', 'TG/2023/010', 'Mid', 'LEC/007', '2025-10-01 14:15:00'),
('ICT1253', 'T', 'TG/2023/007', 'Mid', 'LEC/004', '2025-10-02 15:00:00'),

-- Handling for students who submitted end-semester medicals:
('ICT1253', 'P', 'TG/2023/004', 'End', 'LEC/005', '2025-11-11 09:00:00'),
('ICT1253', 'T', 'TG/2023/007', 'End', 'LEC/004', '2025-11-11 10:00:00'),
('ICT1242', 'T', 'TG/2023/008', 'End', 'LEC/002', '2025-11-15 11:30:00'),
('ICT1222', 'P', 'TG/2023/008', 'End', 'LEC/001', '2025-11-21 13:00:00'),
('ICT1253', 'T', 'TG/2023/010', 'End', 'LEC/004', '2025-11-11 14:00:00'),

-- Handling for students who submitted attendance medicals:
('ENG1222', 'T', 'TG/2023/007', 'Attendance', 'LEC/007', '2025-08-06 09:00:00'),
('ICT1233', 'P', 'TG/2023/004', 'Attendance', 'LEC/003', '2025-08-09 10:30:00'),
('ICT1222', 'P', 'TG/2023/003', 'Attendance', 'LEC/001', '2025-08-16 11:00:00'),
('ICT1253', 'P', 'TG/2023/002', 'Attendance', 'LEC/005', '2025-08-27 12:00:00'),
('ICT1222', 'P', 'TG/2023/004', 'Attendance', 'LEC/002', '2025-09-03 13:30:00'),
('ICT1212', 'T', 'TG/2023/008', 'Attendance', 'LEC/005', '2025-09-12 14:00:00'),
('ICT1253', 'P', 'TG/2023/004', 'Attendance', 'LEC/001', '2025-09-13 09:45:00'),
('ICT1233', 'P', 'TG/2023/006', 'Attendance', 'LEC/003', '2025-09-26 10:15:00'),
('ICT1242', 'T', 'TG/2023/006', 'Attendance', 'LEC/004', '2025-10-05 11:30:00'),
('ICT1242', 'T', 'TG/2023/009', 'Attendance', 'LEC/002', '2025-10-23 13:00:00'),
('TMS1233', 'T', 'TG/2023/003', 'Attendance', 'LEC/008', '2025-10-28 14:30:00');

-- Attendence Eligibility

CREATE OR REPLACE VIEW Attendance_eligibility AS
WITH Attendance_Calculations AS (
    SELECT 
        A.Regno,
        A.C_code,
        A.C_type,
        -- Calculate the total attended hours (Present or Medically Excused)
        SUM(CASE WHEN A.Status IN ('Present', 'Medical') THEN A.L_Hours ELSE 0 END) AS Total_Attended_Hours,
        -- Calculate the total scheduled hours
        SUM(A.L_Hours) AS Total_Scheduled_Hours
    FROM 
        Attendence A
    GROUP BY 
        A.Regno, 
        A.C_code, 
        A.C_type
)

SELECT 
    AC.Regno,
    AC.C_code,
    AC.C_type,
    -- Calculate Attendance Percentage based on total hours
    ROUND(
        (1.0 * AC.Total_Attended_Hours / AC.Total_Scheduled_Hours) * 100,
        2
    ) AS Attendance_Percentage,
    
    -- Determine Eligibility (Prioritizing MC)
    CASE 
        -- Check standard percentage threshold (80%)
        WHEN (1.0 * AC.Total_Attended_Hours / AC.Total_Scheduled_Hours) * 100 >= 80 
             THEN 'EL' -- Eligible
             
        -- Otherwise, Not Eligible
        ELSE 'NE' 
    END AS Eligibility
FROM 
    Attendance_Calculations AC
LEFT JOIN 
    Medical_Attendence MA
    ON AC.Regno = MA.Regno AND AC.C_code = MA.C_code AND AC.C_type = MA.C_type;

-- result status
CREATE OR REPLACE VIEW Result_status AS
-- Rank and get top 2 quiz marks
WITH ranked_quiz AS ( 
    SELECT
        Regno, C_code, C_type, mark,
        ROW_NUMBER() OVER (
            PARTITION BY Regno, C_code, C_type 
            ORDER BY COALESCE(mark, 0) DESC
        ) AS rn
    FROM Quiz
),

quiz_mark AS (
    SELECT
        Regno, C_code, C_type,
        AVG(mark) AS quiz_mark 
    FROM ranked_quiz
    WHERE rn <= 2 
    GROUP BY Regno, C_code, C_type
),

Assignment_mark AS (
    SELECT
        Regno, C_code, C_type,
        SUM(COALESCE(A_mark, 0)) AS Ass_mark
    FROM Assignment  
    GROUP BY Regno, C_code, C_type
),

Project_mark AS ( 
    SELECT
        Regno, C_code, C_type,
        MAX(COALESCE(P_mark, 0)) AS Project_mark 
    FROM Project
    GROUP BY Regno, C_code, C_type
),

-- Base CTE joins all components (marks, medicals, attendance)
Base_CA AS (
    SELECT 
        en.Regno,
        en.C_code,
        en.C_type,
        q.quiz_mark, 
        a.Ass_mark,
        m.Mid_mark,
        p.Project_mark,
        e.End_mark,
        mm.Medical_status AS Mid_Medical_status, 
        me.Medical_Status AS End_Medical_status,  
        ae.Eligibility AS Attendance_Eligibility 
        
    FROM Course_Enrollment en
    LEFT JOIN quiz_mark q
        ON en.Regno = q.Regno AND en.C_code = q.C_code AND en.C_type = q.C_type
    LEFT JOIN Assignment_mark a
        ON en.Regno = a.Regno AND en.C_code = a.C_code AND en.C_type = a.C_type
    LEFT JOIN Mid_exam m
        ON en.Regno = m.Regno AND en.C_code = m.C_code AND en.C_type = m.C_type
    LEFT JOIN Project_mark p
        ON en.Regno = p.Regno AND en.C_code = p.C_code AND en.C_type = p.C_type
    LEFT JOIN End_exam e 
        ON en.Regno = e.Regno AND en.C_code = e.C_code AND en.C_type = e.C_type
    LEFT JOIN Medical_mid mm 
        ON en.Regno = mm.Regno AND en.C_code = mm.C_code AND en.C_type = mm.C_type 
    LEFT JOIN Medical_End me  
        ON en.Regno = me.Regno AND en.C_code = me.C_code AND en.C_type = me.C_type
    LEFT JOIN Attendance_eligibility ae 
        ON en.Regno = ae.Regno AND en.C_code = ae.C_code AND en.C_type = ae.C_type
),

-- CTE calculates CA mark (as a decimal) or assigns 'MC'
Calculated_CA AS (
    SELECT 
        c.Regno,
        c.C_code,
        c.C_type,
        c.End_mark,
        c.End_Medical_status, 
        c.Attendance_Eligibility,
        
        -- CA Calculation and Mid MC Check
        CASE 
            WHEN c.Mid_Medical_status IN ('Approved', 'Pending') THEN 'MC'
            ELSE 
                CAST(
                    CASE
                        WHEN c.C_code IN ('ICT1242' , 'TCS1212' , 'TMS1233') THEN COALESCE(c.quiz_mark, 0) * 0.1 + COALESCE(c.Ass_mark, 0) * 0.05 + COALESCE(c.Mid_mark, 0) * 0.15
                        WHEN c.C_code = 'ICT1212' THEN COALESCE(c.quiz_mark, 0) * 0.1 + COALESCE(c.Mid_mark, 0) * 0.2
                        WHEN c.C_code = 'ICT1222' THEN COALESCE(c.quiz_mark, 0) * 0.05 + COALESCE(c.Mid_mark, 0) * 0.15 + COALESCE(c.Project_mark, 0) * 0.2
                        WHEN c.C_code IN ('ICT1233','ICT1253') THEN COALESCE(c.quiz_mark, 0) * 0.1 + COALESCE(c.Mid_mark, 0) * 0.1 + COALESCE(c.Project_mark, 0) * 0.15 + COALESCE(c.Ass_mark, 0) * 0.1 
                        ELSE COALESCE(c.Mid_mark, 0) * 0.2 + COALESCE(c.Ass_mark, 0) * 0.1
                    END 
                AS DECIMAL(10, 2))
        END AS CA
    FROM Base_CA c
),

-- CTE to scale the CA mark for the 40-point pass check
Final_Marks AS (
    SELECT
        c.*,
        CASE
            WHEN c.CA = 'MC' THEN NULL 
            WHEN c.C_type = 'T' THEN CAST(c.CA AS DECIMAL(10,2)) * (100.0 / 30.0) 
            WHEN c.C_type = 'P' THEN CAST(c.CA AS DECIMAL(10,2)) * (100.0 / 40.0) 
            ELSE CAST(c.CA AS DECIMAL(10,2)) 
        END AS Scaled_CA_Mark
    FROM Calculated_CA c
)

-- Final SELECT to determine status based on scaled marks
SELECT  
    f.Regno,
    f.C_code,
    f.C_type,
    
    -- Final CA Mark (Display) - FIX: Use ROUND(..., 2)
    CASE
        WHEN f.CA = 'MC' THEN 'MC'
        -- Rounds the mark to 2 decimal places before casting to a display string
        ELSE CAST(ROUND(f.Scaled_CA_Mark, 2) AS CHAR(10)) 
    END AS CA, 

    -- CA Status Check (Uses the Scaled_CA_Mark for >= 40 check)
    CASE 
        WHEN f.CA = 'MC' THEN 'MC'
        WHEN f.Scaled_CA_Mark >= 40.0 THEN 'Pass' 
        ELSE 'Fail'
    END AS CA_Status,
    
    -- End_mark Output (Mark or Status)
    CASE 
        WHEN f.Attendance_Eligibility = 'NE' THEN 'NE' 
        WHEN f.End_Medical_status IN ('Approved', 'Pending') THEN 'MC' 
        WHEN f.End_mark IS NULL THEN '0.00' 
        ELSE CAST(f.End_mark AS CHAR(10)) 
    END AS End_mark,

    -- End Status Check 
    CASE 
        WHEN f.Attendance_Eligibility = 'NE' THEN 'NE' 
        WHEN f.End_Medical_status IN ('Approved', 'Pending') THEN 'MC' 
        WHEN f.End_mark IS NULL THEN 'Fail' 
        WHEN CAST(f.End_mark AS DECIMAL(10,2)) >= 35 THEN 'Pass'
        ELSE 'Fail'
    END AS End_Status

FROM Final_Marks f;

-- Final Result

CREATE OR REPLACE VIEW Final_result AS
WITH Calculation_CTE AS (
    SELECT
        RS.Regno,
        RS.C_code,
        RS.C_type,
        S.S_type,
        
        -- Status Fields from Result_status
        RS.CA AS CA_Mark_Display, 
        RS.End_mark AS End_Mark_Display, 
        RS.CA_Status, 
        RS.End_Status, 
        
        -- CA Contribution: (Scaled CA mark * Weight)
        CASE 
            WHEN RS.CA_Status = 'Pass' AND RS.C_type = 'T' THEN CAST(RS.CA AS DECIMAL(10,2)) * 0.30
            WHEN RS.CA_Status = 'Pass' AND RS.C_type = 'P' THEN CAST(RS.CA AS DECIMAL(10,2)) * 0.40
            ELSE 0.00 
        END AS CA_Contribution,

        -- End Contribution: (End Mark * Weight)
        CASE 
            WHEN RS.End_Status = 'Pass' AND RS.C_type = 'T' THEN CAST(RS.End_mark AS DECIMAL(10,2)) * 0.70
            WHEN RS.End_Status = 'Pass' AND RS.C_type = 'P' THEN CAST(RS.End_mark AS DECIMAL(10,2)) * 0.60
            ELSE 0.00 
        END AS End_Contribution
        
    FROM 
        Result_status RS 
    INNER JOIN Student S 
        ON RS.Regno = S.Reg_no -- Using S.Reg_no to match the Student table PRIMARY KEY
),

-- CTE to Calculate Final Total Mark
Final_Total AS (
    SELECT
        C.*,
        
        -- Calculate the Numeric Total Mark
        CASE 
            -- Total mark is NULL if status is WH, MC, or NE
            WHEN C.End_Status IN ('NE', 'MC') OR C.CA_Mark_Display = 'MC' THEN NULL 
            
            -- Otherwise, sum the component contributions (even if they are 0 due to failure)
            ELSE C.CA_Contribution + C.End_Contribution
        END AS Final_Total_Mark
        
    FROM Calculation_CTE C
)

-- Final SELECT to determine final mark and grade.
SELECT 
    FT.Regno,
    FT.C_code,
    FT.C_type,
    
    -- Final Display Mark Logic
    CASE 
        -- Priority 1: Overriding Status Checks (Suspending/MC/NE results in 'WH')
        WHEN FT.S_type = 'Suspend' THEN 'WH' 
        WHEN FT.End_Status IN ( 'MC' , 'NE') OR FT.CA_Mark_Display = 'MC' THEN 'WH' 
        
        -- Priority 2: Use the Numeric Total Mark
        WHEN FT.Final_Total_Mark IS NOT NULL THEN CAST(ROUND(FT.Final_Total_Mark, 2) AS CHAR(10))
        ELSE 'N/A' 
    END AS Final_Mark, 
    
    -- Final Grade Logic
    CASE 
        -- Priority 1: Status checks that result in non-grade codes
        WHEN FT.S_type = 'Suspend' THEN 'WH' 
        WHEN FT.End_Status IN ( 'MC' , 'NE') OR FT.CA_Mark_Display = 'MC' THEN 'WH'
        
        -- Priority 2: Automatic Failure (E) for component failure
        WHEN FT.CA_Status = 'Fail' OR FT.End_Status = 'Fail' THEN 'E'
        
        -- Priority 3: Grading logic based on final score
        WHEN FT.S_type IN ('Proper', 'Repeat') AND FT.Final_Total_Mark IS NOT NULL THEN
            CASE
                WHEN FT.Final_Total_Mark >= 85 THEN 'A+'
                WHEN FT.Final_Total_Mark >= 75 THEN 'A'
                WHEN FT.Final_Total_Mark >= 70 THEN 'A-'
                WHEN FT.Final_Total_Mark >= 65 THEN 'B+'
                WHEN FT.Final_Total_Mark >= 60 THEN 'B'
                WHEN FT.Final_Total_Mark >= 55 THEN 'B-'
                WHEN FT.Final_Total_Mark >= 50 THEN 'C+'
                WHEN FT.Final_Total_Mark >= 45 THEN 'C'
                WHEN FT.Final_Total_Mark >= 40 THEN 'C-'
                WHEN FT.Final_Total_Mark >= 35 THEN 'D'
                ELSE 'E' 
            END
            
        -- Remaining scenarios
        ELSE 'F' 
    END AS Grade

FROM 
    Final_Total FT;

CREATE OR REPLACE VIEW GPA AS
-- CTE to map Grade to Point (Assumes Grade_point table exists)
WITH GradeCalc AS (
    SELECT 
        R.Regno,
        R.C_code,
        R.C_type,
        R.Grade,
        
        -- Corrected: Join the Course table on both C_code and C_type
        CAST(C.Credit AS DECIMAL(5,2)) AS Credit,
        
        -- Determine the Point for calculation
        CASE 
            -- Grades that should result in 0 points but ARE counted in the credit total (NE, E, D, F)
            WHEN R.Grade IN ('NE', 'E', 'D', 'F') THEN 0.00
            
            -- Grades that must be EXCLUDED from both points and credit totals (WH, MC)
            WHEN R.Grade IN ('WH', 'MC') THEN NULL 
            
            -- Use the standard point for passing grades
            ELSE G.Point
        END AS Calculated_Point
        
    FROM 
        Final_result R
    INNER JOIN 
        Course C ON R.C_code = C.C_code AND R.C_type = C.C_type -- CORRECTED JOIN
    LEFT JOIN 
        Grade_point G ON R.Grade = G.Grade
),

CreditTotals AS (
    SELECT
        Regno,
        
        -- Flag: Check only for 'WH' or 'MC' (These stop the numeric GPA output)
        MAX(CASE WHEN R.Grade IN ('WH', 'MC') THEN 1 ELSE 0 END) AS HasWithheldGrade, 
        
        -- 1. Total Credit for SGPA (CORRECTED: Excludes credits from WH/MC grades)
        SUM(
            CASE WHEN R.Grade IN ('WH', 'MC') THEN 0.00 
            ELSE Credit 
            END
        ) AS TotalCredit_SGPA,
        
        -- 2. Total Points for SGPA 
        -- COALESCE handles NULL Calculated_Point from WH/MC, setting their point contribution to 0.00.
        SUM(COALESCE(Calculated_Point * Credit, 0.00)) AS TotalPoints_SGPA,

        -- 3. Total Credit for CGPA (CORRECTED: Excludes 'ENG1222' AND credits from WH/MC grades)
        SUM(
            CASE 
                WHEN R.C_code = 'ENG1222' OR R.Grade IN ('WH', 'MC') THEN 0.00
                ELSE Credit 
            END
        ) AS TotalCredit_CGPA,
        
        -- 4. Total Points for CGPA (Excludes 'ENG1222')
        SUM(
            CASE 
                WHEN R.C_code = 'ENG1222' THEN 0.00 
                ELSE COALESCE(Calculated_Point * Credit, 0.00) 
            END
        ) AS TotalPoints_CGPA
        
    FROM 
        GradeCalc R
    GROUP BY
        Regno
)

SELECT 
    Regno,
    --  SGPA Calculation
    CASE 
        WHEN HasWithheldGrade = 1 THEN 'WH' 
        WHEN TotalCredit_SGPA = 0 THEN 'N/A' 
        ELSE 
            CAST(
                ROUND(
                    TotalPoints_SGPA / TotalCredit_SGPA,
                    2
                ) 
            AS CHAR(10)) 
    END AS SGPA,

    --  CGPA Calculation
    CASE 
        WHEN HasWithheldGrade = 1 THEN 'WH'
        WHEN TotalCredit_CGPA = 0 THEN 'N/A'
        ELSE 
            CAST(
                ROUND(
                    TotalPoints_CGPA / TotalCredit_CGPA,
                    2
                ) 
            AS CHAR(10))
    END AS CGPA
FROM 
    CreditTotals;

CREATE OR REPLACE VIEW Medical_Eligible_Attendance AS -- Renamed for clarity based on logic
-- 1. Calculate the total attended hours and total scheduled hours
WITH Attendance_Calculations AS (
    SELECT 
        A.Regno,
        A.C_code,
        A.C_type,
        -- Calculate the total attended hours (Present or Medically Excused)
        SUM(CASE WHEN A.Status IN ('Present', 'Medical') THEN A.L_Hours ELSE 0 END) AS Total_Attended_Hours,
        -- Calculate the total scheduled hours
        SUM(A.L_Hours) AS Total_Scheduled_Hours
    FROM 
        Attendence A
    GROUP BY 
        A.Regno, 
        A.C_code, 
        A.C_type
),

-- 2. Calculate Percentage (Corrected syntax: comma added after first CTE, comma removed in SELECT list)
Percentage AS (
    SELECT 
        AC.Regno,
        AC.C_code,
        AC.C_type,
        -- Calculate Attendance Percentage based on total hours
        ROUND(
            (1.0 * AC.Total_Attended_Hours / NULLIF(AC.Total_Scheduled_Hours, 0)) * 100,
            2
        ) AS Attendance_Percentage
    FROM 
        Attendance_Calculations AC
)

-- 3. Final Select: Filter for students meeting the 80% threshold
SELECT 
    p.Regno,
    p.C_code,
    p.C_type,
    p.Attendance_Percentage
FROM 
    Percentage p
WHERE 
    p.Attendance_Percentage >= 80.00;

-- With medical Attendence < 80 %

CREATE OR REPLACE VIEW Medical_Non_Eligible_Attendance AS -- Renamed for clarity based on logic
-- 1. Calculate the total attended hours and total scheduled hours
WITH Attendance_Calculations AS (
    SELECT 
        A.Regno,
        A.C_code,
        A.C_type,
        -- Calculate the total attended hours (Present or Medically Excused)
        SUM(CASE WHEN A.Status IN ('Present', 'Medical') THEN A.L_Hours ELSE 0 END) AS Total_Attended_Hours,
        -- Calculate the total scheduled hours
        SUM(A.L_Hours) AS Total_Scheduled_Hours
    FROM 
        Attendence A
    GROUP BY 
        A.Regno, 
        A.C_code, 
        A.C_type
),

-- 2. Calculate Percentage (Corrected syntax: comma added after first CTE, comma removed in SELECT list)
Percentage AS (
    SELECT 
        AC.Regno,
        AC.C_code,
        AC.C_type,
        -- Calculate Attendance Percentage based on total hours
        ROUND(
            (1.0 * AC.Total_Attended_Hours / NULLIF(AC.Total_Scheduled_Hours, 0)) * 100,
            2
        ) AS Attendance_Percentage
    FROM 
        Attendance_Calculations AC
)

-- 3. Final Select: Filter for students meeting the 80% threshold
SELECT 
    p.Regno,
    p.C_code,
    p.C_type,
    p.Attendance_Percentage
FROM 
    Percentage p
WHERE 
    p.Attendance_Percentage < 80.00;

-- Attendence > 80 %

CREATE OR REPLACE VIEW Eligible_Attendance AS -- Renamed for clarity based on logic
-- 1. Calculate the total attended hours and total scheduled hours
WITH Attendance_Calculations AS (
    SELECT 
        A.Regno,
        A.C_code,
        A.C_type,
        -- Calculate the total attended hours (Present or Medically Excused)
        SUM(CASE WHEN A.Status IN ('Present') THEN A.L_Hours ELSE 0 END) AS Total_Attended_Hours,
        -- Calculate the total scheduled hours
        SUM(A.L_Hours) AS Total_Scheduled_Hours
    FROM 
        Attendence A
    GROUP BY 
        A.Regno, 
        A.C_code, 
        A.C_type
),

-- 2. Calculate Percentage (Corrected syntax: comma added after first CTE, comma removed in SELECT list)
Percentage AS (
    SELECT 
        AC.Regno,
        AC.C_code,
        AC.C_type,
        -- Calculate Attendance Percentage based on total hours
        ROUND(
            (1.0 * AC.Total_Attended_Hours / NULLIF(AC.Total_Scheduled_Hours, 0)) * 100,
            2
        ) AS Attendance_Percentage
    FROM 
        Attendance_Calculations AC
)

-- 3. Final Select: Filter for students meeting the 80% threshold
SELECT 
    p.Regno,
    p.C_code,
    p.C_type,
    p.Attendance_Percentage
FROM 
    Percentage p
WHERE 
    p.Attendance_Percentage >= 80.00;

CREATE OR REPLACE VIEW Non_Eligible_Attendance AS -- Renamed for clarity based on logic
-- 1. Calculate the total attended hours and total scheduled hours
WITH Attendance_Calculations AS (
    SELECT 
        A.Regno,
        A.C_code,
        A.C_type,
        -- Calculate the total attended hours (Present or Medically Excused)
        SUM(CASE WHEN A.Status IN ('Present') THEN A.L_Hours ELSE 0 END) AS Total_Attended_Hours,
        -- Calculate the total scheduled hours
        SUM(A.L_Hours) AS Total_Scheduled_Hours
    FROM 
        Attendence A
    GROUP BY 
        A.Regno, 
        A.C_code, 
        A.C_type
),

-- 2. Calculate Percentage (Corrected syntax: comma added after first CTE, comma removed in SELECT list)
Percentage AS (
    SELECT 
        AC.Regno,
        AC.C_code,
        AC.C_type,
        -- Calculate Attendance Percentage based on total hours
        ROUND(
            (1.0 * AC.Total_Attended_Hours / NULLIF(AC.Total_Scheduled_Hours, 0)) * 100,
            2
        ) AS Attendance_Percentage
    FROM 
        Attendance_Calculations AC
)

-- 3. Final Select: Filter for students meeting the 80% threshold
SELECT 
    p.Regno,
    p.C_code,
    p.C_type,
    p.Attendance_Percentage
FROM 
    Percentage p
WHERE 
    p.Attendance_Percentage < 80.00;

DELIMITER //

CREATE PROCEDURE attendence_a_student_a_course (IN Ccode CHAR(8), IN Reg_no CHAR(12))
BEGIN
    SELECT 
        C_code AS 'Course Code',
       CASE 
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'           
        END  AS 'Practical/Theory' ,
        Attendance_Percentage AS 'Attendence Percentage',
        Eligibility 
    FROM Attendance_eligibility
    WHERE C_code = Ccode AND Regno = Reg_no;
END//

CREATE PROCEDURE attendence_a_student_all_course (IN Reg_no CHAR(12))
BEGIN
    SELECT 
        C_code AS 'Course Code',
        CASE 
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'           
        END  AS 'Practical/Theory',
        Attendance_Percentage AS 'Attendence Percentage',
        Eligibility 
    FROM Attendance_eligibility
    WHERE  Regno = Reg_no;
END//

CREATE PROCEDURE attendence_whole_batch_a_course (IN Ccode CHAR(8))
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
    FROM Attendance_eligibility 
    WHERE C_code = Ccode;
END//

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

CREATE PROCEDURE CA_a_course_a_student (IN Reg_no CHAR(12),IN Ccode CHAR(8))
BEGIN
    SELECT 
        C_code AS 'Course Code',
       CASE 
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'           
        END  AS 'Practical/Theory',
         CA AS 'CA Marks'
    FROM Result_status
    WHERE Regno = Reg_no
    AND C_code = Ccode;
END//

CREATE PROCEDURE CA_all_course_a_student (IN Reg_no CHAR(12))
BEGIN
    SELECT
        C_code AS 'Course Code',
        CASE
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'  
        END AS 'Practical/Theory',
         CA AS 'CA Marks'
    FROM Result_status
    WHERE Regno = Reg_no;
END//

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

DELIMITER //
CREATE PROCEDURE Final_mark_all_course_a_student (IN Reg_no CHAR(12))
BEGIN
    SELECT  
        C_code AS 'Course Code',
        CASE
            WHEN C_Type = 'T' THEN 'Theory'
            ELSE 'Practical'             
        END AS 'Practical/Theory',
         Final_Mark AS 'Final Marks'
    FROM Final_result
    WHERE Regno = Reg_no;
END//

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

CREATE PROCEDURE medical_attendence (IN regnum CHAR(12))
BEGIN
    SELECT Regno,Submited_date,Medical_Status,C_code
    FROM medical_Attendence 
    WHERE regno = regnum;
END//

CREATE PROCEDURE medical_end (IN regnum CHAR(12))
BEGIN  
    SELECT Regno,Submited_date,Medical_Status,C_code
    FROM medical_end 
    WHERE regno = regnum;
END//

CREATE PROCEDURE medical_mid (IN regnum CHAR(12))
BEGIN

    SELECT Regno,Submited_date,Medical_Status,C_code
    FROM medical_mid 
    WHERE regno = regnum;
END//

DELIMITER //

CREATE PROCEDURE Create_user(
    IN v_user_id CHAR(12),
    IN v_pwd CHAR(50),
    IN v_role CHAR(30)
)
BEGIN
    -- Use session variables for dynamic SQL
    SET @sql_stmt = '';

    -- 1. Create user if not exists
    SET @sql_stmt = CONCAT(
        'CREATE USER IF NOT EXISTS ''', v_user_id, '''@''localhost'' IDENTIFIED BY ''', v_pwd, ''';'
    );
    PREPARE stmt FROM @sql_stmt;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- 2. Role-based privileges
    IF v_role = 'Student' THEN
        -- Table privileges
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_mid TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_end TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_Attendence TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Final_result TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.GPA TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        -- Procedure privileges
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Medical_mid TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Medical_end TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Final_mark_whole_batch_all_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Final_mark_all_course_a_student TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.attendence_a_student_all_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.attendence_a_student_a_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;

    ELSEIF v_role = 'Admin' THEN
        SET @sql_stmt = CONCAT('GRANT ALL PRIVILEGES ON tec_mis.* TO ''', v_user_id, '''@''localhost'' WITH GRANT OPTION;');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT CREATE USER ON *.* TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;

        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Create_user TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
       

    ELSEIF v_role = 'Dean' THEN
        SET @sql_stmt = CONCAT('GRANT ALL PRIVILEGES ON tec_mis.* TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        -- Additional read-only views
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Attendance_Eligibility TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Result_status TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Final_result TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.GPA TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_Non_Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Non_Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;

    ELSEIF v_role = 'Lecturer' THEN
        SET @sql_stmt = CONCAT('GRANT ALL PRIVILEGES ON tec_mis.* TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT CREATE USER ON *.* TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Result_status TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Final_result TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.CA_whole_batch_a_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.CA_a_course_a_student TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;

        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Create_user TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;

    ELSEIF v_role = 'TO' THEN
        SET @sql_stmt = CONCAT('GRANT SELECT, INSERT, UPDATE ON tec_mis.Attendence TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT, INSERT, UPDATE ON tec_mis.attendence_handle TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_Non_Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Non_Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Attendence_a_student_all_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Attendence_a_student_a_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Attendence_whole_batch_a_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Attendence_whole_batch_all_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
    END IF;
END//

DELIMITER ;

-- Lecturers
CALL Create_user('LEC/001', 'Lec1@fot', 'Lecturer');
CALL Create_user('LEC/002', 'Lec2@fot', 'Lecturer');
CALL Create_user('LEC/003', 'Lec2@fot', 'Lecturer');
CALL Create_user('LEC/004', 'Lec2@fot', 'Lecturer');
CALL Create_user('LEC/005', 'Lec2@fot', 'Lecturer');
CALL Create_user('LEC/006', 'Lec2@fot', 'Lecturer');
CALL Create_user('LEC/007', 'Lec2@fot', 'Lecturer');
CALL Create_user('LEC/008', 'Lec2@fot', 'Lecturer');

-- Admin
CALL Create_user('Admin/Fot/01', 'Admin1@fot', 'Admin');

-- TOs
CALL Create_user('Tech/Fot/001', 'Technical1@fot', 'TO');
CALL Create_user('Tech/Fot/002', 'Technical1@fot', 'TO');
CALL Create_user('Tech/Fot/003', 'Technical1@fot', 'TO');
CALL Create_user('Tech/Fot/004', 'Technical1@fot', 'TO');
CALL Create_user('Tech/Fot/005', 'Technical1@fot', 'TO');

-- Students
CALL Create_user('TG/2023/001', 'Stu001@fot', 'Student');
CALL Create_user('TG/2023/002', 'Stu002@fot', 'Student');
CALL Create_user('TG/2023/003', 'Stu003@fot', 'Student');
CALL Create_user('TG/2023/004', 'Stu004@fot', 'Student');
CALL Create_user('TG/2023/005', 'Stu005@fot', 'Student');
CALL Create_user('TG/2023/006', 'Stu006@fot', 'Student');
CALL Create_user('TG/2023/007', 'Stu007@fot', 'Student');
CALL Create_user('TG/2023/008', 'Stu008@fot', 'Student');
CALL Create_user('TG/2023/009', 'Stud009@fot', 'Student');
CALL Create_user('TG/2023/010', 'Stu010@fot', 'Student');
CALL Create_user('TG/2023/011', 'Stu011@fot', 'Student');
CALL Create_user('TG/2022/050', 'Stu050@fot', 'Student');
CALL Create_user('TG/2022/051', 'Stu051@fot', 'Student');
CALL Create_user('TG/2021/023', 'Stu023@fot', 'Student');
CALL Create_user('TG/2021/088', 'Stu088@fot', 'Student');
CALL Create_user('TG/2021/081', 'Stu081@fot', 'Student');
CALL Create_user('TG/2020/100', 'Stu100@fot', 'Student');
CALL Create_user('TG/2020/010', 'Stud010@fot', 'Student');
CALL Create_user('TG/2021/006', 'Stud006@fot', 'Student');

-- Dean
CALL Create_user('Dean/Fot/001', 'Dean1@fot', 'Dean');

-- Flush privileges after all calls
FLUSH PRIVILEGES;








