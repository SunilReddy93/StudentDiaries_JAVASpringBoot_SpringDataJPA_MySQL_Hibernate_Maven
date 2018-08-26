package com.studentdiaries.springboot.CustomModel;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;

public class SendMail {

    public static void send(String to, String subject, String message, String filename, final String user, final String password) {
        //Create an instance of Properties Class
        Properties properties = new Properties();

        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");


        /*Pass Properties object(properties) and Authenticator Object
         * for authentication to Session instance*/

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }

        });

        try {
            /*Create an instance of MIME Message,
             * it accepts MIME types and headers*/

            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(user));
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            mimeMessage.setSubject(subject);
            // mimeMessage.setText(message);


            MimeBodyPart bodyPart = new MimeBodyPart();
            bodyPart.setText(message);


            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(bodyPart);

            //attachment
            bodyPart = new MimeBodyPart();

            DataSource source = new FileDataSource(filename);
            bodyPart.setDataHandler(new DataHandler(source));
            bodyPart.setFileName("StudentDiariesFeedback.pdf");
            multipart.addBodyPart(bodyPart);

            mimeMessage.setContent(multipart);


            /*Now Transport Class is used to  deliver the message to the recipients*/

            Transport.send(mimeMessage);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
