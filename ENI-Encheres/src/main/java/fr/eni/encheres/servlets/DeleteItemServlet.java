package fr.eni.encheres.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.encheres.dal.Settings;

/**
 * Servlet implementation class DeleteItemServlet
 */
@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        // Informations de connexion à la base de données
        String url = Settings.getProperties("urldb");
        String user = Settings.getProperties("userdb");
        String password = Settings.getProperties("passworddb");

        // Charge le pilote JDBC SQL Server
        try
        {
        	Class.forName(Settings.getProperties("driverdb"));
        } 
        catch (ClassNotFoundException e) 
        {
            e.printStackTrace();      
        }
        
        // ID de la ligne à supprimer
        //int noArticle = 13; // Remplacez 123 par l'ID de la ligne que vous souhaitez supprimer
        // Récupération de l'identifiant de l'article
        int noArticle = Integer.parseInt(request.getParameter("idArticle"));
        
        // Ajout de l'identifiant de l'article comme attribut de la requête
        request.setAttribute("no_article", noArticle); // Ajout de cette ligne

        // Requête SQL pour supprimer une ligne
        String sql = "DELETE FROM ARTICLES_VENDUS WHERE no_article = ?";

        try (
            // Établir une connexion à la base de données
            Connection connection = DriverManager.getConnection(url, user, password);
            
            // Préparer la requête SQL
            PreparedStatement preparedStatement = connection.prepareStatement(sql)
        ) {
            // Définir la valeur du paramètre dans la requête SQL
            preparedStatement.setInt(1, noArticle);

            // Exécuter la requête SQL pour supprimer la ligne
            int rowsDeleted = preparedStatement.executeUpdate();
            
            // Vérifier si la ligne a été supprimée avec succès
            if (rowsDeleted > 0) 
            {
            	// Définir un message de confirmation
                String confirmationMessage = "La mise à jour a été effectuée avec succès !";
                
                // Définir le message de confirmation dans la requête pour l'afficher sur la page JSP
                request.setAttribute("MessConfirmModifAnnonce", confirmationMessage);
            	
                // Rediriger vers la même page JSP pour afficher le message de confirmation            	
                request.getRequestDispatcher("deleteItemConfirmation.jsp").forward(request, response);
            } 
            else 
            {
                System.out.println("Aucune ligne n'a été supprimée.");
            }
        } 
        catch (SQLException e) 
        {
            // Gérer les erreurs de base de données
            e.printStackTrace();
        }
    }
}