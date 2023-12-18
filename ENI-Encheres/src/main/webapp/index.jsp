<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>

<html lang="fr">

	<head>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="css/index.css">
	    <link rel="stylesheet" href="css/itemsIndex.css">
	    <title>Votre Plateforme d'enchères</title>
	</head>
	
	<%@ include file="includes/header.jsp" %>
	
	<body>
	
	    <div class="welcome_message yellow_background">
	    
	        <div class="slogan">
	            <p>Adjugé,</p>
	            <p>Enchères</p>
	            <p>vendu !</p>
	        </div>
	        
        	<main>
        	
        		<p class="title_encheres"><a class="consult_encheres" href="encheres.jsp">Consultez nos enchères en cours</a></p>

		        <%-- Vérifier si la liste d'articles n'est pas null avant de l'afficher --%>
				<c:if test="${not empty tousArticles}">
		
			        	<table class="styled-table">
			                
			                <thead>
			                    <!-- ... (en-têtes de colonnes) ... -->
			                    <tr>
		
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
								<c:forEach var="article" items="${tousArticles}">
									<tr>
		
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
		
		        <div class="image-container_items">
		            <img src="img/Liste_Articles-fictifs_fd-transp.png" alt="Votre Image">
		        </div>
	        
	        </main>
	        
	    </div>
	
	</body>

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>