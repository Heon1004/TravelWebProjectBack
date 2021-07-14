package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 {
	public static String getEncrypt(String email) {
		String result = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(email.getBytes());
			byte[] byteDate = md.digest();
			StringBuffer sb = new StringBuffer();
			//
			for (int i = 0; i < byteDate.length; i++) {
				//256bit = 64文字列 
				//bitのlengthをHexに切り替える
				//16進数
				sb.append(Integer.toString((byteDate[i] & 0xFF) + 256, 16).substring(1));
			}
			
			result = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return result;
	}

}
