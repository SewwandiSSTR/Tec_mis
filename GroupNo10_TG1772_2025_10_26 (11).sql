-- result status
CREATE OR REPLACE VIEW Result_status AS
-- Rank and get top 2 quiz marks
WITH ranked_quiz AS ( 
    SELECT
        Regno, C_code, C_type, mark,
        ROW_NUMBER() OVER (
            PARTITION BY Regno, C_code, C_type 
            ORDER BY COALESCE(mark, 0) DESC
        ) AS rn
    FROM Quiz
),

quiz_mark AS (
    SELECT
        Regno, C_code, C_type,
        AVG(mark) AS quiz_mark 
    FROM ranked_quiz
    WHERE rn <= 2 
    GROUP BY Regno, C_code, C_type
),

Assignment_mark AS (
    SELECT
        Regno, C_code, C_type,
        SUM(COALESCE(A_mark, 0)) AS Ass_mark
    FROM Assignment  
    GROUP BY Regno, C_code, C_type
),

Project_mark AS ( 
    SELECT
        Regno, C_code, C_type,
        MAX(COALESCE(P_mark, 0)) AS Project_mark 
    FROM Project
    GROUP BY Regno, C_code, C_type
),

-- Base CTE joins all components (marks, medicals, attendance)
Base_CA AS (
    SELECT 
        en.Regno,
        en.C_code,
        en.C_type,
        q.quiz_mark, 
        a.Ass_mark,
        m.Mid_mark,
        p.Project_mark,
        e.End_mark,
        mm.Medical_status AS Mid_Medical_status, 
        me.Medical_Status AS End_Medical_status,  
        ae.Eligibility AS Attendance_Eligibility 
        
    FROM Course_Enrollment en
    LEFT JOIN quiz_mark q
        ON en.Regno = q.Regno AND en.C_code = q.C_code AND en.C_type = q.C_type
    LEFT JOIN Assignment_mark a
        ON en.Regno = a.Regno AND en.C_code = a.C_code AND en.C_type = a.C_type
    LEFT JOIN Mid_exam m
        ON en.Regno = m.Regno AND en.C_code = m.C_code AND en.C_type = m.C_type
    LEFT JOIN Project_mark p
        ON en.Regno = p.Regno AND en.C_code = p.C_code AND en.C_type = p.C_type
    LEFT JOIN End_exam e 
        ON en.Regno = e.Regno AND en.C_code = e.C_code AND en.C_type = e.C_type
    LEFT JOIN Medical_mid mm 
        ON en.Regno = mm.Regno AND en.C_code = mm.C_code AND en.C_type = mm.C_type 
    LEFT JOIN Medical_End me  
        ON en.Regno = me.Regno AND en.C_code = me.C_code AND en.C_type = me.C_type
    LEFT JOIN Attendance_eligibility ae 
        ON en.Regno = ae.Regno AND en.C_code = ae.C_code AND en.C_type = ae.C_type
),

-- CTE calculates CA mark (as a decimal) or assigns 'MC'
Calculated_CA AS (
    SELECT 
        c.Regno,
        c.C_code,
        c.C_type,
        c.End_mark,
        c.End_Medical_status, 
        c.Attendance_Eligibility,
        
        -- CA Calculation and Mid MC Check
        CASE 
            WHEN c.Mid_Medical_status IN ('Approved', 'Pending') THEN 'MC'
            ELSE 
                CAST(
                    CASE
                        WHEN c.C_code IN ('ICT1242' , 'TCS1212' , 'TMS1233') THEN COALESCE(c.quiz_mark, 0) * 0.1 + COALESCE(c.Ass_mark, 0) * 0.05 + COALESCE(c.Mid_mark, 0) * 0.15
                        WHEN c.C_code = 'ICT1212' THEN COALESCE(c.quiz_mark, 0) * 0.1 + COALESCE(c.Mid_mark, 0) * 0.2
                        WHEN c.C_code = 'ICT1222' THEN COALESCE(c.quiz_mark, 0) * 0.05 + COALESCE(c.Mid_mark, 0) * 0.15 + COALESCE(c.Project_mark, 0) * 0.2
                        WHEN c.C_code IN ('ICT1233','ICT1253') THEN COALESCE(c.quiz_mark, 0) * 0.1 + COALESCE(c.Mid_mark, 0) * 0.1 + COALESCE(c.Project_mark, 0) * 0.15 + COALESCE(c.Ass_mark, 0) * 0.1 
                        ELSE COALESCE(c.Mid_mark, 0) * 0.2 + COALESCE(c.Ass_mark, 0) * 0.1
                    END 
                AS DECIMAL(10, 2))
        END AS CA
    FROM Base_CA c
),

