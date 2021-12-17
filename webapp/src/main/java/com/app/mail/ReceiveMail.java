package com.app.mail;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import java.util.Properties;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.internet.MimeBodyPart;

import com.didisoft.pgp.PGPException;
import com.didisoft.pgp.PGPLib;
import com.sun.mail.imap.IMAPStore;

public class ReceiveMail {
	

	public ReceiveMail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void receive(String pop3Host, String user, String password, String saveDirectory, int nbrmessage)
			throws IOException {

		try {
			Properties properties = new Properties();
			properties.put("mail.store.protocol", "imaps");
			properties.setProperty("charset", "utf-8");
			Session emailSession = Session.getDefaultInstance(properties);

			// creer l'objet emailStore pour acceder aux messages IMAP
			IMAPStore emailStore = (IMAPStore) emailSession.getStore("imaps");
			emailStore.connect("imap.gmail.com", user, password);

			// creer un objet Folder
			Folder emailFolder = emailStore.getFolder("INBOX");
			// ouvrir l'objet Folder en mode lecture
			emailFolder.open(Folder.READ_ONLY);

			// retourne un tableu des Messages en cet Folder
			Message[] messages = emailFolder.getMessages();
			for (int i = messages.length - 1; i >= 0; i--) {
				Message message = messages[i];
				String subject = message.getSubject();
				if (nbrmessage > 0
						&& ((message.getSubject().compareTo("IdentificationCO") == 0
								|| message.getSubject().compareTo("BulltinCO") == 0
								|| message.getSubject().compareTo("BulltinCoDe") == 0
								|| message.getSubject().compareTo("BulltinDE") == 0 ))) {
					Object content = message.getContent();
					nbrmessage = nbrmessage - 1;
					File f = new File(saveDirectory + subject);
					FileWriter myWriter = new FileWriter(f);
				    myWriter.write(content.toString());
				    myWriter.close();
					}
				}

			// Fermer Folder sans supprimer les messages
			emailFolder.close(false);
			emailStore.close();

		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public void decrypteFile(String fileName, String privateKeyFile, String output) {
		String path1 = "C:/Users/Elitebook folio/eclipse-workspace/webapp/Keys/";
		String path2 = "C:/Users/Elitebook folio/eclipse-workspace/webapp/messages/";
		// creer un objet PGPLib
		   PGPLib pgp = new PGPLib();
		 
		   String privateKeyPass = "changeit";
		   try {
		// Décrypte un fichier crypté OpenPGP à l'aide d'une clé d'un magasin de clés OpenPGP.
			String originalFileName = pgp.decryptFile(path2+fileName,
								path1+privateKeyFile,
								privateKeyPass,
								path2+output);
		} catch (PGPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}