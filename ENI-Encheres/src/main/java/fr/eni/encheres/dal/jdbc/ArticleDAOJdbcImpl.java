package fr.eni.encheres.dal.jdbc;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import fr.eni.encheres.bo.Article;
import fr.eni.encheres.dal.ArticleDAO;

public class ArticleDAOJdbcImpl implements ArticleDAO {

    private static final String SQL_INSERT = "INSERT INTO ARTICLES_VENDUS (nom_article, description, date_debut_encheres, heure_debut_encheres, date_fin_encheres, heure_fin_encheres, prix_initial, no_utilisateur, no_categorie, adresse_retrait, img_FileName, img_FilePath) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SQL_SELECTBY_ID = "SELECT id, no_article, nom_article, description, img_FileName, img_FilePath, date_debut_encheres, heure_debut_encheres, date_fin_encheres, heure_fin_encheres, prix_initial, adresse_retrait FROM ARTICLES_VENDUS WHERE no_article=? ";
    private static final String SQL_SELECT_ALL = "SELECT no_article, nom_article, description, img_FileName, img_FilePath, date_debut_encheres, heure_debut_encheres, date_fin_encheres, heure_fin_encheres, prix_initial, no_utilisateur, no_categorie, adresse_retrait FROM ARTICLES_VENDUS";
    private static final String SQL_SELECT_ALL_BY_USERID = "SELECT * FROM ARTICLES_VENDUS WHERE no_utilisateur = ?";
    private static final String SQL_UPDATE = "UPDATE ARTICLES_VENDUS SET nom_article=?, description=?, img_FileName=?, img_FilePath=?, date_debut_encheres=?, heure_debut_encheres=?, date_fin_encheres=?, heure_fin_encheres=?, prix_initial=?, no_categorie=?, adresse_retrait=? WHERE no_article=?";
    private static final String SQL_DELETE = "DELETE FROM ARTICLES_VENDUS WHERE no_article=?";
    
    @Override
    public void insert(Article a, InputStream fichierInputStream) {
        Connection cnx = null;
        PreparedStatement rqt = null;
        ResultSet rs = null;
        try {
            cnx = JdbcTools.getConnection();
            rqt = cnx.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS);

            rqt.setString(1, a.getNomArticle());
            rqt.setString(2, a.getDesc());
            rqt.setObject(3, formatDate(a.getDateD()));  
            rqt.setObject(4, a.getHeureD());
            rqt.setObject(5, formatDate(a.getDateF()));  
            rqt.setObject(6, a.getHeureF());
            rqt.setInt(7, a.getPrixInit());
            rqt.setInt(8, a.getNumeroUtili());
            rqt.setInt(9, a.getNumeroCat());
            rqt.setString(10, a.getAdresseRetrait());

            if (fichierInputStream != null) 
            {
                String imgFileName = Paths.get(a.getImgFilePath()).getFileName().toString();
                enregistrerFichierPourArticle(fichierInputStream, a.getImgFilePath());
                rqt.setString(11, imgFileName);
                rqt.setString(12, a.getImgFilePath());
            } 
            else 
            {
                rqt.setString(11, null);
                rqt.setString(12, null);
            }

            rqt.executeUpdate();

            rs = rqt.getGeneratedKeys();
            if (rs.next()) 
            {
                a.setIdArticle(rs.getInt(1));
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        } 
        finally 
        {
            JdbcTools.closeResources(cnx, rqt, rs);
        }
    }

