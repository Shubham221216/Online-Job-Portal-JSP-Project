package com.service;

import java.util.Random;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Properties;

public class EmailService {
	public static String getOTP () {
		Random random = new Random();
	    return String.format("%04d", random.nextInt(10000));
	}
	
	public static boolean sendOTP(String email, String genOTP) {
		boolean f = false;
        
        String to = email;

        String from = "chowdhurydevhelp22@gmail.com";

        String host = "smtp.gmail.com";

        Properties properties = System.getProperties();

        

        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

          System.out.println("Done Line 27");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication(from, "hipwzjyyiaipxmfu");

            }
        });
        

        session.setDebug(true);

        try {
			
            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress(from));

            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            message.setSubject("JobPortal");

            message.setText("Your One time Password for Job Portal is " + genOTP+" do not share this OTP with anybody.");

            System.out.println("sending...");
            Transport.send(message);
            System.out.println("Sent message successfully....");
            f = true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        return f;

    }
	    
	

}
