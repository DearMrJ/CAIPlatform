package org.exam.util;

import java.util.UUID;

public class UUIDUtil {
	private static final int SHORT_LENGTH = 8;
	public static String[] chars = new String[] { "a", "b", "c", "d", "e", "f",
			"g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
			"t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5",
			"6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I",
			"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
			"W", "X", "Y", "Z" };
	
	
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	public static String getUniqueIdByUUID() {
		//最大支持1-9个集群机器部署
        int machineId = 1;
        int hashCodeV = UUID.randomUUID().toString().hashCode();
        if(hashCodeV < 0) {
            hashCodeV = - hashCodeV;
        }
        // 0 代表前面补充0
        // 4 代表长度为4
        // d 代表参数为正数型
        return machineId + String.format("%015d", hashCodeV);  // 1+15 = 16
	}
	


    public static String generateShortUUID() {
        StringBuffer shortBuffer = new StringBuffer();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        for (int i = 0; i < SHORT_LENGTH; i++) {
            String str = uuid.substring(i * 4, i * 4 + 4);//截取4位
            int x = Integer.parseInt(str, 16);//radix:16进制
            shortBuffer.append(chars[x % 0x3E]);//0x3E==>62
        }
        return shortBuffer.toString();

    }
    
    public static void main(String[] args) {
    	System.out.println(uuid());
        System.out.println(getUniqueIdByUUID());
        System.out.println(generateShortUUID());
    }


}
