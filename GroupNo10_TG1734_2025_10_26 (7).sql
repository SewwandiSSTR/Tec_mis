-- Department
CREATE TABLE Department(
  Dep_id CHAR(5)  NOT NULL,
  Dep_name VARCHAR(50)  NOT NULL,
  PRIMARY KEY(Dep_id)
);

+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| Dep_id   | char(5)     | NO   | PRI | NULL    |       |
| Dep_name | varchar(50) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

-- insert values
INSERT INTO Department
(Dep_id,Dep_name)
VALUES
('DICT','Information and Communication Technology'),
('DMS','Multidiciplinary Studies'),
('DENT','Engineering Technology');

+--------+------------------------------------------+
| Dep_id | Dep_name                                 |
+--------+------------------------------------------+
| DENT   | Engineering Technology                   |
| DICT   | Information and Communication Technology |
| DMS    | Multidiciplinary Studies                 |
+--------+------------------------------------------+