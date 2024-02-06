package fr.eni.encheres.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/CahierDesCharges")
public class CahierDesCharges extends HttpServlet
{
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
					
		// Nom de la page pour le fil d'Ariane
		String pageName = "Cahier des charges"; // Remplacez cela par votre logique pour obtenir le nom de la page
		// Nom de la page à la requête en tant qu'attribut pour le fil d'Ariane
		request.setAttribute("pageName", pageName);			
					
		RequestDispatcher rd = request.getRequestDispatcher("cahier-des-charges-application-encheres.jsp");
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