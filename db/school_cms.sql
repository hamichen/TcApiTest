-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主機: mysql
-- 產生時間： 2018 年 10 月 16 日 06:49
-- 伺服器版本: 5.7.22
-- PHP 版本： 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `school_cms`
--

-- --------------------------------------------------------

--
-- 資料表結構 `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` longtext COLLATE utf8_unicode_ci,
  `is_display` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `layout` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memo` longtext COLLATE utf8_unicode_ci COMMENT '說明',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '標題',
  `content` longtext COLLATE utf8_unicode_ci COMMENT '內容',
  `create_time` datetime DEFAULT NULL COMMENT '建立時間',
  `update_time` datetime DEFAULT NULL COMMENT '更新時間',
  `hits` int(11) DEFAULT NULL COMMENT '瀏覽數',
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '連結',
  `tags` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '標籤',
  `term` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件分類',
  `kind` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件類別',
  `url_target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '連結開啟方式',
  `order_id` int(11) DEFAULT NULL COMMENT '自訂排序',
  `link_menu` int(11) DEFAULT NULL COMMENT '連結到選單',
  `summary` longtext COLLATE utf8_unicode_ci COMMENT '摘要',
  `is_published` int(11) DEFAULT NULL COMMENT '是否發布',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `page_file`
--

CREATE TABLE `page_file` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `file_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_ext` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` double DEFAULT NULL,
  `source_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `page_has_page_tag`
--

