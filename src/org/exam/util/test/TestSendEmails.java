package org.exam.util.test;

import java.util.ArrayList;
import java.util.List;

import org.exam.util.MailUtil;

public class TestSendEmails {
	
	public static void main(String[] args) {
		List<String> emails = new ArrayList<String>();
		emails.add("1776990136@qq.com");
		emails.add("lynch.orz@gmail.com");
		emails.add("orz_lynch@163.com");
		emails.add("3260167367@qq.com");
		MailUtil.sendEmailsWithoutAttachment(emails,false);
	}
}
