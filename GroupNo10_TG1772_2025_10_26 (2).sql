CREATE OR REPLACE VIEW GPA AS
-- CTE to map Grade to Point (Assumes Grade_point table exists)
WITH GradeCalc AS (
    SELECT 
        R.Regno,
        R.C_code,
        R.C_type,
        R.Grade,
        
        -- Corrected: Join the Course table on both C_code and C_type
        CAST(C.Credit AS DECIMAL(5,2)) AS Credit,
        
        -- Determine the Point for calculation
        CASE 
            -- Grades that should result in 0 points but ARE counted in the credit total (NE, E, D, F)
            WHEN R.Grade IN ('NE', 'E', 'D', 'F') THEN 0.00
            
            -- Grades that must be EXCLUDED from both points and credit totals (WH, MC)
            WHEN R.Grade IN ('WH', 'MC') THEN NULL 
            
            -- Use the standard point for passing grades
            ELSE G.Point
        END AS Calculated_Point
        
    FROM 
        Final_result R
    INNER JOIN 
        Course C ON R.C_code = C.C_code AND R.C_type = C.C_type -- CORRECTED JOIN
    LEFT JOIN 
        Grade_point G ON R.Grade = G.Grade
),

CreditTotals AS (
    SELECT
        Regno,
        
        -- Flag: Check only for 'WH' or 'MC' (These stop the numeric GPA output)
        MAX(CASE WHEN R.Grade IN ('WH', 'MC') THEN 1 ELSE 0 END) AS HasWithheldGrade, 
        
        -- 1. Total Credit for SGPA (CORRECTED: Excludes credits from WH/MC grades)
        SUM(
            CASE WHEN R.Grade IN ('WH', 'MC') THEN 0.00 
            ELSE Credit 
            END
        ) AS TotalCredit_SGPA,
        
        -- 2. Total Points for SGPA 
        -- COALESCE handles NULL Calculated_Point from WH/MC, setting their point contribution to 0.00.
        SUM(COALESCE(Calculated_Point * Credit, 0.00)) AS TotalPoints_SGPA,

        -- 3. Total Credit for CGPA (CORRECTED: Excludes 'ENG1222' AND credits from WH/MC grades)
        SUM(
            CASE 
                WHEN R.C_code = 'ENG1222' OR R.Grade IN ('WH', 'MC') THEN 0.00
                ELSE Credit 
            END
        ) AS TotalCredit_CGPA,
        
        -- 4. Total Points for CGPA (Excludes 'ENG1222')
        SUM(
            CASE 
                WHEN R.C_code = 'ENG1222' THEN 0.00 
                ELSE COALESCE(Calculated_Point * Credit, 0.00) 
            END
        ) AS TotalPoints_CGPA
        
    FROM 
        GradeCalc R
    GROUP BY
        Regno
)

SELECT 
    Regno,
    --  SGPA Calculation
    CASE 
        WHEN HasWithheldGrade = 1 THEN 'WH' 
        WHEN TotalCredit_SGPA = 0 THEN 'N/A' 
        ELSE 
            CAST(
                ROUND(
                    TotalPoints_SGPA / TotalCredit_SGPA,
                    2
                ) 
            AS CHAR(10)) 
    END AS SGPA,

    --  CGPA Calculation
    CASE 
        WHEN HasWithheldGrade = 1 THEN 'WH'
        WHEN TotalCredit_CGPA = 0 THEN 'N/A'
        ELSE 
            CAST(
                ROUND(
                    TotalPoints_CGPA / TotalCredit_CGPA,
                    2
                ) 
            AS CHAR(10))
    END AS CGPA
FROM 
    CreditTotals;