CREATE TABLE `page_has_page_tag` (
  `page_id` int(11) NOT NULL,
  `page_tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `page_tag`
--

CREATE TABLE `page_tag` (
  `id` int(11) NOT NULL,
  `tag_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `privilege`
--

CREATE TABLE `privilege` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `controller` varchar(200) DEFAULT NULL,
  `action` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='權限';

-- --------------------------------------------------------

--
-- 資料表結構 `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT '顯示名稱',
  `resource_name` varchar(45) NOT NULL COMMENT '資源名稱',
  `is_active` int(2) DEFAULT NULL COMMENT '是否啟用',
  `version` varchar(45) DEFAULT NULL COMMENT '版本',
  `author` varchar(45) DEFAULT NULL COMMENT '作者',
  `icon` varchar(45) DEFAULT NULL COMMENT '圖示',
  `memo` text COMMENT '備註',
  `create_time` datetime DEFAULT NULL COMMENT '建立時間',
  `resource_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='資源名稱';

-- --------------------------------------------------------

--
-- 資料表結構 `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL COMMENT '角色名稱',
  `kind` varchar(45) DEFAULT NULL COMMENT '類別',
  `deep` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- --------------------------------------------------------

--
-- 資料表結構 `role_inherit`
--

CREATE TABLE `role_inherit` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `school_office`
--

CREATE TABLE `school_office` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT '單位名稱',
  `rank` int(11) DEFAULT NULL COMMENT '排序',
  `office_phone` varchar(45) DEFAULT NULL COMMENT '單位電話',
  `office_phone_ext` varchar(45) DEFAULT NULL COMMENT '分機',
  `office_url` varchar(100) DEFAULT NULL COMMENT '網址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='處室';

-- --------------------------------------------------------

--
-- 資料表結構 `semester`
--

CREATE TABLE `semester` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL COMMENT '學年度',
  `semester` int(2) NOT NULL COMMENT '學期',
  `begin_date` date DEFAULT NULL COMMENT '學期開始日',
  `end_date` date DEFAULT NULL COMMENT '學期結束日',
  `update_time` datetime DEFAULT NULL COMMENT '更新時間',
  `semester_start_date` date DEFAULT NULL COMMENT '開學日',
  `semester_end_date` date DEFAULT NULL COMMENT '結業日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='學期';

-- --------------------------------------------------------

--
-- 資料表結構 `semester_class`
--

CREATE TABLE `semester_class` (
  `id` int(11) NOT NULL,
  `grade` int(4) DEFAULT NULL COMMENT '年級',
  `class_name` varchar(45) DEFAULT NULL COMMENT '班名',
  `class_no` int(4) DEFAULT NULL COMMENT '班序',
  `semester_id` int(11) NOT NULL,
  `tutor` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班級';

-- --------------------------------------------------------

--
-- 資料表結構 `semester_class_has_teacher`
--

CREATE TABLE `semester_class_has_teacher` (
  `semester_class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `semester_student`
--

CREATE TABLE `semester_student` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `semester_class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `semester_teacher`
--

CREATE TABLE `semester_teacher` (
  `id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `teacher_title_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT '姓名',
  `edu_key` varchar(65) NOT NULL COMMENT '身分證hashkey',
  `stud_no` varchar(45) DEFAULT NULL COMMENT '學號',
  `sex` varchar(6) DEFAULT NULL COMMENT '性別',
  `update_time` datetime DEFAULT NULL COMMENT '更新時間',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='學生';

-- --------------------------------------------------------

--
-- 資料表結構 `sync_log`
--

CREATE TABLE `sync_log` (
  `id` int(11) NOT NULL,
  `sync_state` int(11) DEFAULT NULL,
  `data_update_time` datetime DEFAULT NULL COMMENT '遠端資料時間',
  `update_time` datetime DEFAULT NULL COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步記錄';

-- --------------------------------------------------------

--
-- 資料表結構 `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT '姓名',
  `edu_key` varchar(65) NOT NULL COMMENT '身分證hashkey',
  `sex` varchar(6) DEFAULT NULL COMMENT '性別',
  `update_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教師';

-- --------------------------------------------------------

--
-- 資料表結構 `teacher_course`
--

CREATE TABLE `teacher_course` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(45) DEFAULT NULL COMMENT '科目',
  `section_number` int(11) DEFAULT NULL COMMENT '節數',
  `semester_teacher_id` int(11) NOT NULL,
  `semester_class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教師任課資料';

-- --------------------------------------------------------

--
-- 資料表結構 `teacher_title`
--

CREATE TABLE `teacher_title` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `school_office_id` int(11) NOT NULL,
  `title_kind` varchar(45) DEFAULT NULL COMMENT '職別',
  `rank` int(11) DEFAULT NULL COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT '使用者帳號',
  `level` int(1) DEFAULT NULL COMMENT '使用者權限',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `job_title` varchar(50) DEFAULT NULL COMMENT '職稱',
  `password` varchar(128) DEFAULT NULL COMMENT '密碼',
  `mr_unit_id` int(11) DEFAULT NULL COMMENT '單位代號',
  `email` varchar(45) DEFAULT NULL COMMENT '電子郵件',
  `phone` varchar(45) DEFAULT NULL COMMENT '電話',
  `mobile` varchar(45) DEFAULT NULL COMMENT '手機',
  `display_name` varchar(45) DEFAULT NULL COMMENT '顯示名稱',
  `role` varchar(45) DEFAULT NULL COMMENT '角色',
  `phone_ext` varchar(45) DEFAULT NULL COMMENT '分機',
  `is_active` int(2) DEFAULT NULL COMMENT '是否在職',
  `mail_verify` varchar(45) DEFAULT NULL COMMENT 'email 驗證',
  `remote_username` varchar(100) DEFAULT NULL COMMENT '遠端登入username'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='使用者' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 資料表結構 `user_has_role`
--

CREATE TABLE `user_has_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_menu_menu1_idx` (`parent_id`),
  ADD KEY `fk_menu_user1_idx` (`user_id`);

--
-- 資料表索引 `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_page_menu1_idx` (`menu_id`),
  ADD KEY `fk_page_user1_idx` (`user_id`);

--
-- 資料表索引 `page_file`
--
ALTER TABLE `page_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_page_file_page1_idx` (`page_id`);

--
-- 資料表索引 `page_has_page_tag`
--
ALTER TABLE `page_has_page_tag`
  ADD PRIMARY KEY (`page_id`,`page_tag_id`),
  ADD KEY `fk_page_has_page_tag_page_tag1_idx` (`page_tag_id`),
  ADD KEY `fk_page_has_page_tag_page1_idx` (`page_id`);

--
-- 資料表索引 `page_tag`
--
ALTER TABLE `page_tag`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_privilege_role1_idx` (`role_id`),
  ADD KEY `fk_privilege_resource1_idx` (`resource_id`);

--
-- 資料表索引 `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_resource_resource1_idx` (`resource_id`);

--
-- 資料表索引 `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `role_inherit`
--
ALTER TABLE `role_inherit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_role_has_role_role2_idx` (`parent_id`),
  ADD KEY `fk_role_has_role_role1_idx` (`role_id`);

--
-- 資料表索引 `school_office`
--
ALTER TABLE `school_office`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `semester_class`
--
ALTER TABLE `semester_class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_school_class_semester1_idx` (`semester_id`);

--
-- 資料表索引 `semester_class_has_teacher`
--
ALTER TABLE `semester_class_has_teacher`
  ADD PRIMARY KEY (`semester_class_id`,`teacher_id`),
  ADD KEY `fk_semester_class_has_teacher_teacher1_idx` (`teacher_id`),
  ADD KEY `fk_semester_class_has_teacher_semester_class1_idx` (`semester_class_id`);

--
-- 資料表索引 `semester_student`
--
ALTER TABLE `semester_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_semester_student_student1_idx` (`student_id`),
  ADD KEY `fk_semester_student_semester_class1_idx` (`semester_class_id`);

--
-- 資料表索引 `semester_teacher`
--
ALTER TABLE `semester_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_semester_teacher_semester1_idx` (`semester_id`),
  ADD KEY `fk_semester_teacher_teacher1_idx` (`teacher_id`),
  ADD KEY `fk_semester_teacher_teacher_title1_idx` (`teacher_title_id`);

--
-- 資料表索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_user1_idx` (`user_id`);

--
-- 資料表索引 `sync_log`
--
ALTER TABLE `sync_log`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_teacher_user1_idx` (`user_id`);

--
-- 資料表索引 `teacher_course`
--
ALTER TABLE `teacher_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_teacher_course_semester_teacher1_idx` (`semester_teacher_id`),
  ADD KEY `fk_teacher_course_semester_class1_idx` (`semester_class_id`);

--
-- 資料表索引 `teacher_title`
--
ALTER TABLE `teacher_title`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_teacher_title_school_office1_idx` (`school_office_id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_has_role`
--
ALTER TABLE `user_has_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `fk_user_has_role_role1_idx` (`role_id`),
  ADD KEY `fk_user_has_role_user1_idx` (`user_id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表 AUTO_INCREMENT `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表 AUTO_INCREMENT `page_file`
--
ALTER TABLE `page_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表 AUTO_INCREMENT `page_tag`
--
ALTER TABLE `page_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `privilege`
--
ALTER TABLE `privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `role_inherit`
--
ALTER TABLE `role_inherit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `school_office`
--
ALTER TABLE `school_office`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `semester`
--
ALTER TABLE `semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `semester_class`
--
ALTER TABLE `semester_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `semester_student`
--
ALTER TABLE `semester_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `semester_teacher`
--
ALTER TABLE `semester_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `sync_log`
--
ALTER TABLE `sync_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `teacher_course`
--
ALTER TABLE `teacher_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `teacher_title`
--
ALTER TABLE `teacher_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_7D053A93727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `fk_menu_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `page`
--
ALTER TABLE `page`
  ADD CONSTRAINT `fk_page_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_page_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `page_file`
--
ALTER TABLE `page_file`
  ADD CONSTRAINT `fk_page_file_page1` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `page_has_page_tag`
--
ALTER TABLE `page_has_page_tag`
  ADD CONSTRAINT `fk_page_has_page_tag_page1` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_page_has_page_tag_page_tag1` FOREIGN KEY (`page_tag_id`) REFERENCES `page_tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `privilege`
--
ALTER TABLE `privilege`
  ADD CONSTRAINT `fk_privilege_resource1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_privilege_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `fk_resource_resource1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `role_inherit`
--
ALTER TABLE `role_inherit`
  ADD CONSTRAINT `fk_role_has_role_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_role_has_role_role2` FOREIGN KEY (`parent_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `semester_class`
--
ALTER TABLE `semester_class`
  ADD CONSTRAINT `fk_school_class_semester1` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `semester_class_has_teacher`
--
ALTER TABLE `semester_class_has_teacher`
  ADD CONSTRAINT `fk_semester_class_has_teacher_semester_class1` FOREIGN KEY (`semester_class_id`) REFERENCES `semester_class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_semester_class_has_teacher_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `semester_student`
--
ALTER TABLE `semester_student`
  ADD CONSTRAINT `fk_semester_student_semester_class1` FOREIGN KEY (`semester_class_id`) REFERENCES `semester_class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_semester_student_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `semester_teacher`
--
ALTER TABLE `semester_teacher`
  ADD CONSTRAINT `fk_semester_teacher_semester1` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_semester_teacher_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_semester_teacher_teacher_title1` FOREIGN KEY (`teacher_title_id`) REFERENCES `teacher_title` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `fk_teacher_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `teacher_course`
--
ALTER TABLE `teacher_course`
  ADD CONSTRAINT `fk_teacher_course_semester_class1` FOREIGN KEY (`semester_class_id`) REFERENCES `semester_class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_teacher_course_semester_teacher1` FOREIGN KEY (`semester_teacher_id`) REFERENCES `semester_teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `teacher_title`
--
ALTER TABLE `teacher_title`
  ADD CONSTRAINT `fk_teacher_title_school_office1` FOREIGN KEY (`school_office_id`) REFERENCES `school_office` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `user_has_role`
--
ALTER TABLE `user_has_role`
  ADD CONSTRAINT `fk_user_has_role_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_role_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
