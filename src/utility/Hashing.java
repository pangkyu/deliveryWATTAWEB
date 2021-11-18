package utility;

import java.security.MessageDigest;

/*
 * restaurant와 customer로 입력되는 비밀번호를 해싱처리하여 입력하는 파일!
 * SHA-256 알고리즘 사용
 */
public class Hashing{
	
	public static String encoding(String pw) {
		String encodeString = "";
		try {
			
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			// MessageDigest 객체에 암호화 하고자 하는 원본문자열을 update() 메소드를 이용하여 전달 
			md.update(pw.getBytes());
			
			byte[] encodeData = md.digest();
			StringBuffer sb = new StringBuffer();
			
			// 암호화된 byte배열을 String 객체로 변환하여 저장
			for(int i = 0; i < encodeData.length; i++) {
				// byte데이터를 16진수 문자열로 변환하여 반환 문자열에 추가(한번 더 암호화)
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