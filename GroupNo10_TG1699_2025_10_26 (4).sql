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

+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| D_id    | char(12)     | NO   | PRI | NULL    |       |
| Fname   | varchar(50)  | NO   |     | NULL    |       |
| Lname   | varchar(50)  | NO   |     | NULL    |       |
| Email   | varchar(30)  | NO   |     | NULL    |       |
| Address | varchar(100) | YES  |     | NULL    |       |
| Dob     | date         | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+

-- To dean Insert
INSERT INTO Dean (D_id, Fname, Lname, Email, Address, Dob) VALUES
('Dean/Fot/001', 'Nimal', 'Perera','n.perera@uni.lk', '45 Galle Rd, Dehiwala', '1993-02-10');

+--------------+-------+--------+-----------------+-----------------------+------------+
| D_id         | Fname | Lname  | Email           | Address               | Dob        |
+--------------+-------+--------+-----------------+-----------------------+------------+
| Dean/Fot/001 | Nimal | Perera | n.perera@uni.lk | 45 Galle Rd, Dehiwala | 1993-02-10 |
+--------------+-------+--------+-----------------+-----------------------+------------+
