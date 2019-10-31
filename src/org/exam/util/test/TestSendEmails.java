package org.exam.util.test;

import java.util.ArrayList;
import java.util.List;

import org.exam.util.MailUtil;
import org.exam.vo.SendEmailVo;

public class TestSendEmails {
	
	public static void main(String[] args) {
		List<SendEmailVo> vo = new ArrayList<>();
		SendEmailVo vo1= new SendEmailVo("Lynch","lynch.orz@gmail.com");
		SendEmailVo vo2= new SendEmailVo("jql","");
		SendEmailVo vo3= new SendEmailVo("jql","1776990136@qq.com");
		SendEmailVo vo4= new SendEmailVo("jkl","3260167367@qq.com");
		vo.add(vo1);
		vo.add(vo2);
		vo.add(vo3);
		vo.add(vo4);
		MailUtil.sendEmailsWithoutAttachment(vo,false);
	}
}
