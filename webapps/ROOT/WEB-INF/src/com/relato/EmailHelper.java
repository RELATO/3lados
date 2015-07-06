package  com.relato;

import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailHelper {
	
	private Session session;
    private ArrayList dests = new ArrayList();
	private InternetAddress from;

	public EmailHelper(String sender) throws Exception
	{
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.relato.com.br");

		session = Session.getInstance(prop);
		from = new InternetAddress(sender);
	}

	public void addDest(String dd) throws MessagingException
	{
		dests.add(new InternetAddress(dd));
	}

	public void envia(String subject, String content) throws MessagingException
	{
            Message message = new MimeMessage(session);
            message.setFrom(from);
            InternetAddress[] dest = (InternetAddress[])dests.toArray(new  InternetAddress[dests.size()]);
            message.setRecipients(Message.RecipientType.TO, dest);
            
            message.setSubject(subject);
            
            message.setSentDate(new Date());
            message.setContent(content, "text/html");
			message.setHeader("Content-Type", "text/html; charset=iso-8859-1");
			Transport.send(message);

	}
}




/*
            Multipart mp = new MimeMultipart();
            BodyPart bodyPart = null;

            if(content != null) {
                    bodyPart = new MimeBodyPart();
                    bodyPart.setContent(content, "text/plain");
                    mp.addBodyPart(bodyPart);
            }

            File file = new File("");
            if ( file != null ){
                    bodyPart = new MimeBodyPart();
                    FileDataSource fds = new FileDataSource(file);
                    DataHandler dh = new DataHandler(fds);
                    bodyPart.setFileName("teste.doc");
                    bodyPart.setDisposition(Part.ATTACHMENT);
                    bodyPart.setDescription("Arquivo anexado");
                    bodyPart.setDataHandler(dh);
                    mp.addBodyPart(bodyPart);
            }            

*/