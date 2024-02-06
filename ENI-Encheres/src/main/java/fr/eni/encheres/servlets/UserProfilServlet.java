package fr.eni.encheres.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserProfilServlet
 */
@WebServlet("/UserProfilServlet")
public class UserProfilServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;       

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        // Nom de la page pour le fil d'Ariane
        String pageName = "Mon profil";
        // Nom de la page à la requête en tant qu'attribut pour le fil d'Ariane
        request.setAttribute("pageName", pageName);

        RequestDispatcher dispatcher = request.getRequestDispatcher("userProfil.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}