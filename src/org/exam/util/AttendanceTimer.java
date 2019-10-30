package org.exam.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.ibatis.io.ResolverUtil.Test;


public class AttendanceTimer {
	public String code; 
	public Date start;
	public Date end;
	
	public AttendanceTimer(Date start , Date end) {
		this.start = start;
		this.end = end;
	}
	
	public void start() throws InterruptedException, ParseException {
		Timer timer = new Timer();
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				code = AttendanceCodeUtil.getCode();
				System.out.println(new Date().toString() + "==>" + code);
				//1.更新缓存中的考勤码<key,value> ===>  <acode+"attendanceId",getCode()>
			}
		}, start, 5000);
		Thread.sleep( (end.getTime() - start.getTime()) );	
		timer.cancel();
		//2.移除缓存中的考勤码
	}
	
//	public static void Test() {
//		MyThread mt1 = new MyThread();
//	}
	
	public static void main(String[] args) throws ParseException, InterruptedException {
		Date start = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse("2019-10-9 22:29:00");
		Date end = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse("2019-10-9 22:30:00");
		AttendanceTimer t1 = new AttendanceTimer(start,end);
		MyThread mt1 = new MyThread(t1);
		mt1.start();
		t1.start();
	}
}
class MyThread extends Thread{
	private AttendanceTimer myTimer;
	public MyThread(AttendanceTimer myTimer) {
		this.myTimer = myTimer;
	}
	@Override
	public void run() {
		while (true) {//截止时间到了没
			System.out.println(myTimer.code);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
