package fr.eni.encheres.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import fr.eni.encheres.DateTimeConverter;
import fr.eni.encheres.bll.ArticleManager;
import fr.eni.encheres.bll.CategorieManager;
import fr.eni.encheres.bo.Article;

@MultipartConfig
@WebServlet("/AddArticleServlet")
public class AddArticleServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{    
		//Nom de la page pour le fil d'Ariane
		String pageName = "Créer un nouvel article à vendre";
		// Nom de la page à la requête en tant qu'attribut pour le fil d'Ariane
		request.setAttribute("pageName", pageName);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("form_add_new_item.jsp");
		dispatcher.forward(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        // Récupérer 'userId' depuis la session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userID");

        // Récupérer les données du formulaire
        String nomArticle = request.getParameter("nomArticle");
        String desc = request.getParameter("desc");
        String categorie = request.getParameter("categorie"); // Récupérer le libellé de la catégorie
        String dateD = request.getParameter("dateD");
        String heureD = request.getParameter("heureD");
        String dateF = request.getParameter("dateF");
        String heureF = request.getParameter("heureF");
        int prixInit = Integer.valueOf(request.getParameter("prixInit"));
        int prixVente = 0;
        String adresseRetrait = request.getParameter("adresseRetrait");

        // Récupérer le fichier du formulaire
        Part filePart = request.getPart("file");
        InputStream fileInputStream = filePart.getInputStream();
        String imgFileName = filePart.getSubmittedFileName();
        String imgFilePath = "img-items/" + imgFileName;

        // Utiliser un objet SimpleDateFormat pour le formatage des dates
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");

        try 
        {
            // Convertir et formater la date de début
            String outputDateD = DateTimeConverter.formatDate(dateD, inputFormat, outputFormat);

            // Convertir et formater l'heure de début sans les secondes
            String outputHeureD = DateTimeConverter.formatHour(heureD);

            // Convertir et formater la date de fin
            String outputDateF = DateTimeConverter.formatDate(dateF, inputFormat, outputFormat);

            // Convertir et formater l'heure de fin sans les secondes
            String outputHeureF = DateTimeConverter.formatHour(heureF);

            // Récupérer le no_categorie correspondant au libellé
            int categorieId = CategorieManager.getInstance().getCategorieIdByLabel(categorie);

            // Conversion des chaînes en objets java.sql.Date et java.sql.Time
            // Après la modification
            LocalDate dateDebut = DateTimeConverter.convertStringToLocalDate(outputDateD);
            System.out.println("LocalDate: " + formatDate(dateDebut));
            LocalTime formattedHeureDebut = DateTimeConverter.convertStringToTime(outputHeureD);
            LocalDate dateFin = DateTimeConverter.convertStringToLocalDate(outputDateF);
            System.out.println("LocalDate: " + formatDate(dateFin));
            LocalTime formattedHeureFin = DateTimeConverter.convertStringToTime(outputHeureF);

            // Ensuite, utilisez le constructeur correspondant
            Article a = new Article(nomArticle, desc, imgFileName, imgFilePath, dateDebut, formattedHeureDebut,
                    				dateFin, formattedHeureFin, prixInit, prixVente, userId, categorieId, adresseRetrait);

            // Ajouter l'article avec l'InputStream du fichier à ArticleManager
            ArticleManager.getInstance().ajouterArticle(a, fileInputStream);
            
            // Définir l'attribut de session pour le message de confirmation
            session.setAttribute("addItem_confirmMessage", "Votre article a été ajouté avec succès !");
            
            // Redirection vers la page de confirmation après l'ajout réussi
            response.sendRedirect("form_add_new_item.jsp");
        } 
        catch (ParseException e) 
        {
            // Gestion des erreurs de conversion de date
            e.printStackTrace();
            System.out.println("Erreur de conversion de date.");
            response.sendRedirect("error.jsp");
        }
    }

    private String formatDate(LocalDate date) 
    {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        return date.format(formatter);
    }
}
