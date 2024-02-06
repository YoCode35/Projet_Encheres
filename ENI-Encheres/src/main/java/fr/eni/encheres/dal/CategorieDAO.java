package fr.eni.encheres.dal;

import java.util.List;

import fr.eni.encheres.bo.Categorie;

public interface CategorieDAO {

	/**
	 * Permet de récupérer la liste des Catégories (libellé).
	 * 
	 * @return la liste
	 */
	public List<String> getValidCategories();

	/**
	 * Permet de récupérer l'ID de la Catégorie via un Libellé.
	 * 
	 * @param categorieLabel
	 * @return ID de la catégorie
	 */
	public int getCategorieIdByLabel(String categorieLabel);
	
    /**
     * Récupère une catégorie par son ID.
     * 
     * @param idCategories l'ID de la catégorie à récupérer
     * @return la catégorie correspondante
     */
    public Categorie getCategoryById(int idCategories);
    
    String getCategoryNameById(int id);
}
