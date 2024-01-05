package fr.eni.encheres.servlets;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.eni.encheres.DateTimeConverter;
import fr.eni.encheres.bll.ArticleManager;
import fr.eni.encheres.bll.CategorieManager;
import fr.eni.encheres.bo.Article;

@MultipartConfig
@WebServlet("/AddArticleServlet")
public class AddArticleServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

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

        // Utiliser un objet SimpleDateFormat pour le formatage des dates
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");

        // Récupérez les données binaires de l'image

        try {

            // Convertir et formater la date de début
            String outputDateD = DateTimeConverter.formatDate(dateD, inputFormat, outputFormat);

            // Convertir et formater l'heure de début sans les secondes
            String outputHeureD = DateTimeConverter.formatHour(heureD);

            // Convertir et formater la date de fin
            String outputDateF = DateTimeConverter.formatDate(dateF, inputFormat, outputFormat);

            // Convertir et formater l'heure de fin sans les secondes
            String outputHeureF = DateTimeConverter.formatHour(heureF);

            // Ajoutez des impressions pour vérifier les valeurs
            System.out.println("nomArticle: " + nomArticle);
            System.out.println("desc: " + desc);
            System.out.println("categorie: " + categorie);
            System.out.println("dateD: " + dateD);
            System.out.println("heureD: " + heureD);
            System.out.println("dateF: " + dateF);
            System.out.println("heureF: " + heureF);
            System.out.println("prixInit: " + prixInit);
            System.out.println("adresseRetrait: " + adresseRetrait);

            // Récupérer le no_categorie correspondant au libellé
            int categorieId = CategorieManager.getInstance().getCategoryIdByLabel(categorie);
            
            // Conversion des chaînes en objets java.sql.Date et java.sql.Time
            // Après la modification
            LocalDate dateDebut = DateTimeConverter.convertStringToLocalDate(outputDateD);
            System.out.println("LocalDate: " + formatDate(dateDebut));
            LocalTime formattedHeureDebut = DateTimeConverter.convertStringToTime(outputHeureD);
            LocalDate dateFin = DateTimeConverter.convertStringToLocalDate(outputDateF);
            System.out.println("LocalDate: " + formatDate(dateFin));
            LocalTime formattedHeureFin = DateTimeConverter.convertStringToTime(outputHeureF);

            // Ensuite, utilisez le constructeur correspondant
            Article a = new Article(nomArticle, desc, dateDebut, formattedHeureDebut, dateFin, formattedHeureFin,
                    prixInit, prixVente, userId, categorieId, adresseRetrait);

            ArticleManager.getInstance().ajouterArticle(a);

            System.out.println("Requête SQL préparée avec succès.");

            // Définir l'attribut de session pour le message de confirmation
            session.setAttribute("confirmationMessage", "Votre article a été ajouté avec succès !");

            // Redirection vers la page de confirmation après l'ajout réussi
            response.sendRedirect("form_add_new_item.jsp");

        } catch (ParseException e) {
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