+-------------+---------+--------+------------+-------+
| Regno       | C_code  | C_type | Final_Mark | Grade |
+-------------+---------+--------+------------+-------+
| TG/2021/023 | ICT1242 | T      | 78.43      | A     |
| TG/2021/088 | TMS1233 | T      | 82.75      | A     |
| TG/2023/001 | ENG1222 | T      | 91.00      | A+    |
| TG/2023/001 | ICT1212 | T      | 88.25      | A+    |
| TG/2023/001 | ICT1222 | P      | 68.29      | B+    |
| TG/2023/001 | ICT1233 | P      | 77.90      | A     |
| TG/2023/001 | ICT1233 | T      | 78.25      | A     |
| TG/2023/001 | ICT1242 | T      | 79.75      | A     |
| TG/2023/001 | ICT1253 | P      | 46.50      | E     |
| TG/2023/001 | ICT1253 | T      | 82.13      | A     |
| TG/2023/001 | TCS1212 | T      | 84.95      | A     |
| TG/2023/001 | TMS1233 | T      | 71.55      | A-    |
| TG/2023/002 | ENG1222 | T      | 78.35      | A     |
| TG/2023/002 | ICT1212 | T      | 76.38      | A     |
| TG/2023/002 | ICT1222 | P      | 63.46      | B     |
| TG/2023/002 | ICT1233 | P      | 73.45      | A-    |
| TG/2023/002 | ICT1233 | T      | WH         | WH    |
| TG/2023/002 | ICT1242 | T      | 78.50      | A     |
| TG/2023/002 | ICT1253 | P      | 58.43      | B-    |
| TG/2023/002 | ICT1253 | T      | 71.30      | A-    |
| TG/2023/002 | TCS1212 | T      | 84.15      | A     |
| TG/2023/002 | TMS1233 | T      | 68.83      | B+    |
| TG/2023/003 | ENG1222 | T      | 62.20      | B     |
| TG/2023/003 | ICT1212 | T      | 83.05      | A     |
| TG/2023/003 | ICT1222 | P      | 84.19      | A     |
| TG/2023/003 | ICT1233 | P      | 64.55      | B     |
| TG/2023/003 | ICT1233 | T      | 70.68      | A-    |
| TG/2023/003 | ICT1242 | T      | 66.03      | B+    |
| TG/2023/003 | ICT1253 | P      | 46.80      | E     |
| TG/2023/003 | ICT1253 | T      | 65.53      | B+    |
| TG/2023/003 | TCS1212 | T      | 85.03      | A+    |
| TG/2023/003 | TMS1233 | T      | 84.75      | A     |
| TG/2023/004 | ENG1222 | T      | 86.75      | A+    |
| TG/2023/004 | ICT1212 | T      | 64.20      | B     |
| TG/2023/004 | ICT1222 | P      | 86.40      | A+    |
| TG/2023/004 | ICT1233 | P      | 73.30      | A-    |
| TG/2023/004 | ICT1233 | T      | 76.45      | A     |
| TG/2023/004 | ICT1242 | T      | 78.88      | A     |
| TG/2023/004 | ICT1253 | P      | WH         | WH    |
| TG/2023/004 | ICT1253 | T      | 81.90      | A     |
| TG/2023/004 | TCS1212 | T      | 86.20      | A+    |
| TG/2023/004 | TMS1233 | T      | 84.80      | A     |
| TG/2023/005 | ICT1212 | T      | 57.75      | B-    |
| TG/2023/005 | ICT1222 | P      | 70.03      | A-    |
| TG/2023/005 | ICT1233 | P      | 69.95      | B+    |
| TG/2023/005 | ICT1233 | T      | 70.30      | A-    |
| TG/2023/005 | ICT1242 | T      | 68.20      | B+    |
| TG/2023/005 | ICT1253 | P      | 51.00      | E     |
| TG/2023/005 | ICT1253 | T      | 68.10      | B+    |
| TG/2023/005 | TCS1212 | T      | 77.70      | A     |
| TG/2023/005 | TMS1233 | T      | 71.17      | A-    |
| TG/2023/006 | ENG1222 | T      | 88.00      | A+    |
| TG/2023/006 | ICT1212 | T      | 75.60      | A     |
| TG/2023/006 | ICT1222 | P      | 77.43      | A     |
| TG/2023/006 | ICT1233 | P      | WH         | WH    |
| TG/2023/006 | ICT1233 | T      | 62.10      | B     |
| TG/2023/006 | ICT1242 | T      | 65.68      | B+    |
| TG/2023/006 | ICT1253 | P      | 50.40      | E     |
| TG/2023/006 | ICT1253 | T      | 72.05      | A-    |
| TG/2023/006 | TCS1212 | T      | 72.85      | A-    |
| TG/2023/006 | TMS1233 | T      | 70.40      | A-    |
| TG/2023/007 | ENG1222 | T      | 77.75      | A     |
| TG/2023/007 | ICT1212 | T      | 72.00      | A-    |
| TG/2023/007 | ICT1222 | P      | 66.05      | B+    |
| TG/2023/007 | ICT1233 | P      | 63.60      | B     |
| TG/2023/007 | ICT1233 | T      | 67.10      | B+    |
| TG/2023/007 | ICT1242 | T      | 61.48      | B     |
| TG/2023/007 | ICT1253 | P      | 35.40      | E     |
| TG/2023/007 | ICT1253 | T      | WH         | WH    |
| TG/2023/007 | TCS1212 | T      | 70.18      | A-    |
| TG/2023/007 | TMS1233 | T      | 80.38      | A     |
| TG/2023/008 | ENG1222 | T      | 92.35      | A+    |
| TG/2023/008 | ICT1212 | T      | 40.60      | E     |
| TG/2023/008 | ICT1222 | P      | WH         | WH    |
| TG/2023/008 | ICT1233 | P      | 58.10      | B-    |
| TG/2023/008 | ICT1233 | T      | 76.50      | A     |
| TG/2023/008 | ICT1242 | T      | WH         | WH    |
| TG/2023/008 | ICT1253 | P      | 40.80      | E     |
| TG/2023/008 | ICT1253 | T      | 64.70      | B     |
| TG/2023/008 | TCS1212 | T      | 65.58      | B+    |
| TG/2023/008 | TMS1233 | T      | 80.93      | A     |
| TG/2023/009 | ENG1222 | T      | 68.90      | B+    |
| TG/2023/009 | ICT1212 | T      | 70.65      | A-    |
| TG/2023/009 | ICT1222 | P      | 64.88      | B     |
| TG/2023/009 | ICT1233 | P      | WH         | WH    |
| TG/2023/009 | ICT1233 | T      | 59.50      | B-    |
| TG/2023/009 | ICT1242 | T      | 40.25      | E     |
| TG/2023/009 | ICT1253 | P      | 47.10      | E     |
| TG/2023/009 | ICT1253 | T      | 60.50      | B     |
| TG/2023/009 | TCS1212 | T      | 76.00      | A     |
| TG/2023/009 | TMS1233 | T      | 77.55      | A     |
| TG/2023/010 | ENG1222 | T      | WH         | WH    |
| TG/2023/010 | ICT1212 | T      | 35.00      | E     |
| TG/2023/010 | ICT1222 | P      | 74.40      | A-    |
| TG/2023/010 | ICT1233 | P      | 65.20      | B+    |
| TG/2023/010 | ICT1233 | T      | 77.00      | A     |
| TG/2023/010 | ICT1242 | T      | 73.88      | A-    |
| TG/2023/010 | ICT1253 | P      | 54.30      | E     |
| TG/2023/010 | ICT1253 | T      | WH         | WH    |
| TG/2023/010 | TCS1212 | T      | 67.10      | B+    |
| TG/2023/010 | TMS1233 | T      | 77.03      | A     |
+-------------+---------+--------+------------+-------+