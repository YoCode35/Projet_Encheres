<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>

<%@ page import="fr.eni.encheres.util.DateTimeFormatterUtil" %>

<!doctype html>

<html lang="fr">

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>

	<style>
		.slick-next:before {
			background: url(img/arrow_right.png) !important;
			background-size: contain !important;
		}
	
		.slick-prev:before {
			background: url(img/arrow_left.png) !important;
			background-size: contain !important;
		}       
	</style>

	<body>

		<!-- Header -->
		<%@ include file="includes/header.jsp" %>		

		<div class="container-h1">
			<div class="title-eni">
				<h1>Projet</h1>
			</div>
			<img class="logo-eni" src="img/logo-eni_(sepia).png" alt="Logo ENI">
		</div>
		
		<div class="welcome_message yellow_background">
		    		
	        <div class="slogan">
	            <p>Adjugé,</p>
	            <p>Enchères</p>
	            <p>vendu !</p>
	        </div>
	        
	        <img src="img/vendeur-aux-encheres_(200x273).png" alt="Vendeur-aux-enchères" class="img-vendeur">
        	
        	<p class="title_auction"><a class="consult_auction" href="NosEncheresServlet">Consultez nos enchères en cours</a></p>

	        <div class="slick-list">
	        
	            <c:if test="${not empty tousArticles}">
	            
	                <c:forEach var="article" items="${tousArticles}">
	                    
	                    <div class="slick-slider">
	                    
	                        <div class="items-info-index">	
	                                                
	                        	<div class="item-container">
	                        
								    <span class="container-image">
								        <img class="item-image" src="${article.getImgFilePath()}" alt="${article.getNomArticle()}">
								    </span>
		                            
		                            <h3 class="title-allItems"><a href="#"><c:out value='${article.nomArticle}' /></a></h3>
		                            
		                            <div class="descContent">
		                            	<p class="articleContent"><span class="title-detailItem">Description :</span> ${article.desc}</p>                            
									</div>
									
									<!-- Début Fieldset for Auction Information -->
									<fieldset class="auction-info-dates">
									
										<legend class="auction-time">Informations sur l'enchère en cours</legend>
									    
									    <div class="auctiontimeContent">
									    
										    <p class="articleContent">
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
										
											 <p class="countdown" data-end-date="${article.dateF} ${article.heureF}"></p>
										     
										     <p class="articleContent">   
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
										
										</div>
									
									</fieldset>
									<!-- Fin Fieldset for Auction Information -->
		                    
		                            <p class="articleContent"><span class="title-detailItem">Prix Initial :</span> ${article.prixInit} points</p>
		                            
		                            <div class="deliveryAdress">
		                            	<p class="articleContent"><span class="title-detailItem">Livraison (Adresse de retrait) :</span> ${article.adresseRetrait}</p>
		                            </div>
		                            
		                            <p class="readmore"><a href="#">En savoir + &raquo;</a></p>
	                            
	                        	</div>	  
	                        	                      
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

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>