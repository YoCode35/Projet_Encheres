package fr.eni.encheres.dal.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import fr.eni.encheres.bo.Categorie;
import fr.eni.encheres.dal.CategorieDAO;

public class CategorieDAOJdbcImpl implements CategorieDAO {

	private static final String SQL_SELECTBY_LIBELLE = "SELECT no_categorie FROM CATEGORIES WHERE libelle = ?";

	private static final String SQL_SELECT_LIBELLE = "SELECT libelle FROM CATEGORIES";
	
	private static final String SQL_SELECTBY_ID = "SELECT libelle FROM CATEGORIES WHERE no_categorie = ?";

	/**
	 * Permet de récupérer la liste des Catégories (libellé).
	 * 
	 * @return la liste
	 */
	@Override
	public List<String> getValidCategories() {
		List<String> categories = new ArrayList<>();
		Connection cnx = null;
		PreparedStatement rqt = null;
		ResultSet rs = null;

		try {
			cnx = JdbcTools.getConnection();
			rqt = cnx.prepareStatement(SQL_SELECT_LIBELLE);
			rs = rqt.executeQuery();

			while (rs.next()) {
				String categoryLabel = rs.getString("libelle");
				categories.add(categoryLabel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcTools.closeResources(cnx, rqt, rs);
		}
		return categories;
	}

	/**
	 * Permet de récupérer l'ID de la Catégorie via un Libellé.
	 * 
	 * @param categoryLabel
	 * @return ID de la catégorie
	 */
	@Override
	public int getCategorieIdByLabel(String categorieLabel) {
		Connection cnx = null;
		PreparedStatement rqt = null;
		ResultSet rs = null;
		int categoryId = -1;

		try {
			cnx = JdbcTools.getConnection();
			rqt = cnx.prepareStatement(SQL_SELECTBY_LIBELLE);
			rqt.setString(1, categorieLabel);
			rs = rqt.executeQuery();

			if (rs.next()) {
				categoryId = rs.getInt("no_categorie");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcTools.closeResources(cnx, rqt, rs);
		}
		return categoryId;
	}
	
	@Override
	public Categorie getCategoryById(int idCategories) {
	    Categorie categorie = null;
	    Connection cnx = null;
	    PreparedStatement rqt = null;
	    ResultSet rs = null;

	    try {
	        cnx = JdbcTools.getConnection();
	        rqt = cnx.prepareStatement(SQL_SELECTBY_ID);
	        rqt.setInt(1, idCategories);
	        rs = rqt.executeQuery();

	        if (rs.next()) {
	            int categoryId = rs.getInt("idCategories");
	            String libelle = rs.getString("libelle");
	            categorie = new Categorie(categoryId, libelle);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JdbcTools.closeResources(cnx, rqt, rs);
	    }
	    return categorie;
	}
	
	@Override
	public String getCategoryNameById(int id) {
	    String categoryName = null;
	    Connection cnx = null;
	    PreparedStatement rqt = null;
	    ResultSet rs = null;

	    try {
	        cnx = JdbcTools.getConnection();
	        rqt = cnx.prepareStatement(SQL_SELECTBY_ID);
	        rqt.setInt(1, id);
	        rs = rqt.executeQuery();

	        if (rs.next()) {
	            categoryName = rs.getString("libelle"); // Récupération du libellé de la catégorie
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JdbcTools.closeResources(cnx, rqt, rs);
	    }
	    return categoryName;
	}



}
