package fr.eni.encheres.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.eni.encheres.bll.UtilisateurManager;
import fr.eni.encheres.bo.Utilisateur;

/**
 * Servlet implementation class ServletUpdateUser
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//Nom de la page pour le fil d'Ariane
		String pageName = "Modifier mon profil";
		// Nom de la page à la requête en tant qu'attribut pour le fil d'Ariane
		request.setAttribute("pageName", pageName);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateUser.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();

		String pseudo = request.getParameter("pseudo");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String telephone = request.getParameter("telephone");
		String rue = request.getParameter("rue");
		String codePostal = request.getParameter("codePostal");
		String ville = request.getParameter("ville");
		String password = request.getParameter("newPassword");
		int credit = (int) session.getAttribute("userCredit");
		boolean admin = (boolean) session.getAttribute("userAdmin");
		int idUser = (int) session.getAttribute("userID");


		boolean etatPassword; // est false si ancien pwd, si c'est un nouveau password = true

		if (password == null || password.length() <= 0) 
		{
			password = (String) session.getAttribute("userPassword");
			etatPassword = false;
		} 
		else
		{
			etatPassword = true;
		}

		Utilisateur u = new Utilisateur(idUser, pseudo, nom, prenom, email, telephone, rue, codePostal, ville, password, credit, admin);

		UtilisateurManager.getInstance().updateUser(u, etatPassword);
		
		// Pour modifier le mot de passe dans la session en cours
		if (password != null) 
		{			
			session.setAttribute("userPassword", u.getMotDePasse());
		}
		//"UPDATE" Modification des données Utilisateur enregistré dans la base de donnée
		session.setAttribute("userPseudo", u.getPseudo());
		session.setAttribute("userNom", u.getNom());
		session.setAttribute("userPrenom", u.getPrenom());
		session.setAttribute("userEmail", u.getEmail());
		session.setAttribute("userTelephone", u.getTelephone());
		session.setAttribute("userRue", u.getRue());
		session.setAttribute("userCodePostal", u.getCodePostal());
		session.setAttribute("userVille", u.getVille());
		session.setAttribute("userCoordonnees", u.getRue() + ", " + u.getCodePostal() + " " + u.getVille());

		//Redirige vers UserProfil
		response.sendRedirect("UserProfilServlet");
	}
	
}
