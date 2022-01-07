package bookmall.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	
	// 매개변수 : 발신자, 수신자, 제목, 내용
	// 메일 보내기 성공 1 리턴,   실패시 0 리턴
	public static int sendMail(String to, String subject, String content) {
		try {
			// 메일서버 정보 설정
			Properties prop = System.getProperties();
			prop.put("mail.smtp.host", "smtp.gmail.com"); //호스트, 메일서버
			prop.put("mail.smtp.port", "465"); //포트번호
			prop.put("mail.smtp.auth", "true"); //인증
			prop.put("mail.smtp.ssl.enable", "true");
			prop.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 에러나는 경우 TLS버전
			
			// 세션객체 생성
			Session session = Session.getDefaultInstance(prop, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("projecthong9212", "1q2w3e4r!@");
				}
			});
			session.setDebug(true);
			
			// MimeMessage 객체 생성
			MimeMessage mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress("ptojecthong9212@gmail.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			mimeMessage.setSubject(subject);
			mimeMessage.setText(content);
			//text로 발송
			//mimeMessage.setText(content);
			//html로 발송
			mimeMessage.setContent(content, "text/html; charset=utf-8");
			
			// 메일 전송
			Transport.send(mimeMessage);
			return 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}
//  6자리( 문자3+ 숫자3)암호 랜덤 생성
	public static String random() {
		String tempPwd = "";
		for (int i=0; i<3; i++) {
			tempPwd += (char)((Math.random()*26)+65);
		}
		for (int i=0; i<3; i++) {
			tempPwd += (int)((Math.random()*9));
		}
		return tempPwd;
	}
	
	
	
	// 메일보내기 테스트 메인메서드
	public static void main(String[] args) {
		// 임시비밀번호 : 문자3자 + 숫자3
		// abc123
		String tempPwd = "";
		for (int i=0; i<3; i++) {
			tempPwd += (char)((Math.random()*26)+65);
		}
		for (int i=0; i<3; i++) {
			tempPwd += (int)((Math.random()*9));
		}
		System.out.println(tempPwd);
		//sendMail("ptojecthong9212@gmail.com", "uwangkai@naver.com","임시비밀번호" ,"임시비밀번호는 <span style='color:red;'> "+tempPwd+"</span>입니다.");
	}
}