    private String formatDate(LocalDate date) {
        return (date != null) ? date.format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) : null;
    }

    @Override
    public List<Article> selectAll() {
        Connection cnx = null;
        List<Article> articles = new ArrayList<>();
        ResultSet rs = null;
        PreparedStatement rqt;
        try {
            cnx = JdbcTools.getConnection();
            rqt = cnx.prepareStatement(SQL_SELECT_ALL);
            rs = rqt.executeQuery();
            while (rs.next()) {
                Article a = new Article();
                a.setNoArticle(rs.getInt("no_article"));
                a.setNomArticle(rs.getString("nom_article"));
                a.setDesc(rs.getString("description"));
                a.setDateD(rs.getObject("date_debut_encheres", LocalDate.class));
                a.setHeureD(rs.getObject("heure_debut_encheres", LocalTime.class));
                a.setDateF(rs.getObject("date_fin_encheres", LocalDate.class));
                a.setHeureF(rs.getObject("heure_fin_encheres", LocalTime.class));
                a.setPrixInit(rs.getInt("prix_initial"));
                a.setNumeroCat(rs.getInt("no_categorie"));
                a.setAdresseRetrait(rs.getString("adresse_retrait"));

                // Ajout des informations sur l'image
                a.setImgFileName(rs.getString("img_FileName"));
                a.setImgFilePath(rs.getString("img_FilePath"));

                articles.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.closeResources(cnx, null, rs);
        }
        return articles;
    }
    
    @Override
    public void updateArticle(Article a, InputStream fichierInputStream) 
    {
        Connection cnx = null;
        PreparedStatement rqt;
        try 
        {
            cnx = JdbcTools.getConnection();
            rqt = cnx.prepareStatement(SQL_UPDATE);
            rqt.setString(1, a.getNomArticle());
            rqt.setString(2, a.getDesc());
            rqt.setObject(3, a.getDateD());
            rqt.setObject(4, a.getHeureD());
            rqt.setObject(5, a.getDateF());
            rqt.setObject(6, a.getHeureF());
            rqt.setInt(7, a.getPrixInit());
            rqt.setInt(8, a.getNumeroCat());
            rqt.setString(9, a.getAdresseRetrait());

            // Ajout des paramètres pour l'image
            rqt.setString(10, a.getImgFileName());
            rqt.setString(11, a.getImgFilePath());

            rqt.setInt(12, a.getIdArticle()); // Ajout du paramètre manquant
            rqt.executeUpdate();
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        } 
        finally 
        {
            try 
            {
                JdbcTools.closeConnection(cnx);
            } 
            catch (SQLException e) 
            {
                e.printStackTrace();
            }
        }
    }


    @Override
    public void delete(Article a) {
        Connection cnx = null;
        PreparedStatement rqt;
        try {
            cnx = JdbcTools.getConnection();
            rqt = cnx.prepareStatement(SQL_DELETE);
            rqt.setInt(1, a.getIdArticle());
            rqt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (cnx != null) {
                try {
                    JdbcTools.closeConnection(cnx);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public Article selectById(int itemId) {
        Connection cnx = null;
        PreparedStatement rqt = null;
        ResultSet rs = null;
        Article a = null;

        try {
            cnx = JdbcTools.getConnection();
            rqt = cnx.prepareStatement(SQL_SELECTBY_ID);
            rqt.setInt(1, itemId);
            rs = rqt.executeQuery();

            if (rs.next()) {
                a = new Article();
                a.setIdArticle(rs.getInt("id"));
                a.setNoArticle(rs.getInt("no_article"));
                a.setNomArticle(rs.getString("nom_article"));
                a.setDesc(rs.getString("description"));
                a.setDateD(rs.getObject("date_debut_encheres", LocalDate.class));
                a.setHeureD(rs.getObject("heure_debut_encheres", LocalTime.class));
                a.setDateF(rs.getObject("date_fin_encheres", LocalDate.class));
                a.setHeureF(rs.getObject("heure_fin_encheres", LocalTime.class));
                a.setPrixInit(rs.getInt("prix_initial"));
                a.setNumeroCat(rs.getInt("no_categorie"));
                a.setAdresseRetrait(rs.getString("adresse_retrait"));

                // Add image information
                a.setImgFileName(rs.getString("img_FileName"));
                a.setImgFilePath(rs.getString("img_FilePath"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.closeResources(cnx, rqt, rs);
        }

        return a;
    }
    
    @Override
    public List<Article> getMesArticles(int userId) {
        List<Article> mesArticles = new ArrayList<>();

        Connection cnx = null;
        PreparedStatement rqt = null;
        ResultSet rs = null;

        try {
            cnx = JdbcTools.getConnection();
            rqt = cnx.prepareStatement(SQL_SELECT_ALL_BY_USERID);
            rqt.setInt(1, userId);
            rs = rqt.executeQuery();

            while (rs.next()) {
                Article article = resultSetToArticle(rs);
                mesArticles.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.closeResources(cnx, rqt, rs);
        }

        return mesArticles;
    }

    // Méthode de conversion pour le ResultSet
    private Article resultSetToArticle(ResultSet rs) throws SQLException {
        Article article = new Article();
        article.setIdArticle(rs.getInt("no_article"));
        article.setNomArticle(rs.getString("nom_article"));
        article.setDesc(rs.getString("description"));
        article.setDateD(rs.getObject("date_debut_encheres", LocalDate.class));
        article.setHeureD(rs.getObject("heure_debut_encheres", LocalTime.class));
        article.setDateF(rs.getObject("date_fin_encheres", LocalDate.class));
        article.setHeureF(rs.getObject("heure_fin_encheres", LocalTime.class));
        article.setPrixInit(rs.getInt("prix_initial"));
        article.setNumeroCat(rs.getInt("no_categorie"));
        article.setAdresseRetrait(rs.getString("adresse_retrait"));

        // Add image information
        article.setImgFileName(rs.getString("img_FileName"));
        article.setImgFilePath(rs.getString("img_FilePath"));

        return article;
    }
    
    private void enregistrerFichierPourArticle(InputStream fichierInputStream, String cheminFichier) {
        try {
            Files.copy(fichierInputStream, Paths.get(cheminFichier), StandardCopyOption.REPLACE_EXISTING);
        } catch (Exception e) {
            e.printStackTrace(); // Gérer les exceptions de manière appropriée dans votre application
        }
    }
    
    @Override
    public Article selectByNoArt(Article article) {
        Connection cnx = null;
        PreparedStatement rqt = null;
        ResultSet rs = null;
        Article selectedArticle = null;

        try {
            cnx = JdbcTools.getConnection();
            String sqlQuery = "SELECT * FROM ARTICLES_VENDUS WHERE no_article = ? AND no_utilisateur = ?";
            rqt = cnx.prepareStatement(sqlQuery);
            rqt.setInt(1, article.getIdArticle());
            rqt.setInt(2, article.getNumeroUtili());
            rs = rqt.executeQuery();

            if (rs.next()) {
                selectedArticle = new Article();
                selectedArticle.setIdArticle(rs.getInt("no_article"));
                selectedArticle.setNomArticle(rs.getString("nom_article"));
                selectedArticle.setDesc(rs.getString("description"));
                selectedArticle.setDateD(rs.getObject("date_debut_encheres", LocalDate.class));
                selectedArticle.setHeureD(rs.getObject("heure_debut_encheres", LocalTime.class));
                selectedArticle.setDateF(rs.getObject("date_fin_encheres", LocalDate.class));
                selectedArticle.setHeureF(rs.getObject("heure_fin_encheres", LocalTime.class));
                selectedArticle.setPrixInit(rs.getInt("prix_initial"));
                selectedArticle.setNumeroCat(rs.getInt("no_categorie"));
                selectedArticle.setAdresseRetrait(rs.getString("adresse_retrait"));

                // Ajouter d'autres attributs si nécessaire
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.closeResources(cnx, rqt, rs);
        }

        return selectedArticle;
    }
    
    
    // Méthode pour récupérer un article par son identifiant
    public static Article getArticleById(int itemId) 
    {
    	Connection cnx = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Article item = null;
        
        try {
            // Récupérer une connexion à la base de données
        	cnx = JdbcTools.getConnection();

            
            // Définir la requête SQL pour récupérer l'article par son identifiant
            String query = "SELECT * FROM ARTICLES_VENDUS WHERE id = ?";
            
            // Préparer la déclaration SQL
            stmt = cnx.prepareStatement(query);
            stmt.setInt(1, itemId);
            
            // Exécuter la requête
            rs = stmt.executeQuery();
            
            // Vérifier si un enregistrement a été trouvé
            if (rs.next()) {
                // Créer un objet Article avec les informations récupérées de la base de données
            	item = new Article();
                item.setIdArticle(rs.getInt("id"));
                item.setNoArticle(rs.getInt("no_article"));
                item.setNomArticle(rs.getString("nom_article"));
                item.setDesc(rs.getString("description"));
                item.setDateD(rs.getObject("date_debut_encheres", LocalDate.class));
                item.setHeureD(rs.getObject("heure_debut_encheres", LocalTime.class));
                item.setDateF(rs.getObject("date_fin_encheres", LocalDate.class));
                item.setHeureF(rs.getObject("heure_fin_encheres", LocalTime.class));
                item.setPrixInit(rs.getInt("prix_initial"));
                item.setNumeroCat(rs.getInt("no_categorie"));
                item.setAdresseRetrait(rs.getString("adresse_retrait"));
                // Ajout des informations sur l'image
                item.setImgFileName(rs.getString("img_FileName"));
                item.setImgFilePath(rs.getString("img_FilePath"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.closeResources(cnx, stmt, rs);
        }
       
        return item;
    }


}
