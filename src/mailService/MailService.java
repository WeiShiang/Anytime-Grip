package mailService;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailService {
	
	// 閮剖��隞�:��靽∩犖��mail靽∠拳,Email銝餅,Email�摰�
	public void sendMail(String to, String subject, String messageText) {
			
	   try {
		// 閮剖�蝙�SSL��蝺 Gmail smtp Server
		   Properties props = new Properties();
		   props.put("mail.smtp.host", "smtp.gmail.com");
		   props.put("mail.smtp.socketFactory.port", "465");
		   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.port", "465");

		// ��身摰� gmail ��董��� & 撖Ⅳ (撠�雿�mail靘�mail)
	       // ����yGmail�����扯����蝔��������
	     final String myGmail = "BA102G3iii@gmail.com";
	     final String myGmail_password = "ba102g3@iii";
		   Session session = Session.getInstance(props, new Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
				   return new PasswordAuthentication(myGmail, myGmail_password);
			   }
		   });

		   Message message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(myGmail));
		   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
		  
		   //閮剖�縑銝剔�蜓�  
		   message.setSubject(subject);
		   //閮剖�縑銝剔�摰� 
		   message.setText(messageText);

		   Transport.send(message);
		   System.out.println("�����!");
     }catch (MessagingException e){
	     System.out.println("��仃���!");
	     e.printStackTrace();
     }
   }
	//皜祈岫����
	 public static void main (String args[]){

	      String to = "chenglin0413@gmail.com";//撠� :"ba102g3iii@gmail.com"
	      
	      String subject = "撖Ⅳ�";
	      
	      String ch_name = "peter1";
	      String passRandom = "321";
	      String messageText = "Hello! " + ch_name + " 隢牲閮迨撖Ⅳ: " + passRandom + "\n" +" (撌脩��)"+"\n 甇支縑隞嗥���隞�"; 
	       
	      MailService mailService = new MailService();
	      mailService.sendMail(to, subject, messageText);

   }


}
