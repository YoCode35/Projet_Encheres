package fr.eni.encheres.servlets;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DateFormatterServlet")
public class DateFormatterServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {

        // Récupérer les dates et heures entrées dans le formulaire		
        String dateD = request.getParameter("dateD");
        String heureD = request.getParameter("heureD");
        String dateF = request.getParameter("dateF");
        String heureF = request.getParameter("heureF");

        // Utiliser un objet SimpleDateFormat pour le formatage des dates
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");

        try {
            // Convertir et formater la date de début
            String outputDateD = formatDate(dateD, inputFormat, outputFormat);

            // Convertir et formater l'heure de début sans les secondes
            String outputHeureD = formatHour(heureD);

            // Convertir et formater la date de fin
            String outputDateF = formatDate(dateF, inputFormat, outputFormat);

            // Convertir et formater l'heure de fin sans les secondes
            String outputHeureF = formatHour(heureF);

            // Envoyer les dates formatées à la page JSP
            request.setAttribute("outputDateD", outputDateD);
            request.setAttribute("outputHeureD", outputHeureD);
            request.setAttribute("outputDateF", outputDateF);
            request.setAttribute("outputHeureF", outputHeureF);

            request.getRequestDispatcher("dateResult.jsp").forward(request, response);

        } catch (ParseException e) {
            // Gestion des erreurs de formatage de date
            e.printStackTrace();
            response.getWriter().println("Erreur de formatage de date : " + e.getMessage());
        }
    }

    private String formatDate(String dateStr, SimpleDateFormat inputFormat, SimpleDateFormat outputFormat)
            throws ParseException {
        // Convertir la chaîne de date en objet Date avec le bon format
        Date date = inputFormat.parse(dateStr);

        // Formater la date dans le nouveau format
        return outputFormat.format(date);
    }

    public static Time convertStringToTime(String heureStr) throws ParseException {
        SimpleDateFormat inputFormat = new SimpleDateFormat("HH:mm");
        java.util.Date utilDate = inputFormat.parse(heureStr);

        // Utilisez le constructeur approprié pour créer un objet Time
        return new Time(utilDate.getTime());
    }
    
    public static String formatHour(String heureStr) throws ParseException {
        // Utiliser la classe DateTimeConverter pour convertir la chaîne d'heure
        Time heure = convertStringToTime(heureStr);

        // Formater l'heure dans le nouveau format
        SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm", Locale.FRENCH);
        return outputFormat.format(heure);
    }

}