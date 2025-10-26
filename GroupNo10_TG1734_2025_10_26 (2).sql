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

+-----------+---------------+------+-----+-------------------+-------------------+
| Field     | Type          | Null | Key | Default           | Extra             |
+-----------+---------------+------+-----+-------------------+-------------------+
| C_code    | char(8)       | NO   | PRI | NULL              |                   |
| C_type    | enum('P','T') | NO   | PRI | NULL              |                   |
| Week      | int           | NO   | PRI | NULL              |                   |
| Tec_id    | char(12)      | NO   | MUL | NULL              |                   |
| Handle_at | timestamp     | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+-----------+---------------+------+-----+-------------------+-------------------+

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


+---------+--------+------+--------------+---------------------+
| C_code  | C_type | Week | Tec_id       | Handle_at           |
+---------+--------+------+--------------+---------------------+
| ENG1222 | T      |    1 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ENG1222 | T      |    2 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ENG1222 | T      |    3 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ENG1222 | T      |    4 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ENG1222 | T      |    5 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ENG1222 | T      |    6 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ENG1222 | T      |    7 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ENG1222 | T      |    8 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ENG1222 | T      |    9 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ENG1222 | T      |   10 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ENG1222 | T      |   11 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ENG1222 | T      |   12 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ENG1222 | T      |   13 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ENG1222 | T      |   14 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ENG1222 | T      |   15 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1212 | T      |    1 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1212 | T      |    2 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1212 | T      |    3 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1212 | T      |    4 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1212 | T      |    5 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1212 | T      |    6 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1212 | T      |    7 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1212 | T      |    8 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1212 | T      |    9 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1212 | T      |   10 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1212 | T      |   11 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1212 | T      |   12 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1212 | T      |   13 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1212 | T      |   14 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1212 | T      |   15 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1222 | P      |    1 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1222 | P      |    2 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1222 | P      |    3 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1222 | P      |    4 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1222 | P      |    5 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1222 | P      |    6 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1222 | P      |    7 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1222 | P      |    8 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1222 | P      |    9 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1222 | P      |   10 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1222 | P      |   11 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1222 | P      |   12 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1222 | P      |   13 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1222 | P      |   14 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1222 | P      |   15 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1233 | P      |    1 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1233 | P      |    2 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1233 | P      |    3 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1233 | P      |    4 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1233 | P      |    5 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1233 | P      |    6 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1233 | P      |    7 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1233 | P      |    8 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1233 | P      |    9 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1233 | P      |   10 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1233 | P      |   11 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1233 | P      |   12 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1233 | P      |   13 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1233 | P      |   14 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1233 | P      |   15 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1233 | T      |    1 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1233 | T      |    2 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1233 | T      |    3 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1233 | T      |    4 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1233 | T      |    5 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1233 | T      |    6 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1233 | T      |    7 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1233 | T      |    8 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1233 | T      |    9 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1233 | T      |   10 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1233 | T      |   11 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1233 | T      |   12 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1233 | T      |   13 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1233 | T      |   14 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1233 | T      |   15 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1242 | T      |    1 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1242 | T      |    2 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1242 | T      |    3 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1242 | T      |    4 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1242 | T      |    5 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1242 | T      |    6 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1242 | T      |    7 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1242 | T      |    8 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1242 | T      |    9 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1242 | T      |   10 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1242 | T      |   11 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1242 | T      |   12 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1242 | T      |   13 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1242 | T      |   14 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1242 | T      |   15 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1253 | P      |    1 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1253 | P      |    2 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1253 | P      |    3 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1253 | P      |    4 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1253 | P      |    5 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1253 | P      |    6 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1253 | P      |    7 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1253 | P      |    8 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1253 | P      |    9 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1253 | P      |   10 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1253 | P      |   11 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1253 | P      |   12 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1253 | P      |   13 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1253 | P      |   14 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1253 | P      |   15 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1253 | T      |    1 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1253 | T      |    2 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1253 | T      |    3 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1253 | T      |    4 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1253 | T      |    5 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1253 | T      |    6 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1253 | T      |    7 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1253 | T      |    8 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1253 | T      |    9 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1253 | T      |   10 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| ICT1253 | T      |   11 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| ICT1253 | T      |   12 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| ICT1253 | T      |   13 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| ICT1253 | T      |   14 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| ICT1253 | T      |   15 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| TCS1212 | T      |    1 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| TCS1212 | T      |    2 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| TCS1212 | T      |    3 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| TCS1212 | T      |    4 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| TCS1212 | T      |    5 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| TCS1212 | T      |    6 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| TCS1212 | T      |    7 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| TCS1212 | T      |    8 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| TCS1212 | T      |    9 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| TCS1212 | T      |   10 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| TCS1212 | T      |   11 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| TCS1212 | T      |   12 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| TCS1212 | T      |   13 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| TCS1212 | T      |   14 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| TCS1212 | T      |   15 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| TMS1233 | T      |    1 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| TMS1233 | T      |    2 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| TMS1233 | T      |    3 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| TMS1233 | T      |    4 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| TMS1233 | T      |    5 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| TMS1233 | T      |    6 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| TMS1233 | T      |    7 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| TMS1233 | T      |    8 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| TMS1233 | T      |    9 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| TMS1233 | T      |   10 | Tech/Fot/001 | 2025-10-26 16:14:37 |
| TMS1233 | T      |   11 | Tech/Fot/002 | 2025-10-26 16:14:37 |
| TMS1233 | T      |   12 | Tech/Fot/005 | 2025-10-26 16:14:37 |
| TMS1233 | T      |   13 | Tech/Fot/004 | 2025-10-26 16:14:37 |
| TMS1233 | T      |   14 | Tech/Fot/003 | 2025-10-26 16:14:37 |
| TMS1233 | T      |   15 | Tech/Fot/001 | 2025-10-26 16:14:37 |
+---------+--------+------+--------------+---------------------+
