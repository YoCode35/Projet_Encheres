<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>

<!doctype html>

<html lang="fr">

	<head>
		<link href="css/itemsIndex.css" rel="stylesheet" />
	</head>

<style>
         .slick-next:before {
            background: url(img/arrow_right_light.png) !important;
            background-size: contain !important;
        }

        .slick-prev:before {
            background: url(img/arrow_left_light.png) !important;
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

        	
        	<p class="title_encheres"><a class="consult_encheres" href="encheres.jsp">Consultez nos enchères en cours</a></p>		
		


	        <div class="slick-list">
	        
	            <c:if test="${not empty tousArticles}">
	            
	                <c:forEach var="article" items="${tousArticles}">
	                    
	                    <div class="slider">
	                    
	                        <div class="article-info">
	                        
	                            <!-- Texte simple pour représenter l'image -->                            
	                            <span>Image Placeholder</span>
	                            
	                            <h3><a href="#"><c:out value='${article.nomArticle}' /></a></h3>
	                            <p class="indexItem"><span class="title-detailItem">Description :</span> ${article.desc}</p>
	                            <p class="indexItem"><span class="title-detailItem">Début de l'enchère :</span> ${article.dateD}</p>
	                            <p class="indexItem"><span class="title-detailItem">Heure :</span> ${article.heureD}</p>
	                            <p class="indexItem"><span class="title-detailItem">Fin de l'enchère :</span> ${article.dateF}</p>
	                            <p class="indexItem"><span class="title-detailItem">Heure :</span> ${article.heureF}</p>
	                            <p class="indexItem"><span class="title-detailItem">Prix Initial :</span> ${article.prixInit}</p>
	                            <p class="indexItem"><span class="title-detailItem">Livraison (Adresse de retrait) :</span> ${article.adresseRetrait}</p>
	                            
	                        </div>
	                        
	                        <p class="readmore"><a href="#">En savoir + &raquo;</a></p>
	                        
	                    </div><!-- post -->
	                    
	                </c:forEach>
	                
	            </c:if>
	            
	        </div><!-- @end .crsl-items -->

		</div>
		
	    <script type="text/javascript">
	        $('.slick-list').slick({
	            infinite: true,
	            slidesToShow: 3,
	            slidesToScroll: 3,
	            arrows: true,         //arrows both sides of slide
	        });
	    </script>
    
	</body>
	
</html>