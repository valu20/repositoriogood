/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Modelo.Email;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class Mailer {
	private final Properties properties = new Properties();
	
	private String password;
 
	private Session session;
 
	private void init() {
 
		properties.put("mail.smtp.host", "mail.gmail.com");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.port",25);
		properties.put("mail.smtp.mail.sender","emisor@gmail.com");
		properties.put("mail.smtp.user", "usuario");
		properties.put("mail.smtp.auth", "true");
 
		session = Session.getDefaultInstance(properties);
	}
 
	public void  sendEmail(String correo, String contraseña){
 
		init();
		try{
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress((String)properties.get("goodlife2020sistema@gmail.com")));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
			message.setSubject("Regitro en Good Life");
			message.setText("Se le acaba de registar en Good Life su usuario es:"+(correo)+" y su contraseña es:"+(contraseña));
			Transport t = session.getTransport("smtp");
			t.connect((String)properties.get("mail.smtp.user"), "password");
			t.sendMessage(message, message.getAllRecipients());
			t.close();
		}catch (MessagingException me){
                        //Aqui se deberia o mostrar un mensaje de error o en lugar
                        //de no hacer nada con la excepcion, lanzarla para que el modulo
                        //superior la capture y avise al usuario con un popup, por ejemplo.
			return;
		}
		
	}
 
}