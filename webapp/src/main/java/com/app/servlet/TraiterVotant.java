package com.app.servlet;

import com.app.dao.Employe;
import com.app.dao.GestionBd;
import com.app.mail.SendMail;
import com.didisoft.pgp.PGPLib;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class TraiterVotant
 */
@WebServlet("/TraiterVotant")
public class TraiterVotant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TraiterVotant() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/TraiterCo");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("********	Votant	  ********");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String datenaissance = request.getParameter("datenaissance");
		String iden = request.getParameter("identification");
		String bulltinvote = request.getParameter("bulltinvote");
		GestionBd bd = new GestionBd();
		Employe e = new Employe(nom, prenom, datenaissance, iden);
		if(bd.findEmploye(e)) {
			try {
				SendMail s = new SendMail();
				String message1 = nom + ";;" + prenom + ";;" + datenaissance + ";;" + iden;
				String message2 = iden + ";;" + bulltinvote;
				message1 = s.encrypteMessage(message1, "publickeyco.asc");
				message2 = s.encrypteMessage(message2, "publickeyde.asc");
				System.out.println("les messages from Votant sont chiffrés avec succés .");
				if (s.send("IdentificationCO",
						message1, "votant.app@gmail.com",
						"votant123", "centrecomptage.app@gmail.com") &&
					s.send("BulltinCO", 
								message2, "votant.app@gmail.com",
								"votant123", "centrecomptage.app@gmail.com") &&
					s.send("BulltinDE", 
							message2, "votant.app@gmail.com",
							"votant123", "centredepouillement@gmail.com")
				)
				System.out.println("les messages from Votant sont envoyés avec succés .");
	
				} catch (Exception ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
			}
			ServletContext context= getServletContext();
			RequestDispatcher rd= context.getRequestDispatcher("/TraiterCo");
			rd.forward(request, response);
		}else {
			HttpSession session = request.getSession(true);
			String msgErreur = "Erreur : Employ&eacute;(e) non trouv&eacute;(e).";
		    String pageAuth = "/vues/register.jsp";
			session.setAttribute("erreur", msgErreur);
			session.setAttribute("page", pageAuth);
			getServletContext().getRequestDispatcher("/vues/erreur.jsp").forward(request, response);
		}
	}
	

}
