package com.app.servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.dao.Covotant;
import com.app.dao.GestionBd;
import com.app.mail.ReadFile;
import com.app.mail.ReceiveMail;
import com.app.mail.SendMail;

/**
 * Servlet implementation class TraiterCo
 */
@WebServlet("/TraiterCo")
public class TraiterCo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TraiterCo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n********	Centre de Comptage CO	********");
		GestionBd bd = new GestionBd();
		try {
		ReceiveMail r = new ReceiveMail();
		r.receive("imap.gmail.com", "centrecomptage.app@gmail.com", "comptage123",
				"C:/Users/Elitebook folio/eclipse-workspace/webapp/messages/co/", 2);
		System.out.println("CO a recu les deux messages from Votant IdentificationCO et BulltinCO avec succés .");
		r.decrypteFile("co/IdentificationCO", "privatekeyco.asc", "co/output.txt");
		System.out.println("Le message IdentificationCO est déchiffré avec succés .");
		ReadFile readfile = new ReadFile();
		String msg1 = readfile.readfile("C:/Users/Elitebook folio/eclipse-workspace/webapp/messages/co/output.txt");
		String msg2 = readfile.readfile("C:/Users/Elitebook folio/eclipse-workspace/webapp/messages/co/BulltinCO");
		String nom = null, prenom = null, datenaissance = null, identification = null, bulltinvote = null;
		String donne[] = msg1.split(";;");
		nom = donne[0];
		prenom = donne[1];
		datenaissance = donne[2];
		identification = donne[3];
		bulltinvote = msg2;

		Covotant covotant = new Covotant(nom, prenom, datenaissance, identification, bulltinvote);
		System.out.println("Le votant est  :  "+covotant.getNom() + " " + covotant.getPrenom() + " --- Identification: "+covotant.getIdentification());
		if (bd.setCoVotant(covotant) == true) {
			SendMail send = new SendMail();
			msg2 = send.encrypteMessage(msg2, "publickeyde.asc");
			System.out.println("Le message BulltinCO est chiffré une autre fois avec succés .");
			send.send("BulltinCoDe",
					msg2, "centrecomptage.app@gmail.com",
					"comptage123", "centredepouillement@gmail.com");
			System.out.println("CO a envoyé le message BulltinCoDe au centre DE avec succés .");
		} else {
			String err = "Ce votant est deja vote" + covotant.getIdentification();
			request.setAttribute("err", err);
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		ServletContext context= getServletContext();
		RequestDispatcher rd= context.getRequestDispatcher("/TraiterDe");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
