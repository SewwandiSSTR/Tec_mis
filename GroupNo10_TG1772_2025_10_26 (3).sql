CREATE TABLE Grade_point (
    Grade CHAR(3) NOT NULL PRIMARY KEY,
    Point DECIMAL(3, 2) NOT NULL CHECK (Point >= 0.00 AND Point <= 4.00)
);

+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| Grade | char(3)      | NO   | PRI | NULL    |       |
| Point | decimal(3,2) | NO   |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+

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

+-------+-------+
| Grade | Point |
+-------+-------+
| A     |  4.00 |
| A-    |  3.70 |
| A+    |  4.00 |
| B     |  3.00 |
| B-    |  2.70 |
| B+    |  3.30 |
| C     |  2.00 |
| C-    |  1.70 |
| C+    |  2.30 |
| D     |  1.00 |
| E     |  0.00 |
| F     |  0.00 |
+-------+-------+