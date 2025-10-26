-- Final Result

CREATE OR REPLACE VIEW Final_result AS
WITH Calculation_CTE AS (
    SELECT
        RS.Regno,
        RS.C_code,
        RS.C_type,
        S.S_type,
        
        -- Status Fields from Result_status
        RS.CA AS CA_Mark_Display, 
        RS.End_mark AS End_Mark_Display, 
        RS.CA_Status, 
        RS.End_Status, 
        
        -- CA Contribution: (Scaled CA mark * Weight)
        CASE 
            WHEN RS.CA_Status = 'Pass' AND RS.C_type = 'T' THEN CAST(RS.CA AS DECIMAL(10,2)) * 0.30
            WHEN RS.CA_Status = 'Pass' AND RS.C_type = 'P' THEN CAST(RS.CA AS DECIMAL(10,2)) * 0.40
            ELSE 0.00 
        END AS CA_Contribution,

        -- End Contribution: (End Mark * Weight)
        CASE 
            WHEN RS.End_Status = 'Pass' AND RS.C_type = 'T' THEN CAST(RS.End_mark AS DECIMAL(10,2)) * 0.70
            WHEN RS.End_Status = 'Pass' AND RS.C_type = 'P' THEN CAST(RS.End_mark AS DECIMAL(10,2)) * 0.60
            ELSE 0.00 
        END AS End_Contribution
        
    FROM 
        Result_status RS 
    INNER JOIN Student S 
        ON RS.Regno = S.Reg_no -- Using S.Reg_no to match the Student table PRIMARY KEY
),

-- CTE to Calculate Final Total Mark
Final_Total AS (
    SELECT
        C.*,
        
        -- Calculate the Numeric Total Mark
        CASE 
            -- Total mark is NULL if status is WH, MC, or NE
            WHEN C.End_Status IN ('NE', 'MC') OR C.CA_Mark_Display = 'MC' THEN NULL 
            
            -- Otherwise, sum the component contributions (even if they are 0 due to failure)
            ELSE C.CA_Contribution + C.End_Contribution
        END AS Final_Total_Mark
        
    FROM Calculation_CTE C
)

-- Final SELECT to determine final mark and grade.
SELECT 
    FT.Regno,
    FT.C_code,
    FT.C_type,
    
    -- Final Display Mark Logic
    CASE 
        -- Priority 1: Overriding Status Checks (Suspending/MC/NE results in 'WH')
        WHEN FT.S_type = 'Suspend' THEN 'WH' 
        WHEN FT.End_Status IN ( 'MC' , 'NE') OR FT.CA_Mark_Display = 'MC' THEN 'WH' 
        
        -- Priority 2: Use the Numeric Total Mark
        WHEN FT.Final_Total_Mark IS NOT NULL THEN CAST(ROUND(FT.Final_Total_Mark, 2) AS CHAR(10))
        ELSE 'N/A' 
    END AS Final_Mark, 
    
    -- Final Grade Logic
    CASE 
        -- Priority 1: Status checks that result in non-grade codes
        WHEN FT.S_type = 'Suspend' THEN 'WH' 
        WHEN FT.End_Status IN ( 'MC' , 'NE') OR FT.CA_Mark_Display = 'MC' THEN 'WH'
        
        -- Priority 2: Automatic Failure (E) for component failure
        WHEN FT.CA_Status = 'Fail' OR FT.End_Status = 'Fail' THEN 'E'
        
        -- Priority 3: Grading logic based on final score
        WHEN FT.S_type IN ('Proper', 'Repeat') AND FT.Final_Total_Mark IS NOT NULL THEN
            CASE
                WHEN FT.Final_Total_Mark >= 85 THEN 'A+'
                WHEN FT.Final_Total_Mark >= 75 THEN 'A'
                WHEN FT.Final_Total_Mark >= 70 THEN 'A-'
                WHEN FT.Final_Total_Mark >= 65 THEN 'B+'
                WHEN FT.Final_Total_Mark >= 60 THEN 'B'
                WHEN FT.Final_Total_Mark >= 55 THEN 'B-'
                WHEN FT.Final_Total_Mark >= 50 THEN 'C+'
                WHEN FT.Final_Total_Mark >= 45 THEN 'C'
                WHEN FT.Final_Total_Mark >= 40 THEN 'C-'
                WHEN FT.Final_Total_Mark >= 35 THEN 'D'
                ELSE 'E' 
            END
            
        -- Remaining scenarios
        ELSE 'F' 
    END AS Grade

FROM 
    Final_Total FT;

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