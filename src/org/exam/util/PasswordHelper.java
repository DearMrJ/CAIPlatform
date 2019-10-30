package org.exam.util;


import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

import org.exam.entity.User;

public class PasswordHelper {
	private static RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
	private static String algorithmName = "md5";
	private static int hashIterations = 2;

	public static void encryptPassword(User user) {
		user.setSalt(randomNumberGenerator.nextBytes().toHex());
		String newPassword = new SimpleHash(algorithmName, user.getPassword(),  ByteSource.Util.bytes(user.getCredentialsSalt()), hashIterations).toHex();
		user.setPassword(newPassword);
	}

	public static String getPassword(User user){
		String encryptPassword = new SimpleHash(algorithmName,user.getPassword(),ByteSource.Util.bytes(user.getCredentialsSalt()),hashIterations).toHex();
		return encryptPassword;
	}

	public static void main(String[] args) {
		User user = new User();
		user.setUsername("spring");
		user.setPassword("spring");
		encryptPassword(user);
		System.out.println(user.getPassword());
		System.out.println(user.getSalt());
	}
}
