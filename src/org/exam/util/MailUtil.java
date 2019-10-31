package org.exam.util;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.exam.entity.User;
import org.exam.vo.SendEmailVo;

/**
 * JavaMail包中用于处理电子邮件的核心类是：Session，Message，Address，Authenticator，Store，Transport， Folder等。
 * Session定义了一个基本的邮件会话，它需要从Properties中读取类似于邮件服务器，用户名和密码等信息。
 * @author Lynch
 */
public class MailUtil {
	
	/**
	 * 团体email(List<String>)(true带图片，false只包含文字)(无附件)
	 * @param emails
	 */
	public static void sendEmailsWithoutAttachment(List<SendEmailVo> vo,boolean withPicture) {
		try {
			Session ssession = Session.getInstance(createProperty());//
			ssession.setDebug(true);// 开启日志，打印程序详细执行过程
			Transport transport = ssession.getTransport();// 建立连接对象
			// 创建邮件,并且发送给当前有考试任务的用户
			for (int i = 0; i < vo.size(); i++) {
				if (vo.get(i).getEmail()!=null && !vo.get(i).getEmail().equals("")) {
					try {
						MimeMessage message = createMimeMessage(ssession, "285692983@qq.com",vo.get(i).getUsername(), vo.get(i).getEmail(),withPicture);
						/**当QQ被冻结过，或者其他什么异常，要重新获得授权码。 QAQ西湖的水 我的泪***/
						transport.connect("285692983@qq.com", "lesrgwukagvrcafe");//建立连接，其中密码以“授权码”的形式体现
						transport.sendMessage(message, message.getAllRecipients());
						transport.close();
					} catch (MessagingException e) {
						System.out.println("*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*");
						System.out.println("  [温馨提示]:邮件出大问题了！");
						System.out.println("  常见缘由如下：↓↓↓↓↓↓↓↓↓↓↓↓↓↓");
						System.out.println("  1)你网断了炸了上天了;");
						System.out.println("  2)各种缘由导致授权码过期;");
						System.out.println("  3)邮件格式错了沙雕！ ["+vo.get(i).getUsername()+"==>"+vo.get(i).getEmail()+"]");
						System.out.println("*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*");
					} 
				}
			}
		}catch (Exception e) {
			System.out.println("*-*-*-*-*-*-*-*-*-*-*-*-*");
			System.out.println("  [温馨提示]:劳资发不出去了！ ");
			System.out.println("*-*-*-*-*-*-*-*-*-*-*-*-*");
			/***do something***/
		}finally {
			/***do something***/
		}
	}
	
	/**
	 * 团体email(List<String>)(true带图片，false只包含文字)(含附件)
	 * @param emails
	 */
	public static void sendEmailsWithAttachment(List<String> emails,boolean withPicture) {
		try {
			Session ssession = Session.getInstance(createProperty());//
//			ssession.setDebug(true);// 开启日志，打印程序详细执行过程
			Transport transport = ssession.getTransport();// 建立连接对象
			// 创建邮件,并且发送给当前有考试任务的用户
			for (int i = 0; i < emails.size(); i++) {
				MimeMessage message = createMimeMessage(ssession, "285692983@qq.com",null, emails.get(i),withPicture);
				/**当QQ被冻结过，或者其他什么异常，要重新获得授权码。 QAQ西湖的水 我的泪***/
				transport.connect("285692983@qq.com", "pgjszvjgktddbgdd");//建立连接，其中密码以“授权码”的形式体现
				transport.sendMessage(message, message.getAllRecipients());
				transport.close();
			}
		} catch (MessagingException e) {
			System.out.println("┌───────────────────────┐");
			System.out.println("│[温馨提示]:沙雕，你邮件输错了 ！	│");
			System.out.println("└───────────────────────┘");
			/***do something***/
		}catch (Exception e) {
			System.out.println("┌───────────────────┐");
			System.out.println("│[温馨提示]:劳资发不出去了！│");
			System.out.println("└───────────────────┘");
			/***do something***/
		}finally {
			/***do something***/
		}
	}
	
