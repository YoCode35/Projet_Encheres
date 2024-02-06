package fr.eni.encheres.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.eni.encheres.bll.ArticleManager;
import fr.eni.encheres.bo.Article;

@WebServlet("/MyItemsServlet")

public class MyItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        // Nom de la page pour le fil d'Ariane
        String pageName = "Mes articles à vendre";
        // Nom de la page à la requête en tant qu'attribut pour le fil d'Ariane
        request.setAttribute("pageName", pageName);
		
		HttpSession session = request.getSession();

		// Vérifie si l'utilisateur est connecté
		if (session.getAttribute("userID") != null) 
		{
			// L'utilisateur est connecté
			Integer userId = (Integer) session.getAttribute("userID");

			// Récupère la liste des articles à vendre de l'utilisateur
			List<Article> mesArticles = new ArrayList<>();

			mesArticles = ArticleManager.getInstance().getMesArticles(userId);

			// Liste des articles mise dans la session pour être utilisée dans la JSP
			request.setAttribute("mesArticles", mesArticles);
			
			// Redirige vers la page "Mes articles à vendre"
			RequestDispatcher dispatcher = request.getRequestDispatcher("myItemsForSale.jsp");
			dispatcher.forward(request, response);
		} 
		else 
		{
			// L'utilisateur n'est pas connecté
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
	}
}