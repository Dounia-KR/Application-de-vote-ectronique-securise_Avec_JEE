package com.app.mail;


import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;  
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.didisoft.pgp.PGPLib;
  
public class SendMail {  
	// Constructor
		public SendMail() {
		}
		
		public Boolean send(String subjecttype,String text,final String from,final String password,String to){
		      String host = "smtp.gmail.com";
		      
		      // Creer un objet Properties qui contient les informations necessaire pour assurer la connection au serveur de mails.
		      Properties prop = new Properties();
				prop.put("mail.smtp.host", "smtp.gmail.com");
		        prop.put("mail.smtp.port", "587");
		        prop.put("mail.smtp.auth", "true");
		        prop.put("mail.smtp.starttls.enable", "true"); //TLS    

		      // La classe Session encapsule pour un client donné sa connexion avec le serveur de mails.
		        Session session = Session.getInstance(prop,
		                new javax.mail.Authenticator() {
		                    protected PasswordAuthentication getPasswordAuthentication() {
		                        return new PasswordAuthentication(from, password);
		                    }
		                });

		      try{
		         // Creer une objet MimeMessage
		         MimeMessage message = new MimeMessage(session);
		         // Mettre à jour l'émetteur
		         message.setFrom(new InternetAddress(from));
		         // Mettre à jour les destinataires d'un type
		         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		         // Mettre à jour le sujet du message
		         message.setSubject(subjecttype);
		         // Mettre à jour le contenu du message
		         message.setText(text);
		         // Envoyer le message
		         Transport.send(message);
		         return true;         	         
		      }catch (MessagingException mex) {
		         mex.printStackTrace();
		      }
			return false;
		 }
		
		public String encrypteMessage(String message, String keyFile) {
			   String encryptedString = "";
			 try {
				 
			        // creer un objet PGPLib
			        PGPLib pgp = new PGPLib();
			 
			        String publicEncryptionKeyFile = "C:/Users/Elitebook folio/eclipse-workspace/webapp/Keys/" + keyFile;
			        
			 
			        InputStream publicEncryptionKeyStream = null;
						publicEncryptionKeyStream = new FileInputStream(publicEncryptionKeyFile);
			 
			        // encrypte une chaine de caractere passee en argument
						encryptedString = pgp.encryptString(message,
			                               publicEncryptionKeyStream);
			       } catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			             return encryptedString;
		   }
}