-- CTE to scale the CA mark for the 40-point pass check
Final_Marks AS (
    SELECT
        c.*,
        CASE
            WHEN c.CA = 'MC' THEN NULL 
            WHEN c.C_type = 'T' THEN CAST(c.CA AS DECIMAL(10,2)) * (100.0 / 30.0) 
            WHEN c.C_type = 'P' THEN CAST(c.CA AS DECIMAL(10,2)) * (100.0 / 40.0) 
            ELSE CAST(c.CA AS DECIMAL(10,2)) 
        END AS Scaled_CA_Mark
    FROM Calculated_CA c
)

-- Final SELECT to determine status based on scaled marks
SELECT  
    f.Regno,
    f.C_code,
    f.C_type,
    
    -- Final CA Mark (Display) - FIX: Use ROUND(..., 2)
    CASE
        WHEN f.CA = 'MC' THEN 'MC'
        -- Rounds the mark to 2 decimal places before casting to a display string
        ELSE CAST(ROUND(f.Scaled_CA_Mark, 2) AS CHAR(10)) 
    END AS CA, 

    -- CA Status Check (Uses the Scaled_CA_Mark for >= 40 check)
    CASE 
        WHEN f.CA = 'MC' THEN 'MC'
        WHEN f.Scaled_CA_Mark >= 40.0 THEN 'Pass' 
        ELSE 'Fail'
    END AS CA_Status,
    
    -- End_mark Output (Mark or Status)
    CASE 
        WHEN f.Attendance_Eligibility = 'NE' THEN 'NE' 
        WHEN f.End_Medical_status IN ('Approved', 'Pending') THEN 'MC' 
        WHEN f.End_mark IS NULL THEN '0.00' 
        ELSE CAST(f.End_mark AS CHAR(10)) 
    END AS End_mark,

    -- End Status Check 
    CASE 
        WHEN f.Attendance_Eligibility = 'NE' THEN 'NE' 
        WHEN f.End_Medical_status IN ('Approved', 'Pending') THEN 'MC' 
        WHEN f.End_mark IS NULL THEN 'Fail' 
        WHEN CAST(f.End_mark AS DECIMAL(10,2)) >= 35 THEN 'Pass'
        ELSE 'Fail'
    END AS End_Status

FROM Final_Marks f;

