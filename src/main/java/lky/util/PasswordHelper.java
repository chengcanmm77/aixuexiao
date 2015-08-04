package lky.util;

import lky.entity.User;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class PasswordHelper {
	private static RandomNumberGenerator generator = new SecureRandomNumberGenerator();
	private static String algorithmName = "md5";
	private static final int hashIterations = 2;
	
	public static void encryptPassword(User user){
		user.setSalt(generator.nextBytes().toHex());
		String newPassword = new SimpleHash(algorithmName,user.getPassword(),ByteSource.Util.bytes(user.getCredentialsSalt()),hashIterations).toHex();
		user.setPassword(newPassword);
	}
}
