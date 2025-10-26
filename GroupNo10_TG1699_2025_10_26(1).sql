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

+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| Admin_id | char(12)     | NO   | PRI | NULL    |       |
| F_name   | varchar(50)  | NO   |     | NULL    |       |
| L_name   | varchar(50)  | NO   |     | NULL    |       |
| Email    | varchar(30)  | NO   |     | NULL    |       |
| Address  | varchar(100) | NO   |     | NULL    |       |
| Dob      | date         | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+

-- INSERT Admin 
INSERT INTO Admin 
(Admin_id,F_name,L_name,Email,Address,Dob)
VALUES 
('Admin/Fot/01','Amali','Jayawardena','a.jayawardena@uni.lk','2/A Kandy Rd, Colombo 07','1975-08-15');

+--------------+--------+-------------+----------------------+--------------------------+------------+
| Admin_id     | F_name | L_name      | Email                | Address                  | Dob        |
+--------------+--------+-------------+----------------------+--------------------------+------------+
| Admin/Fot/01 | Amali  | Jayawardena | a.jayawardena@uni.lk | 2/A Kandy Rd, Colombo 07 | 1975-08-15 |
+--------------+--------+-------------+----------------------+--------------------------+------------+