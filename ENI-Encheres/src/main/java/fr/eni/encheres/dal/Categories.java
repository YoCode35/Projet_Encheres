package fr.eni.encheres.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Categories 
{
    private static final String URL = "jdbc:sqlserver://localhost;databasename=ENCHERES_DB;encrypt=false;trustservercertificate=true";
    private static final String USER = "sa";
    private static final String PASSWORD = "Pa$$word";

    public List<String> getCategories() {
        List<String> categories = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            String sql = "SELECT libelle FROM CATEGORIES";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String category = resultSet.getString("libelle");
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return categories;
    }
    
    public Map<Integer, String> getCategoriesWithNumbers() {
        Map<Integer, String> categories = new HashMap<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            String sql = "SELECT no_categorie, libelle FROM CATEGORIES";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int no_categorie = resultSet.getInt("no_categorie");
                String libelle = resultSet.getString("libelle");
                categories.put(no_categorie, libelle);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return categories;
    }
    
    public List<Integer> getCategorieNumbers() {
        List<Integer> categorieNumbers = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            String sql = "SELECT no_categorie FROM CATEGORIES";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int no_categorie = resultSet.getInt("no_categorie");
                categorieNumbers.add(no_categorie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return categorieNumbers;
    }
}
