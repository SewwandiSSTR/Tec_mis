CREATE TABLE User
(
	User_id CHAR(12)  NOT NULL,
	Role VARCHAR(30) NOT NULL,
	Password VARCHAR(50) NOT NULL,
	PRIMARY KEY(User_id)
);

+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| User_id  | char(12)    | NO   | PRI | NULL    |       |
| Role     | varchar(30) | NO   |     | NULL    |       |
| Password | varchar(50) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

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

+--------------+----------+----------------+
| User_id      | Role     | Password       |
+--------------+----------+----------------+
| Admin/Fot/01 | Admin    | Admin1@fot     |
| Dean/Fot/001 | Dean     | Dean1@fot      |
| LEC/001      | Lecturer | Lec1@fot       |
| LEC/002      | Lecturer | Lec2@fot       |
| LEC/003      | Lecturer | Lec2@fot       |
| LEC/004      | Lecturer | Lec2@fot       |
| LEC/005      | Lecturer | Lec2@fot       |
| LEC/006      | Lecturer | Lec2@fot       |
| LEC/007      | Lecturer | Lec2@fot       |
| LEC/008      | Lecturer | Lec2@fot       |
| Tech/Fot/001 | TO       | Technical1@fot |
| Tech/Fot/002 | TO       | Technical1@fot |
| Tech/Fot/003 | TO       | Technical1@fot |
| Tech/Fot/004 | TO       | Technical1@fot |
| Tech/Fot/005 | TO       | Technical1@fot |
| TG/2020/010  | Student  | Stud010@fot    |
| TG/2020/100  | Student  | Stu100@fot     |
| TG/2021/006  | Student  | Stud006@fot    |
| TG/2021/023  | Student  | Stu023@fot     |
| TG/2021/081  | Student  | Stu081@fot     |
| TG/2021/088  | Student  | Stu088@fot     |
| TG/2022/050  | Student  | Stu050@fot     |
| TG/2022/051  | Student  | Stu051@fot     |
| TG/2023/001  | Student  | Stu001@fot     |
| TG/2023/002  | Student  | Stu002@fot     |
| TG/2023/003  | Student  | Stu003@fot     |
| TG/2023/004  | Student  | Stu004@fot     |
| TG/2023/005  | Student  | Stu005@fot     |
| TG/2023/006  | Student  | Stu006@fot     |
| TG/2023/007  | Student  | Stu007@fot     |
| TG/2023/008  | Student  | Stu008@fot     |
| TG/2023/009  | Student  | Stud009@fot    |
| TG/2023/010  | Student  | Stu010@fot     |
| TG/2023/011  | Student  | Stu011@fot     |
+--------------+----------+----------------+
