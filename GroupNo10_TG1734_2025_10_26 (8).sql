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

+-------------+---------+--------+-----------------------+
| Regno       | C_code  | C_type | Attendance_Percentage |
+-------------+---------+--------+-----------------------+
| TG/2023/001 | ENG1222 | T      |                100.00 |
| TG/2023/001 | ICT1212 | T      |                100.00 |
| TG/2023/001 | ICT1222 | P      |                100.00 |
| TG/2023/001 | ICT1233 | P      |                100.00 |
| TG/2023/001 | ICT1233 | T      |                100.00 |
| TG/2023/001 | ICT1242 | T      |                100.00 |
| TG/2023/001 | ICT1253 | P      |                100.00 |
| TG/2023/001 | ICT1253 | T      |                100.00 |
| TG/2023/001 | TCS1212 | T      |                 92.86 |
| TG/2023/001 | TMS1233 | T      |                100.00 |
| TG/2023/002 | ENG1222 | T      |                100.00 |
| TG/2023/002 | ICT1212 | T      |                100.00 |
| TG/2023/002 | ICT1222 | P      |                100.00 |
| TG/2023/002 | ICT1233 | P      |                100.00 |
| TG/2023/002 | ICT1233 | T      |                100.00 |
| TG/2023/002 | ICT1242 | T      |                100.00 |
| TG/2023/002 | ICT1253 | P      |                 92.86 |
| TG/2023/002 | ICT1253 | T      |                100.00 |
| TG/2023/002 | TCS1212 | T      |                 92.86 |
| TG/2023/002 | TMS1233 | T      |                100.00 |
| TG/2023/003 | ENG1222 | T      |                100.00 |
| TG/2023/003 | ICT1212 | T      |                100.00 |
| TG/2023/003 | ICT1222 | P      |                 92.86 |
| TG/2023/003 | ICT1233 | P      |                100.00 |
| TG/2023/003 | ICT1233 | T      |                100.00 |
| TG/2023/003 | ICT1242 | T      |                100.00 |
| TG/2023/003 | ICT1253 | P      |                100.00 |
| TG/2023/003 | ICT1253 | T      |                100.00 |
| TG/2023/003 | TCS1212 | T      |                100.00 |
| TG/2023/003 | TMS1233 | T      |                 92.86 |
| TG/2023/004 | ENG1222 | T      |                100.00 |
| TG/2023/004 | ICT1212 | T      |                100.00 |
| TG/2023/004 | ICT1222 | P      |                 92.86 |
| TG/2023/004 | ICT1233 | P      |                 92.86 |
| TG/2023/004 | ICT1233 | T      |                100.00 |
| TG/2023/004 | ICT1242 | T      |                100.00 |
| TG/2023/004 | ICT1253 | P      |                 85.71 |
| TG/2023/004 | ICT1253 | T      |                100.00 |
| TG/2023/004 | TCS1212 | T      |                100.00 |
| TG/2023/004 | TMS1233 | T      |                100.00 |
| TG/2023/005 | ENG1222 | T      |                100.00 |
| TG/2023/005 | ICT1212 | T      |                 92.86 |
| TG/2023/005 | ICT1222 | P      |                100.00 |
| TG/2023/005 | ICT1233 | P      |                100.00 |
| TG/2023/005 | ICT1233 | T      |                100.00 |
| TG/2023/005 | ICT1242 | T      |                100.00 |
| TG/2023/005 | ICT1253 | P      |                 92.86 |
| TG/2023/005 | ICT1253 | T      |                100.00 |
| TG/2023/005 | TCS1212 | T      |                100.00 |
| TG/2023/005 | TMS1233 | T      |                100.00 |
| TG/2023/006 | ENG1222 | T      |                 92.86 |
| TG/2023/006 | ICT1212 | T      |                100.00 |
| TG/2023/006 | ICT1222 | P      |                100.00 |
| TG/2023/006 | ICT1233 | T      |                100.00 |
| TG/2023/006 | ICT1242 | T      |                100.00 |
| TG/2023/006 | ICT1253 | P      |                100.00 |
| TG/2023/006 | ICT1253 | T      |                100.00 |
| TG/2023/006 | TCS1212 | T      |                100.00 |
| TG/2023/006 | TMS1233 | T      |                100.00 |
| TG/2023/007 | ENG1222 | T      |                 85.71 |
| TG/2023/007 | ICT1212 | T      |                100.00 |
| TG/2023/007 | ICT1222 | P      |                100.00 |
| TG/2023/007 | ICT1233 | P      |                100.00 |
| TG/2023/007 | ICT1233 | T      |                100.00 |
| TG/2023/007 | ICT1242 | T      |                100.00 |
| TG/2023/007 | ICT1253 | P      |                100.00 |
| TG/2023/007 | ICT1253 | T      |                100.00 |
| TG/2023/007 | TCS1212 | T      |                100.00 |
| TG/2023/007 | TMS1233 | T      |                100.00 |
| TG/2023/008 | ENG1222 | T      |                100.00 |
| TG/2023/008 | ICT1212 | T      |                 92.86 |
| TG/2023/008 | ICT1222 | P      |                100.00 |
| TG/2023/008 | ICT1233 | P      |                100.00 |
| TG/2023/008 | ICT1233 | T      |                100.00 |
| TG/2023/008 | ICT1242 | T      |                100.00 |
| TG/2023/008 | ICT1253 | P      |                100.00 |
| TG/2023/008 | ICT1253 | T      |                100.00 |
| TG/2023/008 | TCS1212 | T      |                100.00 |
| TG/2023/008 | TMS1233 | T      |                100.00 |
| TG/2023/009 | ENG1222 | T      |                100.00 |
| TG/2023/009 | ICT1212 | T      |                100.00 |
| TG/2023/009 | ICT1222 | P      |                100.00 |
| TG/2023/009 | ICT1233 | P      |                100.00 |
| TG/2023/009 | ICT1233 | T      |                100.00 |
| TG/2023/009 | ICT1242 | T      |                100.00 |
| TG/2023/009 | ICT1253 | P      |                100.00 |
| TG/2023/009 | ICT1253 | T      |                100.00 |
| TG/2023/009 | TCS1212 | T      |                100.00 |
| TG/2023/009 | TMS1233 | T      |                100.00 |
| TG/2023/010 | ENG1222 | T      |                 92.86 |
| TG/2023/010 | ICT1212 | T      |                100.00 |
| TG/2023/010 | ICT1222 | P      |                100.00 |
| TG/2023/010 | ICT1233 | P      |                100.00 |
| TG/2023/010 | ICT1233 | T      |                100.00 |
| TG/2023/010 | ICT1242 | T      |                100.00 |
| TG/2023/010 | ICT1253 | P      |                100.00 |
| TG/2023/010 | ICT1253 | T      |                100.00 |
| TG/2023/010 | TCS1212 | T      |                100.00 |
| TG/2023/010 | TMS1233 | T      |                100.00 |
+-------------+---------+--------+-----------------------+