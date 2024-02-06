package fr.eni.encheres.bll;

import java.io.InputStream;

import java.util.List;

import fr.eni.encheres.bo.Article;
import fr.eni.encheres.dal.ArticleDAO;
import fr.eni.encheres.dal.DAOFactory;

public class ArticleManager 
{
	private static ArticleManager instance;
	private ArticleDAO articleDAO;
	
	
	private ArticleManager() 
	{
		articleDAO = DAOFactory.getArticleDAO();
	}

	/**
	 * Obtenir l'instance unique
	 * @return
	 */
	public static ArticleManager getInstance() 
	{
		if(instance == null) 
		{			
			instance = new ArticleManager();
		}
		return instance;
	}

	/**
	 * Ajouter un article
	 * @param a
	 */
    public void ajouterArticle(Article a, InputStream fichierInputStream) 
    {
        articleDAO.insert(a, fichierInputStream);
	}

	//Selection article par ID
	/**
	 * Selection article par ID
	 * @param articleId L'ID de l'article à sélectionner
	 * @return L'article correspondant à l'ID
	 */
	public Article selectById(int itemId) 
	{
	    return articleDAO.selectById(itemId);
	}

	//Selection de la liste de tous les articles
	/**
	 * Selection de la liste de tous les articles
	 * @return
	 */
	public List<Article> selectAll () 
	{
		return articleDAO.selectAll();
	}

	//Modification d'un article
	/**
	 * Modification d'un article
	 * @param a
	 */
	public void updateArticle(Article updatedArticle, InputStream imageInputStream) 
	{
	    ArticleDAO articleDAO = DAOFactory.getArticleDAO();
	    articleDAO.updateArticle(updatedArticle, imageInputStream);
	}
	
	//Suppression d'un article
	/**
	 * Suppression d'un article
	 * @param a
	 */
	public void deleteArticle(Article article) 
	{
	    // Implémentez la logique pour supprimer l'article de votre système de stockage
	    // Par exemple, vous pouvez utiliser votre ArticleDAO pour effectuer la suppression
	    ArticleDAO articleDAO = DAOFactory.getArticleDAO();
	    articleDAO.delete(article);
	}
	
	/**
	 * Permet la sélection de tous les articles d'un utilisateur à partir de son ID.
	 * @param userId
	 * @return la liste des articles
	 */
	public List<Article> getMesArticles(int userId)
	{
		return articleDAO.getMesArticles(userId);
	}
}