<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="fr.eni.encheres.bo.Article" %>

<!DOCTYPE html>

<html lang="fr">

	<head>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Mes articles à vendre</title>
	</head>

	<body>	

		<!-- Header -->
		<%@ include file="includes/header.jsp" %>
        
	        <h2>Mes articles à vendre</h2>
	        
		<main>

	        <div class="myItems-container">
	        
	            <c:if test="${not empty mesArticles}">
	            
	                <c:forEach var="article" items="${mesArticles}">
	                    
	                        <div class="myItems-info">
	                        
	                            <!-- Texte simple pour représenter l'image -->                            
	                            <span>Image Placeholder</span>
	                            
	                            <h3 class="myItems"><a href="#"><c:out value='${article.nomArticle}' /></a></h3>
	                            
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
	        		
	
	        <%-- Vérifier si la liste d'articles n'est pas null avant de l'afficher --%>
	        <c:if test="${not empty mesArticles}">
	        
	            <table class="styled-table">
	            
	                <thead>
	                    <!-- ... (en-têtes de colonnes) ... -->
	                    <tr>
		                    <th>ID Article</th>
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

    	<!-- Log pour vérifier si la liste d'articles est correctement transmise à la JSP -->
    	<%
	        System.out.println("Liste d'articles dans la JSP : ");
	        List<Article> articles = (List<Article>) request.getAttribute("mesArticles");
	        if (articles != null) {
	            for (Article article : articles) {
	                System.out.println(article);
	            }
	        } else {
	            System.out.println("La liste d'articles est null.");
	        }
    	%>

	</body>

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>