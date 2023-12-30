<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="fr.eni.encheres.util.DateTimeFormatterUtil" %>

<%@ page import="java.util.List" %>

<!doctype html>

<html lang="fr">

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>

	<style>
		.slick-next:before {
			background: url(img/arrow_right_02.png) !important;
			background-size: contain !important;
		}
	
		.slick-prev:before {
			background: url(img/arrow_left_02.png) !important;
			background-size: contain !important;
		}       
	</style>

	<body>

		<!-- Header -->
		<%@ include file="includes/header.jsp" %>
		
		<div class="welcome_message yellow_background">
	    
	        <div class="slogan">
	            <p>Adjugé,</p>
	            <p>Enchères</p>
	            <p>vendu !</p>
	        </div>
        	
        	<p class="title_auction"><a class="consult_auction" href="NosEncheresServlet">Consultez nos enchères en cours</a></p>

	        <div class="slick-list">
	        
	            <c:if test="${not empty tousArticles}">
	            
	                <c:forEach var="article" items="${tousArticles}">
	                    
	                    <div class="slick-slider">
	                    
	                        <div class="items-info-index">
	                        
	                            <!-- Texte simple pour représenter l'image -->                            
	                            <span>Image Placeholder</span>
	                            
	                            <h3 class="title-allItems"><a href="#"><c:out value='${article.nomArticle}' /></a></h3>
	                            
	                            <p class="indexItem"><span class="title-detailItem">Description :</span> ${article.desc}</p>
	                            
								<!-- Fieldset for Auction Information -->
								<fieldset class="auction-info-dates">
								    <legend>Informations d'enchère</legend>
								    <p class="indexItem">
								        <span class="title-detailItem">Début de l'enchère :</span>
								        Le 
								        <fmt:parseDate value="${article.dateD}" var="parsedDate" pattern="yyyy-MM-dd" />
								        <fmt:formatDate value="${parsedDate}" var="formattedDate" pattern="dd-MM-yyyy" />
								        ${formattedDate}
								        à
								        <fmt:parseDate value="${article.heureD}" var="parsedTime" pattern="HH:mm" />
								        <fmt:formatDate value="${parsedTime}" var="formattedTime" pattern="HH:mm" />
								        ${formattedTime}
								     </p>
								     <p class="indexItem">   
								        <span class="title-detailItem">Fin de l'enchère :</span> 
								        Le
								        <fmt:parseDate value="${article.dateF}" var="parsedDate" pattern="yyyy-MM-dd" />
								        <fmt:formatDate value="${parsedDate}" var="formattedDate" pattern="dd-MM-yyyy" />
								        ${formattedDate}
								        à
								        <fmt:parseDate value="${article.heureF}" var="parsedTime" pattern="HH:mm" />
								        <fmt:formatDate value="${parsedTime}" var="formattedTime" pattern="HH:mm" />
								        ${formattedTime}
								    </p>
								</fieldset>
	                    
	                            <p class="indexItem"><span class="title-detailItem">Prix Initial :</span> ${article.prixInit} €</p>
	                            <p class="indexItem"><span class="title-detailItem">Livraison (Adresse de retrait) :</span> ${article.adresseRetrait}</p>
	                            
	                            <p class="readmore"><a href="#">En savoir + &raquo;</a></p>
	                            
	                        </div>	                        
	                        
	                    </div><!-- post -->
	                    
	                </c:forEach>
	                
	            </c:if>
	            
	        </div><!-- @end .slick-list -->

		</div>

	    <script type="text/javascript">
	        $('.slick-list').slick({
	            infinite: true,
	            slidesToShow: 3,
	            slidesToScroll: 3,	            
	        });
	    </script>
    
	</body>
	
</html>