	/**
	 * 发送操作,单体
	 * @param user
	 */
	public static void sendMail(User user) {
		/**    科普时间，此javax.mail.Session非彼javax.servlet.http.HttpSession
		 * javax.mail.Session类用于定义整个JavaMail应用程序所需要的环境信息，以及收集客户端与邮件服务器
		 *建立网络连接的会话信息。例如邮件服务器的主机名、端口号、采用的邮件发送和接收协议等。
		 *同时Session对象根据这些信息构建用于邮件收发的Transport和Store对象，以及为客户端创建Message对象时提供信息支持。
		 */
		try {
			Session ssession = Session.getInstance(createProperty());//
			ssession.setDebug(true);// 开启日志，打印程序详细执行过程
			// 创建邮件,并且发送给当前修改密码的用户
			MimeMessage message = createMimeMessage(ssession, "285692983@qq.com",user.getUsername(), user.getEmail(),false);
			Transport transport = ssession.getTransport();// 建立连接对象
			/**当QQ被冻结过，或者其他什么异常，要重新获得授权码。 QAQ西湖的水 我的泪***/
			transport.connect("285692983@qq.com", "pgjszvjgktddbgdd");//建立连接，其中密码以“授权码”的形式体现
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (MessagingException e) {
			System.out.println("┌───────────────────────────────┐");
			System.out.println("│[温馨提示]:沙雕用户注册的时候把邮件输错了 ！	│");
			System.out.println("└───────────────────────────────┘");
			/***do something***/
		}catch (Exception e) {
			System.out.println("┌───────────────────┐");
			System.out.println("│[温馨提示]:劳资发不出去了！│");
			System.out.println("└───────────────────┘");
			/***do something***/
		}finally {
			/***do something***/
		}
	}
	/**
	 * properties部分
	 * @return
	 */
	public static Properties createProperty(){
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp"); //协议
		props.setProperty("mail.smtp.host", "smtp.qq.com"); //地址
		props.setProperty("mail.smtp.port", "465"); //端口
		props.setProperty("mail.smtp", "true"); //验证
		//如果是163邮箱的话 上面的就已经可以了  但是qq邮箱还需要进行SSL验证
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.socketFactory.port", "465");
		return props;
	}

	/**
	 * 邮件信息体部分(true带图片，false只包含文字)(无附件)
	 * @param session
	 * @param sender
	 * @param username
	 * @param receiver
	 * @return
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 * @throws FileNotFoundException
	 */
	public static MimeMessage createMimeMessage(Session session, String sender, 
			String username,String receiver,boolean flag) {
		try {
			MimeMessage message = new MimeMessage(session);
			// 邮件：标题、正文、收件人 、发件人{附件、图片。。}
			Address address = new InternetAddress(sender, "Lynch", "utf-8");
			message.setSubject("考试通知邮件", "utf-8");//邮件主题
			message.setFrom(address);//装入发送方信息
			
			if (flag == true) {
				/**************************************************************/
				//1.创建图片结点
				MimeBodyPart imagePart = new MimeBodyPart();
				/**
				 * 1.此处填写src/cool.png时候，
				 * 在UserController中的 reset 方法 测试不通过，控制台报FileNotFoundException
				 * 但是在UserController同一个目录下的测试TestSendMail通过。
				 * 2.填写硬盘上的绝对路径时候
				 * UserController和同目录下的TestSendMail都通过
				 */
				DataSource file = new FileDataSource("D:/study/zimg/test-email.jpg");
				DataHandler imageDataHandler = new DataHandler(file);// 图片地址
				imagePart.setDataHandler(imageDataHandler);
				imagePart.setContentID("cool");
				//2.创建文本节点（图片的显示在HTML的body需要用到 语句 和 编码）
				MimeBodyPart textPart = new MimeBodyPart();
				//邮件主体内容
				textPart.setContent("亲爱的"+username+"你好，近期有您的新的考试安排，请登录45辅教系统查看详情。<a href='"+CoreConst.SITE_DONAME+"'>【上车，考试去】</a><br/><img src='cid:cool'/>", "text/html;charset=utf-8");
				
				//3.用复合结点将 文本节点、 图片结点 封装结合
				MimeMultipart text_image = new MimeMultipart();
				text_image.addBodyPart(textPart);
				text_image.addBodyPart(imagePart);
				text_image.setSubType("related");//关联关系
				
				// 注意：正文中 只能出现 普通结点MimeBodyPart ，不能出现 复合结点MimeMultipart
				//4.MimeMultipart --> MimeBodyPart
				//4.图片+文本==>复合结点---->根据要求（正文中只能出现普通结点） 变成普通结点
				MimeBodyPart text_image_body = new MimeBodyPart();
				text_image_body.setContent(text_image);
				
				//5.虽然正文中只能出现MimeBodyPart，但最终还是要实现整个邮件还是要MimeMultipart（尽管没有附件！！！！！！！！！！！）
				MimeMultipart mailInfo = new MimeMultipart();
				mailInfo.addBodyPart(text_image_body);
				mailInfo.setSubType("mixed");
				//6.最后装入message
				message.setContent(mailInfo,"text/html;charset=utf-8");
				/**************************************************************/
			}else {
				//邮件主体内容
				message.setContent("亲爱的"+username+"你好，近期有您的新的考试安排，请登录45辅教系统查看详情。<br/><a href='"+CoreConst.SITE_DONAME+"'>【快上车，考试去】</a>", "text/html;charset=utf-8");
			}
			
			// 收件人类型： 普通收件人TO、抄送CC、密送BCC
			//只能有一个普通收件人TO，多个不报错但收不到邮件
			message.setRecipient(MimeMessage.RecipientType.BCC, new InternetAddress(receiver, "你算哪块小饼干", "utf-8"));
			message.setSentDate(new Date());// 发送时间
			message.saveChanges();// 保存邮件
			return message;
		} catch (MessagingException e) {
			System.out.println("---创建邮件异常---");
			return null;
		}catch (UnsupportedEncodingException e) {
			System.out.println("---编码类型异常---");
			return null;
		}catch (Exception e) {
			return null;
		}
	}
	
	
	/**
	 * 邮件信息体部分(true带图片，false只包含文字)(无附件)(可选发送方式)
	 * @param session
	 * @param sender
	 * @param username
	 * @param receiver
	 * @param flag	是否带图片
	 * @param type	发送方式（收件人、抄送、密送）
	 * @return
	 */
	public static MimeMessage createMimeMessage(Session session, String sender, 
			String username,String receiver,boolean flag,RecipientType type) {
		try {
			MimeMessage message = new MimeMessage(session);
			// 邮件：标题、正文、收件人 、发件人{附件、图片。。}
			Address address = new InternetAddress(sender, "Lynch", "utf-8");
			message.setSubject("考试通知邮件", "utf-8");//邮件主题
			message.setFrom(address);//装入发送方信息
			
			if (flag == true) {
				/**************************************************************/
				//1.创建图片结点
				MimeBodyPart imagePart = new MimeBodyPart();
				/**
				 * 1.此处填写src/cool.png时候，
				 * 在UserController中的 reset 方法 测试不通过，控制台报FileNotFoundException
				 * 但是在UserController同一个目录下的测试TestSendMail通过。
				 * 2.填写硬盘上的绝对路径时候
				 * UserController和同目录下的TestSendMail都通过
				 */
				DataSource file = new FileDataSource("D:/study/zimg/test-email.jpg");
				DataHandler imageDataHandler = new DataHandler(file);// 图片地址
				imagePart.setDataHandler(imageDataHandler);
				imagePart.setContentID("cool");
				//2.创建文本节点（图片的显示在HTML的body需要用到 语句 和 编码）
				MimeBodyPart textPart = new MimeBodyPart();
				//邮件主体内容
				textPart.setContent("亲爱的"+username+"你好，近期有您的考试安排，请登录xx系统查看详情。<br/><img src='cid:cool'/>", "text/html;charset=utf-8");
				
				//3.用复合结点将 文本节点、 图片结点 封装结合
				MimeMultipart text_image = new MimeMultipart();
				text_image.addBodyPart(textPart);
				text_image.addBodyPart(imagePart);
				text_image.setSubType("related");//关联关系
				
				// 注意：正文中 只能出现 普通结点MimeBodyPart ，不能出现 复合结点MimeMultipart
				//4.MimeMultipart --> MimeBodyPart
				//4.图片+文本==>复合结点---->根据要求（正文中只能出现普通结点） 变成普通结点
				MimeBodyPart text_image_body = new MimeBodyPart();
				text_image_body.setContent(text_image);
				
				//5.虽然正文中只能出现MimeBodyPart，但最终还是要实现整个邮件还是要MimeMultipart（尽管没有附件！！！！！！！！！！！）
				MimeMultipart mailInfo = new MimeMultipart();
				mailInfo.addBodyPart(text_image_body);
				mailInfo.setSubType("mixed");
				//6.最后装入message
				message.setContent(mailInfo,"text/html;charset=utf-8");
				/**************************************************************/
			}else {
				//邮件主体内容
				message.setContent("亲爱的"+username+"你好，近期有关于您的新的考试安排，请登录45辅教系统查看详情。<a href='localhost:8888'>上车，考试去</a>", "text/html;charset=utf-8");
			}
			
			// 收件人类型： 普通收件人TO、抄送CC、密送BCC
			//只能有一个普通收件人TO，多个不报错但收不到邮件
			message.setRecipient(type, new InternetAddress(receiver, "你算哪块小饼干", "utf-8"));
			message.setSentDate(new Date());// 发送时间
			message.saveChanges();// 保存邮件
			return message;
		} catch (MessagingException e) {
			System.out.println("---创建邮件异常---");
			return null;
		}catch (UnsupportedEncodingException e) {
			System.out.println("---编码类型异常---");
			return null;
		}catch (Exception e) {
			return null;
		}
	}
}
