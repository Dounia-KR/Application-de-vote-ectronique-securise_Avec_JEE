package com.app.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.dao.CoManager;
import com.app.dao.Employe;
import com.app.dao.GestionBd;
import com.app.mail.SendMail;

/**
 * Servlet implementation class TraiterAuthoCo
 */
@WebServlet("/TraiterAuthoCo")
public class TraiterAuthoCo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TraiterAuthoCo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		GestionBd bd = new GestionBd();
		CoManager c = new CoManager(email, password);
		// Si le CoManger a bien entré ces informations on le redérige vers sa page d'accueil
		if(bd.findCoManager(c)) {
			getServletContext().getRequestDispatcher("/vues/co.jsp").forward(request, response);
		}else {
			// Sinon on lui affiche une message d'erreur
			HttpSession session = request.getSession(true);
			String erreur = "Erreur : L&#039;adresse e-mail ou le mot de passe que vous avez saisi(e) n&#039;est pas associ&eacute;(e) &agrave; un compte.";
		    String page = "/vues/authCO.jsp";
			session.setAttribute("erreur", erreur);
			session.setAttribute("page", page);
			getServletContext().getRequestDispatcher("/vues/erreur.jsp").forward(request, response);
		}
	}

}
