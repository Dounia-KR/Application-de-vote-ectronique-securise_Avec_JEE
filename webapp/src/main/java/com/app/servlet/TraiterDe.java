package com.app.servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.dao.Covotant;
import com.app.dao.Devotant;
import com.app.dao.GestionBd;
import com.app.mail.ReadFile;
import com.app.mail.ReceiveMail;

/**
 * Servlet implementation class TraiterDe
 */
@WebServlet("/TraiterDe")
public class TraiterDe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TraiterDe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n********	Centre de Depouillement	   ********");
		ReceiveMail rec = new ReceiveMail();
		GestionBd bd = new GestionBd();

		try {
			Thread.sleep(12000);
			rec.receive("imap.gmail.com", "centredepouillement@gmail.com", "depouillement123",
					"C:/Users/Elitebook folio/eclipse-workspace/webapp/messages/de/", 2);
			System.out.println("DE a recu les deux messages un from Votant et l'autre from CO avec succès .");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
				rec.decrypteFile("de/BulltinCoDe", "privatekeyde.asc", "de/BulltinCoDe1");
				System.out.println("Le message BulltinCoDe est déchiffré avec succés .");
				rec.decrypteFile("de/BulltinCoDe1", "privatekeyde.asc", "de/outputCo.txt");		
				System.out.println("Le message BulltinCoDe est déchiffré une autre fois avec succés .");
				rec.decrypteFile("de/BulltinDE", "privatekeyde.asc", "de/outputVotant.txt");
				System.out.println("Le message BulltinDE est déchiffré avec succés .\n");
				ReadFile readfile = new ReadFile();
				System.out.println("Lire le fichier où on stoque la bulltin de vote recu from CO aprés le déchiffrement .");
				String msg1 = readfile.readfile("C:/Users/Elitebook folio/eclipse-workspace/webapp/messages/de/outputCo.txt");
				System.out.println(msg1);
				System.out.println("Lire le fichier où on stoque la bulltin de vote recu from Votant aprés le déchiffrement .");
				String msg2 = readfile.readfile("C:/Users/Elitebook folio/eclipse-workspace/webapp/messages/de/outputVotant.txt");
				System.out.println(msg2);
				String donne1[] = msg1.split(";;");
				String donne2[] = msg2.split(";;");
				if (donne1[0].compareTo(donne2[0]) == 0 && donne1[1].compareTo(donne2[1]) == 0) {
					Devotant devotant = new Devotant(donne1[0], donne1[1]);
					bd.setDeVotant(devotant);
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/vues/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
