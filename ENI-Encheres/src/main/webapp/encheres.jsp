<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.bll.CategorieManager" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>

<html lang="fr">
    
	<head>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="css/encheres.css" rel="stylesheet" />
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
	    
        <main>
        
	        <h2>Nos enchères en cours</h2>
	        
		    <form class="search-form" action="traitement_recherche.php" method="get">
		    
		        <input type="text" id="nom_article" name="nom_article" placeholder="Entrez le nom de l'article">
		
			       <select id="categorie" name="categorie" required>
			            <% List<String> categories = CategorieManager.getInstance().getValidCategories();
			            for (String category : categories) { %>
			            <option value="<%= category %>"><%= category %></option>
			            <% } %>
			        </select>
		
		        <input type="submit" value="Rechercher">
		        
		    </form>
		    
		    <br><br>
			<!-- /ENI-Encheres/ENI-Encheres/build/classes/fr/eni/encheres/ihm/resources/ -->
			<div class="image-container">
			
			    <img src="img/Article_001.png" alt="Image 1">
			    <img src="img/Article_002.png" alt="Image 2">
			    <img src="img/Article_003.png" alt="Image 3">
			    <br>
			   	<img src="img/Article_004.png" alt="Image 4">
			    <img src="img/Article_005.png" alt="Image 5">
			    <img src="img/Article_006.png" alt="Image 6">
			    
			</div>
			
        </main>
            
	</body>

</html>