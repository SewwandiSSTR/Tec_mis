DELIMITER //

CREATE PROCEDURE Create_user(
    IN v_user_id CHAR(12),
    IN v_pwd CHAR(50),
    IN v_role CHAR(30)
)
BEGIN
    -- Use session variables for dynamic SQL
    SET @sql_stmt = '';

    -- 1. Create user if not exists
    SET @sql_stmt = CONCAT(
        'CREATE USER IF NOT EXISTS ''', v_user_id, '''@''localhost'' IDENTIFIED BY ''', v_pwd, ''';'
    );
    PREPARE stmt FROM @sql_stmt;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- 2. Role-based privileges
    IF v_role = 'Student' THEN
        -- Table privileges
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_mid TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_end TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_Attendence TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Final_result TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.GPA TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        -- Procedure privileges
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Medical_mid TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Medical_end TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Final_mark_whole_batch_all_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Final_mark_all_course_a_student TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.attendence_a_student_all_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.attendence_a_student_a_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;

    ELSEIF v_role = 'Admin' THEN
        SET @sql_stmt = CONCAT('GRANT ALL PRIVILEGES ON tec_mis.* TO ''', v_user_id, '''@''localhost'' WITH GRANT OPTION;');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT CREATE USER ON *.* TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;

        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Create_user TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;

    ELSEIF v_role = 'Dean' THEN
        SET @sql_stmt = CONCAT('GRANT ALL PRIVILEGES ON tec_mis.* TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        -- Additional read-only views
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Attendance_Eligibility TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Result_status TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Final_result TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.GPA TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_Non_Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Non_Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;

    ELSEIF v_role = 'Lecturer' THEN
        SET @sql_stmt = CONCAT('GRANT ALL PRIVILEGES ON tec_mis.* TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT CREATE USER ON *.* TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Result_status TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Final_result TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.CA_whole_batch_a_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.CA_a_course_a_student TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;

    ELSEIF v_role = 'TO' THEN
        SET @sql_stmt = CONCAT('GRANT SELECT, INSERT, UPDATE ON tec_mis.Attendence TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT, INSERT, UPDATE ON tec_mis.attendence_handle TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Medical_Non_Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT SELECT ON tec_mis.Non_Eligible_Attendance TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Attendence_a_student_all_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Attendence_a_student_a_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Attendence_whole_batch_a_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        
        SET @sql_stmt = CONCAT('GRANT EXECUTE ON PROCEDURE tec_mis.Attendence_whole_batch_all_course TO ''', v_user_id, '''@''localhost'';');
        PREPARE stmt FROM @sql_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;
    END IF;
END//

DELIMITER ;

-- Lecturers
CALL Create_user('LEC/001', 'Lec1@fot', 'Lecturer');
CALL Create_user('LEC/002', 'Lec2@fot', 'Lecturer');
CALL Create_user('LEC/003', 'Lec2@fot', 'Lecturer');
CALL Create_user('LEC/004', 'Lec2@fot', 'Lecturer');
CALL Create_user('LEC/005', 'Lec2@fot', 'Lecturer');
CALL Create_user('LEC/006', 'Lec2@fot', 'Lecturer');
CALL Create_user('LEC/007', 'Lec2@fot', 'Lecturer');
CALL Create_user('LEC/008', 'Lec2@fot', 'Lecturer');

-- Admin
CALL Create_user('Admin/Fot/01', 'Admin1@fot', 'Admin');

-- TOs
CALL Create_user('Tech/Fot/001', 'Technical1@fot', 'TO');
CALL Create_user('Tech/Fot/002', 'Technical1@fot', 'TO');
CALL Create_user('Tech/Fot/003', 'Technical1@fot', 'TO');
CALL Create_user('Tech/Fot/004', 'Technical1@fot', 'TO');
CALL Create_user('Tech/Fot/005', 'Technical1@fot', 'TO');

-- Students
CALL Create_user('TG/2023/001', 'Stu001@fot', 'Student');
CALL Create_user('TG/2023/002', 'Stu002@fot', 'Student');
CALL Create_user('TG/2023/003', 'Stu003@fot', 'Student');
CALL Create_user('TG/2023/004', 'Stu004@fot', 'Student');
CALL Create_user('TG/2023/005', 'Stu005@fot', 'Student');
CALL Create_user('TG/2023/006', 'Stu006@fot', 'Student');
CALL Create_user('TG/2023/007', 'Stu007@fot', 'Student');
CALL Create_user('TG/2023/008', 'Stu008@fot', 'Student');
CALL Create_user('TG/2023/009', 'Stud009@fot', 'Student');
CALL Create_user('TG/2023/010', 'Stu010@fot', 'Student');
CALL Create_user('TG/2023/011', 'Stu011@fot', 'Student');
CALL Create_user('TG/2022/050', 'Stu050@fot', 'Student');
CALL Create_user('TG/2022/051', 'Stu051@fot', 'Student');
CALL Create_user('TG/2021/023', 'Stu023@fot', 'Student');
CALL Create_user('TG/2021/088', 'Stu088@fot', 'Student');
CALL Create_user('TG/2021/081', 'Stu081@fot', 'Student');
CALL Create_user('TG/2020/100', 'Stu100@fot', 'Student');
CALL Create_user('TG/2020/010', 'Stud010@fot', 'Student');
CALL Create_user('TG/2021/006', 'Stud006@fot', 'Student');

-- Dean
CALL Create_user('Dean/Fot/001', 'Dean1@fot', 'Dean');

-- Flush privileges after all calls
FLUSH PRIVILEGES;