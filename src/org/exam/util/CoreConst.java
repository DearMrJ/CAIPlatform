package org.exam.util;

import javax.mail.Message.RecipientType;
import javax.mail.internet.MimeMessage;

public class CoreConst {
	
	public static final String SITE_DONAME = "localhost:8888";
	
	/******************************数据库表************************************/
	public static final String FACULTY_TABLE = "faculty_inf";
	public static final String CLASSES_TABLE = "class_inf";
	public static final String SUBJECT_TABLE = "subject_inf";
	
	public static final String USER_TABLE = "user_inf";
	public static final String ROLE_TABLE = "role_inf";
	public static final String USER_ROLE_TABLE = "user_role_inf";//角色
	public static final String PERMISSION_TABLE = "permission_inf";//权限
	public static final String ROLE_PERMISSION_TABLE = "role_permission_inf";//角色权限
	public static final String USER_SUBJECT_TABLE = "user_subject_inf";//选课表
	
	public static final String GRADE_TABLE = "grade_inf";//成绩记录
	public static final String QUESTION_TABLE = "question_inf";
	public static final String EXAMINATION_TABLE = "examination_inf";
	public static final String EXAM_QUESTION_TABLE = "exam_question_inf";//exam = n(question)
	
	public static final String ATTENDANCE_TABLE = "attendance_inf";
	public static final String ATTENDANCE_SHEET_TABLE = "attendance_sheet_inf";
	
	public static final String COMMENT_ITEM_TABLE = "comment_item_inf";//评价项表
	public static final String STUDENT_EVALUATION_TABLE = "student_evaluation_inf";
	public static final String TEACHER_EVALUATION_TABLE = "teacher_attendance_inf";
	public static final String EVALUATION_ITEM_TABLE = "evaluation_item_inf";//关联评价项表 evaluation = n(item)
	
	public static final String COMMENT_TABLE = "comment_inf";//评论表、留言表
	/**********************************************************************/

	
	
	
	
	/******************************状态码**********************************/
	public static final Integer SUCCESS_CODE = 200;
	public static final Integer FAIL_CODE = 500;
	public static final Integer STATUS_VALID = 1;
	public static final Integer STATUS_INVALID = 0;
	public static final Integer EXAM_END = 2;
	public static final Integer EXAM_STANDARD = 1;
	public static final Integer EXAM_GOOD = 3;
	public static final Integer EXAM_FINE = 4;
	public static final Integer EXAM_PERFECT = 5;
	public static final Integer PAGE_SIZE = 10;
	public static final String DEFAULT_PASSWORD = "123456";
	public static final String DEFAULT_IMG = "/img/user-default-img.png";
	public static Integer TOP_MENU_ID = 0;
	public static String TOP_MENU_NAME = "顶层菜单";
	/**********************************************************************/
	
	
	
	
	/*********************************Redis********************************/
	public static final String REDIS_HOST = "192.168.66.65";
	public static final String REDIS_PASSWORD = "159753";
	public static final Integer REDIS_PORT = 6379;
	public static final Integer REDIS_TIMEOUT = 0;
	/**********************************************************************/
	
	
	
	
	/*********************邮件发送方式(收件人、抄送、密送)************************/
	public static final RecipientType EMAIL_TO = MimeMessage.RecipientType.TO;
	public static final RecipientType EMAIL_CC = MimeMessage.RecipientType.CC;
	public static final RecipientType EMAIL_BCC = MimeMessage.RecipientType.BCC;
	/*******************************************************************/
	
}
