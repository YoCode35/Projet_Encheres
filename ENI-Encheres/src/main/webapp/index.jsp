<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>

<html lang="fr">

	<head>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Votre Plateforme d'enchères</title>
	</head>
	
	<body>
	
		<!-- Header -->
		<%@ include file="includes/header.jsp" %>
	
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
				    <div class="container">
				        <c:forEach var="article" items="${tousArticles}">
				            <div class="text-cell">
				                <div class="article-info">
					                <p><span class="title-detailItem">Type d'Article :</span> ${article.nomArticle}</p>
					                <p><span class="title-detailItem">Description :</span> ${article.desc}</p>
					                <p><span class="title-detailItem">Début de l'enchère :</span> ${article.dateD}</p>
					                <p><span class="title-detailItem">Heure :</span> ${article.heureD}</p>
					                <p><span class="title-detailItem">Fin de l'enchère :</span> ${article.dateF}</p>
					                <p><span class="title-detailItem">Heure :</span> ${article.heureF}</p>
					                <p><span class="title-detailItem">Prix Initial :</span> ${article.prixInit}</p>
					                <p><span class="title-detailItem">Livraison (Adresse de retrait) :</span> ${article.adresseRetrait}</p>
				                </div>
				            </div>
				        </c:forEach>
				    </div>
				</c:if>
	        
	        </main>
	        
	    </div>
	
	</body>

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>