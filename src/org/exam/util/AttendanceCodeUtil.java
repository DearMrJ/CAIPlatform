package org.exam.util;

import java.util.Date;
import java.util.UUID;

public class AttendanceCodeUtil {
	
	private static String acode = null;
	private static final int SHORT_LENGTH = 5;
	
	public static String[] chars = new String[] { "a", "b", "c", "d", "e", "f",
			"g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
			"t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5",
			"6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I",
			"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
			"W", "X", "Y", "Z" };
	
	public static String getCode() {
		StringBuffer shortBuffer = new StringBuffer();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        for (int i = 0; i < SHORT_LENGTH; i++) {
            String str = uuid.substring(i * 4, i * 4 + 4);//截取4位
            int x = Integer.parseInt(str, 16);//radix:16进制
            shortBuffer.append(chars[x % 0x3E]);//0x3E==>62
        }
		return shortBuffer.toString();
	}
	
	public static void main(String[] args) throws InterruptedException {
		Integer target = new Date(2019,10,9,19,45).getMinutes();
		Integer now = new Date().getMinutes();
		while(target - now > 0) {
			now = new Date().getMinutes();
			/*************存入全局域中****************/
			acode = getCode();
			/*************************************/
			System.out.println(acode);
			Thread.sleep(10000);
		}
	}
}
