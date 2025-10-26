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

+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| C_code | char(8)       | NO   | PRI | NULL    |       |
| C_type | enum('P','T') | NO   | PRI | NULL    |       |
| Regno  | char(12)      | NO   | PRI | NULL    |       |
| P_mark | float(9,2)    | NO   |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+

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

+---------+--------+-------------+--------+
| C_code  | C_type | Regno       | P_mark |
+---------+--------+-------------+--------+
| ICT1222 | P      | TG/2023/001 |  71.00 |
| ICT1222 | P      | TG/2023/002 |  78.00 |
| ICT1222 | P      | TG/2023/003 |  80.00 |
| ICT1222 | P      | TG/2023/004 |  75.00 |
| ICT1222 | P      | TG/2023/005 |  82.00 |
| ICT1222 | P      | TG/2023/006 |  89.00 |
| ICT1222 | P      | TG/2023/007 |  79.00 |
| ICT1222 | P      | TG/2023/008 |  81.00 |
| ICT1222 | P      | TG/2023/009 |  90.00 |
| ICT1222 | P      | TG/2023/010 |  72.00 |
| ICT1233 | P      | TG/2023/001 |  60.00 |
| ICT1233 | P      | TG/2023/002 |  84.00 |
| ICT1233 | P      | TG/2023/003 |  78.00 |
| ICT1233 | P      | TG/2023/004 |  76.00 |
| ICT1233 | P      | TG/2023/005 |  87.00 |
| ICT1233 | P      | TG/2023/006 |  89.00 |
| ICT1233 | P      | TG/2023/007 |  88.00 |
| ICT1233 | P      | TG/2023/008 |  78.00 |
| ICT1233 | P      | TG/2023/009 |  83.00 |
| ICT1233 | P      | TG/2023/010 |  80.00 |
+---------+--------+-------------+--------+
