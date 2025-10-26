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

+-------------+---------+--------+-----------------------+
| Regno       | C_code  | C_type | Attendance_Percentage |
+-------------+---------+--------+-----------------------+
| TG/2023/006 | ICT1233 | P      |                 78.57 |
+-------------+---------+--------+-----------------------+