package fr.eni.encheres.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Map;
import fr.eni.encheres.dal.Categories;
import fr.eni.encheres.dal.Settings;

@WebServlet("/UpdateItemServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10) // Taille maximale autorisée pour les données (ici 10 Mo)
public class UpdateItemServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
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
        
        HttpSession session = request.getSession();
        Integer userId = null;
        
        if (session.getAttribute("userID") != null) 
        {
            // L'utilisateur est connecté
            userId = (Integer) session.getAttribute("userID");
            
	        // Nom de la page pour le fil d'Ariane
	        String pageName = "Modifier mon annonce";
	        // Nom de la page à la requête en tant qu'attribut pour le fil d'Ariane
	        request.setAttribute("pageName", pageName);
        }

        String pseudoUtilisateur = "";

        // Requête SQL pour récupérer le pseudo de l'utilisateur
        String sql = "SELECT pseudo FROM Utilisateurs WHERE no_utilisateur = ?";

        // Déclaration de la variable de connexion
        Connection connection = null;

        try 
        {
            // Initialisation de la connexion à la base de données
            connection = DriverManager.getConnection(url, user, password);

            // Création d'une instruction préparée pour récupérer le pseudo de l'utilisateur
            try (PreparedStatement statement = connection.prepareStatement(sql)) 
            {
                statement.setInt(1, userId); // Remplacer le paramètre par l'identifiant de l'utilisateur

                // Exécution de la requête pour récupérer le pseudo de l'utilisateur
                try (ResultSet resultSet = statement.executeQuery()) 
                {
                    // Vérification si un résultat est retourné
                    if (resultSet.next()) 
                    {
                        pseudoUtilisateur = resultSet.getString("pseudo");
                    }
                }
            }

            // Récupération de l'identifiant de l'article
            int noArticle = Integer.parseInt(request.getParameter("idArticle"));
            
            // Ajout de l'identifiant de l'article comme attribut de la requête
            request.setAttribute("no_article", noArticle); // Ajout de cette ligne

            // Requête SQL pour récupérer un article en fonction de son numéro et du pseudo de l'utilisateur
            String articleSql = "SELECT * FROM ARTICLES_VENDUS av INNER JOIN UTILISATEURS u ON av.no_utilisateur = u.no_utilisateur WHERE av.no_article = ? AND u.pseudo = ?";

            // Création d'une instruction préparée pour récupérer l'article
            try (PreparedStatement articleStatement = connection.prepareStatement(articleSql)) 
            {
                articleStatement.setInt(1, noArticle); // Remplacer le paramètre par le numéro de l'article
                articleStatement.setString(2, pseudoUtilisateur); // Remplacer le paramètre par le pseudo de l'utilisateur

                // Exécution de la requête pour récupérer l'article
                try (ResultSet articleResultSet = articleStatement.executeQuery()) 
                {
                    // Vérification si un résultat est retourné
                    if (articleResultSet.next()) 
                    {
                        // Récupération des données de l'article
                        int no_article = articleResultSet.getInt("no_article");
                        String nom_article = articleResultSet.getString("nom_article");
                        int no_categorie = articleResultSet.getInt("no_categorie");
                        String description = articleResultSet.getString("description");
                        LocalDate date_debut_encheres = articleResultSet.getObject("date_debut_encheres", LocalDate.class);
                        LocalTime heure_debut_encheres = articleResultSet.getObject("heure_debut_encheres", LocalTime.class);
                        LocalDate date_fin_encheres = articleResultSet.getObject("date_fin_encheres", LocalDate.class);
                        LocalTime heure_fin_encheres = articleResultSet.getObject("heure_fin_encheres", LocalTime.class);
                        int prix_initial = articleResultSet.getInt("prix_initial");
                        String adresse_retrait = articleResultSet.getString("adresse_retrait");
                        String img_FilePath = articleResultSet.getString("img_FilePath");
                        String img_FileName = articleResultSet.getString("img_FileName");
                        
                        // Transmission des données de l'article à la JSP pour affichage
                        request.setAttribute("no_article", no_article);
                        request.setAttribute("nom_article", nom_article);
                        request.setAttribute("no_categorie", no_categorie);
                        request.setAttribute("description", description);
                        request.setAttribute("date_debut_encheres", date_debut_encheres);
                        request.setAttribute("heure_debut_encheres", heure_debut_encheres);
                        request.setAttribute("date_fin_encheres", date_fin_encheres);
                        request.setAttribute("heure_fin_encheres", heure_fin_encheres);
                        request.setAttribute("prix_initial", prix_initial);
                        request.setAttribute("adresse_retrait", adresse_retrait);
                        request.setAttribute("img_FilePath", img_FilePath);
                        request.setAttribute("img_FileName", img_FileName);                        
                    }
                }
            }

            // Récupère la liste des Catégories avec leurs Numéros
            Categories categoryDAO = new Categories();
            Map<Integer, String> categoriesMap = categoryDAO.getCategoriesWithNumbers();
            request.setAttribute("categoriesMap", categoriesMap);

            // Récupère la liste des Numéros de Catégories
            List<Integer> categorieNumbers = categoryDAO.getCategorieNumbers();
            request.setAttribute("categoriesNumbers", categorieNumbers);
            
            // Récupère la liste des Libellés des Catégories
            List<String> categoriesLibelles = categoryDAO.getCategories();
            request.setAttribute("categoriesLibelles", categoriesLibelles);
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        } 
        finally 
        {
            // Fermeture de la connexion dans le bloc finally pour garantir sa fermeture même en cas d'exception
            try 
            {
                if (connection != null) 
                {
                    connection.close();
                }
            } 
            catch (SQLException ex) 
            {
                ex.printStackTrace();
            }
        }

        //request.setAttribute("pseudo", pseudoUtilisateur);
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateItem.jsp");
		dispatcher.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {              
    	//HttpSession session = request.getSession();
    	
    	// Récupère les données du formulaire
        int noArticle = Integer.parseInt(request.getParameter("noArticle"));
        String newArticleName = request.getParameter("newArticleName");
        String newDescription = request.getParameter("newDescription");
        int noCategorie = Integer.parseInt(request.getParameter("noCategorie"));

        // Récupère le fichier Image
        Part filePart = request.getPart("newImgFilePath");
        String newImgFileName = filePart.getSubmittedFileName();
        String newImgFilePath = "img-items/" + newImgFileName;
        
        // Récupèrer les dates et les heures du formulaire
        LocalDate newDateDebutEncheres = LocalDate.parse(request.getParameter("newDateDebutEncheres"));
        LocalTime newHeureDebutEncheres = LocalTime.parse(request.getParameter("newHeureDebutEncheres"));
        LocalDate newDateFinEncheres = LocalDate.parse(request.getParameter("newDateFinEncheres"));
        LocalTime newHeureFinEncheres = LocalTime.parse(request.getParameter("newHeureFinEncheres"));
        
        // Récupère les autres données du formulaire
        int newPrixInitial = Integer.parseInt(request.getParameter("newPrixInitial"));
        String newAdressRetrait = request.getParameter("newAdressRetrait");

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
            e.printStackTrace(); // Gestion de l'erreur de chargement du pilote JDBC
        }

        // Établit une connexion à la base de données
        try (Connection connection = DriverManager.getConnection(url, user, password)) 
        {
            // Préparer la requête de mise à jour
            String updateQuery = "UPDATE ARTICLES_VENDUS SET nom_article = ?, description=?, no_categorie=?, date_debut_encheres=?, heure_debut_encheres=?, date_fin_encheres=?, heure_fin_encheres=?, prix_initial=?, adresse_retrait=? ";
            if (!newImgFileName.isEmpty()) 
            {
                // Si un nouveau fichier a été sélectionné, inclu la nouvelle image dans la requête
                updateQuery += ", img_FilePath=?, img_FileName=? ";
            }
            updateQuery += " WHERE no_article = ?";
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) 
            {
                // Définir les valeurs des paramètres de la requête
                preparedStatement.setString(1, newArticleName);
                preparedStatement.setString(2, newDescription);
                preparedStatement.setInt(3, noCategorie);
                preparedStatement.setObject(4, newDateDebutEncheres);
                preparedStatement.setObject(5, newHeureDebutEncheres);
                preparedStatement.setObject(6, newDateFinEncheres);
                preparedStatement.setObject(7, newHeureFinEncheres);
                preparedStatement.setInt(8, newPrixInitial);
                preparedStatement.setString(9, newAdressRetrait);

                int index = 10; // Début de l'index pour les paramètres liés à l'image
                if (!newImgFileName.isEmpty()) 
                {
                    // Si un nouveau fichier a été sélectionné, définir les colonnes liées à l'image
                    preparedStatement.setString(index++, newImgFilePath);
                    preparedStatement.setString(index++, newImgFileName);
                }
                preparedStatement.setInt(index, noArticle); // Définition de l'index final pour le numéro d'article

                // Exécuter la requête de mise à jour
                int rowsUpdated = preparedStatement.executeUpdate();
                if (rowsUpdated > 0) 
                {                    
                    // Définir un message de confirmation
                    String confirmationMessage = "La mise à jour a été effectuée avec succès !";
                    
                    // Définir l'attribut de numéro d'article dans la requête
                    request.setAttribute("no_article", noArticle);

                    // Définir le message de confirmation dans la requête pour l'afficher sur la page JSP
                    request.setAttribute("MessConfirmModifAnnonce", confirmationMessage);
                    
                    System.out.println("Contenu de confirmationMessage : " + confirmationMessage);

                    // Rediriger vers la même page JSP pour afficher le message de confirmation
                    request.getRequestDispatcher("updateItemSuccess.jsp").forward(request, response);
                } 
                else 
                {
                    // Aucune ligne mise à jour (ID d'article invalide)
                    response.sendRedirect("updateItemFailure.jsp");
                }
            }
        } 
        catch (SQLException e) 
        {
            // Gérer les erreurs de base de données
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}