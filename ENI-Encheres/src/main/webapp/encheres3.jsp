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
	    
	        <h2>Nos enchères en cours</h2>
	        
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
		
	        <c:if test="${not empty mesArticles}">
	        
	            <table class="styled-table">
	            
	                <thead>
	                    <!-- ... (en-têtes de colonnes) ... -->
	                    <tr>
		                    <th>ID Article</th>
		                    <th>N° Vendeur</th>
		                    <th>Nom Article</th>
		                    <th>Description</th>
		                    <th>Date de début</th>
		                    <th>Heure de début</th>
		                    <th>Date de fin</th>
		                    <th>Heure de fin</th>
		                    <th>Prix Initial</th>
		                    <th>Adresse de retrait</th>
	                	</tr>
	            	</thead>
	            
	            	<tbody>
	                	<c:forEach var="article" items="${mesArticles}">
	                    	<tr>
		                        <td>${article.idArticle}</td>
		                        <td>${article.numeroUtili}</td>
		                        <td>${article.nomArticle}</td>
		                        <td>${article.desc}</td>
		                        <td>${article.dateD}</td>
		                        <td>${article.heureD}</td>
		                        <td>${article.dateF}</td>
		                        <td>${article.heureF}</td>
		                        <td>${article.prixInit}</td>
		                        <td>${article.adresseRetrait}</td>
	                    	</tr>
	                	</c:forEach>
	            	</tbody>
	            
	        	</table>
	        
	        </c:if>
			
        </main>
            
	</body>

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>