/**
 * 
 */
package org.exam.util;

import java.util.Calendar;

/**
 * @author Lynch
 *
 */
public class SemesterUtil {
	
	private static int year;
	private static int term;
	private static int month;
	
	public static int getYear() {
		Calendar calendar = Calendar.getInstance();
		year = calendar.get(Calendar.YEAR);
		month = calendar.get(calendar.MONTH);
		if (month < 9) {
			return year-1;
		}else {
			return year;
		}
	}
	
	public static int getTerm() {
		Calendar calendar = Calendar.getInstance();
		month = calendar.get(calendar.MONTH);
		if (month < 9 && month >2) {
			return 2;
		}else {
			return 1;
		}
	}
	
	public static void main(String[] args) {
		System.out.println(getYear()+"-"+(getYear()+1)+" 第 "+getTerm()+" 学期");
	}
	
}
