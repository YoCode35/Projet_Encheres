<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.bll.CategorieManager" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>

<html lang="fr">
    
	<head>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    	    
	    <title>Nos Enchères en cours</title>
	</head>
	
	<body>

		<!-- Header -->
		<%@ include file="includes/header.jsp" %>
		
	    <% 
	        // Vérifie si l'utilisateur est connecté
	        Boolean userConnected = (Boolean) session.getAttribute("userConnected");
	        if (userConnected != null && userConnected) {
	
	        } 
	    %>
	    
	        <h2>- Nos enchères en cours -</h2>
	        
	        <div class="form-container">
	        
			    <form class="search" action="traitement_recherche.php" method="get">
			    
			        <input type="text" id="nom_article" name="nom_article" placeholder="Entrez le nom de l'article">
			
				    <select id="categorie" name="categorie" required>
						<% 
							List<String> categories = CategorieManager.getInstance().getValidCategories();
							for (String category : categories)
							{ 
						%>
						<option value="<%= category %>"><%= category %></option>
				        <% } %>
					</select>
			
			        <button type="submit" class="search-btn">Rechercher</button>
			        
			    </form>
			    
		    </div>
		    
		<main>

	        <div class="items-container">
	        
	            <c:if test="${not empty tousArticles}">
	            
	                <c:forEach var="article" items="${tousArticles}">
	                    
	                        <div class="item-info-allAuctions">
	                        
	                            <!-- Texte simple pour représenter l'image -->                            
	                            <span>Image Placeholder</span>
	                            
	                            <h3 class="title-allItems"><a href="#"><c:out value='${article.nomArticle}' /></a></h3>
	                            
	                            <p class="indexItem"><span class="title-detailItem">Description :</span> ${article.desc}</p>
	                            
				                <!-- Fieldset for Auction Information -->
				                <fieldset class="auction-info-dates">
									<legend>Informations d'enchère</legend>
				                    <p class="indexItem"><span class="title-detailItem">Début de l'enchère :</span> ${article.dateD} à  ${article.heureD}</p>
				                    <p class="indexItem"><span class="title-detailItem">Fin de l'enchère :</span> ${article.dateF} à ${article.heureF}</p>
								</fieldset>
									
	                            <p class="indexItem"><span class="title-detailItem">Prix Initial :</span> ${article.prixInit} €</p>
	                            <p class="indexItem"><span class="title-detailItem">Livraison (Adresse de retrait) :</span> ${article.adresseRetrait}</p>
	                            
	                            <p class="readmore"><a href="#">En savoir + &raquo;</a></p>
	                            
	                        </div>
	                    
	                </c:forEach>
	                
	            </c:if>
	            
	        </div><!-- @end .items-container -->
	        		
        </main>
            
	</body>

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>