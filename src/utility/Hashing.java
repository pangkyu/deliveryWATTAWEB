package utility;

import java.security.MessageDigest;

/*
 * restaurant�� customer�� �ԷµǴ� ��й�ȣ�� �ؽ�ó���Ͽ� �Է��ϴ� ����!
 * SHA-256 �˰��� ���
 */
public class Hashing{
	
	public static String encoding(String pw) {
		String encodeString = "";
		try {
			
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			// MessageDigest ��ü�� ��ȣȭ �ϰ��� �ϴ� �������ڿ��� update() �޼ҵ带 �̿��Ͽ� ���� 
			md.update(pw.getBytes());
			
			byte[] encodeData = md.digest();
			StringBuffer sb = new StringBuffer();
			
			// ��ȣȭ�� byte�迭�� String ��ü�� ��ȯ�Ͽ� ����
			for(int i = 0; i < encodeData.length; i++) {
				// byte�����͸� 16���� ���ڿ��� ��ȯ�Ͽ� ��ȯ ���ڿ��� �߰�(�ѹ� �� ��ȣȭ)
				sb.append(Integer.toString((encodeData[i]&0xff) + 0x100, 16).substring(1));
			}
			encodeString = sb.toString();
		}catch(Exception e) {
			e.printStackTrace();
			encodeString = null;
		}
		return encodeString;
	}
}