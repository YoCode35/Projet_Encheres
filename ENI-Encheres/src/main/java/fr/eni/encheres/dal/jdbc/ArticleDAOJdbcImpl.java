package fr.eni.encheres.dal.jdbc;

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

    private static final String SQL_INSERT = "INSERT INTO ARTICLES_VENDUS (nom_article, description, date_debut_encheres, heure_debut_encheres, date_fin_encheres, heure_fin_encheres, prix_initial, no_utilisateur, no_categorie, adresse_retrait) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SQL_SELECTBY_ID = "SELECT no_article, nom_article, description, date_debut_encheres, heure_debut_encheres, date_fin_encheres, heure_fin_encheres, prix_initial, adresse_retrait FROM ARTICLES_VENDUS WHERE no_article=? ";
    private static final String SQL_SELECT_ALL = "SELECT no_article, nom_article, description, date_debut_encheres, heure_debut_encheres, date_fin_encheres, heure_fin_encheres, prix_initial, no_utilisateur, no_categorie, adresse_retrait FROM ARTICLES_VENDUS";
    private static final String SQL_SELECT_ALL_BY_USERID = "SELECT * FROM ARTICLES_VENDUS WHERE no_utilisateur = ?";
    private static final String SQL_UPDATE = "UPDATE ARTICLES_VENDUS SET nom_article=?, description=?, date_debut_encheres=?, heure_debut_encheres=?, date_fin_encheres=?, heure_fin_encheres=?, prix_initial=?, no_categorie=?, adresse_retrait=? WHERE no_article=?";
    private static final String SQL_DELETE = "DELETE FROM ARTICLES_VENDUS WHERE no_article=?";

    @Override
    public void insert(Article a) {
        Connection cnx = null;
        PreparedStatement rqt = null;
        ResultSet rs = null;
        try {
            cnx = JdbcTools.getConnection();
            rqt = cnx.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS);

            rqt.setString(1, a.getNomArticle());
            rqt.setString(2, a.getDesc());
            rqt.setObject(3, formatDate(a.getDateD()));  // Formatage de la date
            rqt.setObject(4, a.getHeureD());
            rqt.setObject(5, formatDate(a.getDateF()));  // Formatage de la date
            rqt.setObject(6, a.getHeureF());
            rqt.setInt(7, a.getPrixInit());
            rqt.setInt(8, a.getNumeroUtili());
            rqt.setInt(9, a.getNumeroCat());
            rqt.setString(10, a.getAdresseRetrait());
            rqt.executeUpdate();

            // Récupérer la clé générée (ID de l'article)
            rs = rqt.getGeneratedKeys();
            if (rs.next()) {
                a.setIdArticle(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcTools.closeResources(cnx, rqt, rs);
        }
    }

    // Nouvelle méthode pour formater la date
    private String formatDate(LocalDate date) {
        return date.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
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
                a.setIdArticle(rs.getInt("no_article"));
                a.setNomArticle(rs.getString("nom_article"));
                a.setDesc(rs.getString("description"));
                a.setDateD(rs.getObject("date_debut_encheres", LocalDate.class));
                a.setHeureD(rs.getObject("heure_debut_encheres", LocalTime.class));
                a.setDateF(rs.getObject("date_fin_encheres", LocalDate.class));
                a.setHeureF(rs.getObject("heure_fin_encheres", LocalTime.class));
                a.setPrixInit(rs.getInt("prix_initial"));
                a.setNumeroCat(rs.getInt("no_categorie"));
                a.setAdresseRetrait(rs.getString("adresse_retrait"));

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
    public void update(Article a) {
        Connection cnx = null;
        PreparedStatement rqt;
        try {
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
            rqt.setInt(10, a.getIdArticle()); // Ajout du paramètre manquant
            rqt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                JdbcTools.closeConnection(cnx);
            } catch (SQLException e) {
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
    public Article selectById(int articleId) {
        Connection cnx = null;
        PreparedStatement rqt = null;
        ResultSet rs = null;
        Article a = null;

        try {
            cnx = JdbcTools.getConnection();
            rqt = cnx.prepareStatement(SQL_SELECTBY_ID);
            rqt.setInt(1, articleId);
            rs = rqt.executeQuery();

            if (rs.next()) {
                a = new Article();
                a.setIdArticle(rs.getInt("no_article"));
                a.setNomArticle(rs.getString("nom_article"));
                a.setDesc(rs.getString("description"));
                a.setDateD(rs.getObject("date_debut_encheres", LocalDate.class));
                a.setHeureD(rs.getObject("heure_debut_encheres", LocalTime.class));
                a.setDateF(rs.getObject("date_fin_encheres", LocalDate.class));
                a.setHeureF(rs.getObject("heure_fin_encheres", LocalTime.class));
                a.setPrixInit(rs.getInt("prix_initial"));
                a.setNumeroCat(rs.getInt("no_categorie"));
                a.setAdresseRetrait(rs.getString("adresse_retrait"));
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
    private static Article resultSetToArticle(ResultSet resultSet) throws SQLException {
        Article a = new Article();

        a.setIdArticle(resultSet.getInt("no_article"));
        a.setNomArticle(resultSet.getString("nom_article"));
        a.setDesc(resultSet.getString("description"));
        a.setDateD(resultSet.getObject("date_debut_encheres", LocalDate.class));
        a.setDateF(resultSet.getObject("date_fin_encheres", LocalDate.class));
        a.setPrixInit(resultSet.getInt("prix_initial"));
        a.setNumeroUtili(resultSet.getInt("no_utilisateur"));
        a.setNumeroCat(resultSet.getInt("no_categorie"));
        a.setHeureD(resultSet.getObject("heure_debut_encheres", LocalTime.class));
        a.setHeureF(resultSet.getObject("heure_fin_encheres", LocalTime.class));
        a.setAdresseRetrait(resultSet.getString("adresse_retrait"));

        return a;
    }
}
