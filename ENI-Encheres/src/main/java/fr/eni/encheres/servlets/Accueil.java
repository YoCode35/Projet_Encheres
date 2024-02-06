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

import fr.eni.encheres.bll.ArticleManager;
import fr.eni.encheres.bo.Article;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/Accueil")
public class Accueil extends HttpServlet
{
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// Récupère la liste des articles à vendre de l'utilisateur
					List<Article> tousArticles = new ArrayList<>();
					tousArticles = ArticleManager.getInstance().selectAll();					
					request.setAttribute("tousArticles", tousArticles);
					
		// Nom de la page pour le fil d'Ariane
		String pageName = "Accueil"; // Remplacez cela par votre logique pour obtenir le nom de la page
		// Nom de la page à la requête en tant qu'attribut pour le fil d'Ariane
		request.setAttribute("pageName", pageName);			
					
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
