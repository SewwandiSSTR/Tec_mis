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

+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| Tec_id  | char(12)     | NO   | PRI | NULL    |       |
| F_Name  | varchar(50)  | NO   |     | NULL    |       |
| L_Name  | varchar(50)  | NO   |     | NULL    |       |
| Email   | varchar(30)  | NO   |     | NULL    |       |
| Address | varchar(100) | NO   |     | NULL    |       |
| Dob     | date         | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+

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

+--------------+----------+------------+---------------------+--------------------------------+------------+
| Tec_id       | F_Name   | L_Name     | Email               | Address                        | Dob        |
+--------------+----------+------------+---------------------+--------------------------------+------------+
| Tech/Fot/001 | Dilini   | Rathnayake | d.rathnayake@uni.lk | 5 School Lane, Matara          | 1987-03-08 |
| Tech/Fot/002 | Asela    | Senanayake | a.senanayake@uni.lk | 45/1 Beach Road, Trincomalee   | 1994-11-03 |
| Tech/Fot/003 | Priyanka | Hewage     | p.hewage@uni.lk     | 10 Flower Road, Ratnapura      | 1982-12-15 |
| Tech/Fot/004 | Saman    | Rajapaksha | s.rajapaksha@uni.lk | 7/2 Lake View, Badulla         | 1976-06-28 |
| Tech/Fot/005 | Malani   | De Silva   | m.desilva@uni.lk    | 25/1 Rosmaid Place, Colombo 03 | 1968-10-18 |
+--------------+----------+------------+---------------------+--------------------------------+------------+