+-------------+---------+--------+-------+-----------+----------+------------+
| Regno       | C_code  | C_type | CA    | CA_Status | End_mark | End_Status |
+-------------+---------+--------+-------+-----------+----------+------------+
| TG/2020/010 | TCS1212 | T      | 0.00  | Fail      | 0.00     | Fail       |
| TG/2021/006 | TMS1233 | T      | 0.00  | Fail      | 0.00     | Fail       |
| TG/2021/023 | ICT1242 | T      | 56.10 | Pass      | 88.00    | Pass       |
| TG/2021/088 | TMS1233 | T      | 54.17 | Pass      | 95.00    | Pass       |
| TG/2023/001 | ENG1222 | T      | 81.67 | Pass      | 95.00    | Pass       |
| TG/2023/001 | ICT1212 | T      | 84.17 | Pass      | 90.00    | Pass       |
| TG/2023/001 | ICT1222 | P      | 77.73 | Pass      | 62.00    | Pass       |
| TG/2023/001 | ICT1233 | P      | 62.00 | Pass      | 88.50    | Pass       |
| TG/2023/001 | ICT1233 | T      | 74.17 | Pass      | 80.00    | Pass       |
| TG/2023/001 | ICT1242 | T      | 74.50 | Pass      | 82.00    | Pass       |
| TG/2023/001 | ICT1253 | P      | 35.33 | Fail      | 77.50    | Pass       |
| TG/2023/001 | ICT1253 | T      | 63.77 | Pass      | 90.00    | Pass       |
| TG/2023/001 | TCS1212 | T      | 79.00 | Pass      | 87.50    | Pass       |
| TG/2023/001 | TMS1233 | T      | 86.83 | Pass      | 65.00    | Pass       |
| TG/2023/002 | ENG1222 | T      | 85.00 | Pass      | 75.50    | Pass       |
| TG/2023/002 | ICT1212 | T      | 84.27 | Pass      | 73.00    | Pass       |
| TG/2023/002 | ICT1222 | P      | 80.65 | Pass      | 52.00    | Pass       |
| TG/2023/002 | ICT1233 | P      | 51.63 | Pass      | 88.00    | Pass       |
| TG/2023/002 | ICT1233 | T      | MC    | MC        | 78.00    | Pass       |
| TG/2023/002 | ICT1242 | T      | 82.00 | Pass      | 77.00    | Pass       |
| TG/2023/002 | ICT1253 | P      | 40.33 | Pass      | 70.50    | Pass       |
| TG/2023/002 | ICT1253 | T      | 79.00 | Pass      | 68.00    | Pass       |
| TG/2023/002 | TCS1212 | T      | 77.50 | Pass      | 87.00    | Pass       |
| TG/2023/002 | TMS1233 | T      | 85.93 | Pass      | 61.50    | Pass       |
| TG/2023/003 | ENG1222 | T      | 44.00 | Pass      | 70.00    | Pass       |
| TG/2023/003 | ICT1212 | T      | 90.17 | Pass      | 80.00    | Pass       |
| TG/2023/003 | ICT1222 | P      | 82.98 | Pass      | 85.00    | Pass       |
| TG/2023/003 | ICT1233 | P      | 72.13 | Pass      | 59.50    | Pass       |
| TG/2023/003 | ICT1233 | T      | 75.77 | Pass      | 68.50    | Pass       |
| TG/2023/003 | ICT1242 | T      | 83.60 | Pass      | 58.50    | Pass       |
| TG/2023/003 | ICT1253 | P      | 38.00 | Fail      | 78.00    | Pass       |
| TG/2023/003 | ICT1253 | T      | 71.43 | Pass      | 63.00    | Pass       |
| TG/2023/003 | TCS1212 | T      | 80.43 | Pass      | 87.00    | Pass       |
| TG/2023/003 | TMS1233 | T      | 90.00 | Pass      | 82.50    | Pass       |
| TG/2023/004 | ENG1222 | T      | 82.67 | Pass      | 88.50    | Pass       |
| TG/2023/004 | ICT1212 | T      | 82.17 | Pass      | 56.50    | Pass       |
| TG/2023/004 | ICT1222 | P      | 80.25 | Pass      | 90.50    | Pass       |
| TG/2023/004 | ICT1233 | P      | 70.00 | Pass      | 75.50    | Pass       |
| TG/2023/004 | ICT1233 | T      | 77.50 | Pass      | 76.00    | Pass       |
| TG/2023/004 | ICT1242 | T      | 71.60 | Pass      | 82.00    | Pass       |
| TG/2023/004 | ICT1253 | P      | MC    | MC        | MC       | MC         |
| TG/2023/004 | ICT1253 | T      | 64.17 | Pass      | 89.50    | Pass       |
| TG/2023/004 | TCS1212 | T      | 86.67 | Pass      | 86.00    | Pass       |
| TG/2023/004 | TMS1233 | T      | 79.67 | Pass      | 87.00    | Pass       |
| TG/2023/005 | ICT1212 | T      | 58.33 | Pass      | 57.50    | Pass       |
| TG/2023/005 | ICT1222 | P      | 73.83 | Pass      | 67.50    | Pass       |
| TG/2023/005 | ICT1233 | P      | 55.63 | Pass      | 79.50    | Pass       |
| TG/2023/005 | ICT1233 | T      | 51.17 | Pass      | 78.50    | Pass       |
| TG/2023/005 | ICT1242 | T      | 50.00 | Pass      | 76.00    | Pass       |
| TG/2023/005 | ICT1253 | P      | 23.75 | Fail      | 85.00    | Pass       |
| TG/2023/005 | ICT1253 | T      | 41.50 | Pass      | 79.50    | Pass       |
| TG/2023/005 | TCS1212 | T      | 60.67 | Pass      | 85.00    | Pass       |
| TG/2023/005 | TMS1233 | T      | 54.07 | Pass      | 78.50    | Pass       |
| TG/2023/006 | ENG1222 | T      | 95.00 | Pass      | 85.00    | Pass       |
| TG/2023/006 | ICT1212 | T      | 56.00 | Pass      | 84.00    | Pass       |
| TG/2023/006 | ICT1222 | P      | 77.33 | Pass      | 77.50    | Pass       |
| TG/2023/006 | ICT1233 | P      | 50.88 | Pass      | NE       | NE         |
| TG/2023/006 | ICT1233 | T      | 44.83 | Pass      | 69.50    | Pass       |
| TG/2023/006 | ICT1242 | T      | 60.27 | Pass      | 68.00    | Pass       |
| TG/2023/006 | ICT1253 | P      | 21.25 | Fail      | 84.00    | Pass       |
| TG/2023/006 | ICT1253 | T      | 43.00 | Pass      | 84.50    | Pass       |
| TG/2023/006 | TCS1212 | T      | 59.67 | Pass      | 78.50    | Pass       |
| TG/2023/006 | TMS1233 | T      | 51.50 | Pass      | 78.50    | Pass       |
| TG/2023/007 | ENG1222 | T      | 66.67 | Pass      | 82.50    | Pass       |
| TG/2023/007 | ICT1212 | T      | 53.33 | Pass      | 80.00    | Pass       |
| TG/2023/007 | ICT1222 | P      | 73.63 | Pass      | 61.00    | Pass       |
| TG/2023/007 | ICT1233 | P      | 51.00 | Pass      | 72.00    | Pass       |
| TG/2023/007 | ICT1233 | T      | 49.83 | Pass      | 74.50    | Pass       |
| TG/2023/007 | ICT1242 | T      | 56.77 | Pass      | 63.50    | Pass       |
| TG/2023/007 | ICT1253 | P      | 17.25 | Fail      | 59.00    | Pass       |
| TG/2023/007 | ICT1253 | T      | MC    | MC        | MC       | MC         |
| TG/2023/007 | TCS1212 | T      | 50.77 | Pass      | 78.50    | Pass       |
| TG/2023/007 | TMS1233 | T      | 40.43 | Pass      | 97.50    | Pass       |
| TG/2023/008 | ENG1222 | T      | 87.33 | Pass      | 94.50    | Pass       |
| TG/2023/008 | ICT1212 | T      | 38.67 | Fail      | 58.00    | Pass       |
| TG/2023/008 | ICT1222 | P      | 72.93 | Pass      | MC       | MC         |
| TG/2023/008 | ICT1233 | P      | 52.25 | Pass      | 62.00    | Pass       |
| TG/2023/008 | ICT1233 | T      | 56.67 | Pass      | 85.00    | Pass       |
| TG/2023/008 | ICT1242 | T      | 47.17 | Pass      | MC       | MC         |
| TG/2023/008 | ICT1253 | P      | 17.75 | Fail      | 68.00    | Pass       |
| TG/2023/008 | ICT1253 | T      | 48.83 | Pass      | 71.50    | Pass       |
| TG/2023/008 | TCS1212 | T      | 49.43 | Pass      | 72.50    | Pass       |
| TG/2023/008 | TMS1233 | T      | 58.60 | Pass      | 90.50    | Pass       |
| TG/2023/009 | ENG1222 | T      | 75.67 | Pass      | 66.00    | Pass       |
| TG/2023/009 | ICT1212 | T      | 52.33 | Pass      | 78.50    | Pass       |
| TG/2023/009 | ICT1222 | P      | 68.45 | Pass      | 62.50    | Pass       |
| TG/2023/009 | ICT1233 | P      | MC    | MC        | 70.00    | Pass       |
| TG/2023/009 | ICT1233 | T      | 42.00 | Pass      | 67.00    | Pass       |
| TG/2023/009 | ICT1242 | T      | 38.77 | Fail      | 57.50    | Pass       |
| TG/2023/009 | ICT1253 | P      | 21.25 | Fail      | 78.50    | Pass       |
| TG/2023/009 | ICT1253 | T      | 45.33 | Pass      | 67.00    | Pass       |
| TG/2023/009 | TCS1212 | T      | 55.00 | Pass      | 85.00    | Pass       |
| TG/2023/009 | TMS1233 | T      | 60.17 | Pass      | 85.00    | Pass       |
| TG/2023/010 | ENG1222 | T      | MC    | MC        | 88.00    | Pass       |
| TG/2023/010 | ICT1212 | T      | 33.33 | Fail      | 50.00    | Pass       |
| TG/2023/010 | ICT1222 | P      | 69.00 | Pass      | 78.00    | Pass       |
| TG/2023/010 | ICT1233 | P      | 49.00 | Pass      | 76.00    | Pass       |
| TG/2023/010 | ICT1233 | T      | 58.33 | Pass      | 85.00    | Pass       |
| TG/2023/010 | ICT1242 | T      | 58.43 | Pass      | 80.50    | Pass       |
| TG/2023/010 | ICT1253 | P      | 22.63 | Fail      | 90.50    | Pass       |
| TG/2023/010 | ICT1253 | T      | 51.00 | Pass      | MC       | MC         |
| TG/2023/010 | TCS1212 | T      | 46.33 | Pass      | 76.00    | Pass       |
| TG/2023/010 | TMS1233 | T      | 61.93 | Pass      | 83.50    | Pass       |
+-------------+---------+--------+-------+-----------+----------+------------+