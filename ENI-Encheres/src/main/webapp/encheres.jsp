<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>

<%@ page import="fr.eni.encheres.util.DateTimeFormatterUtil" %>

<%@ page import="fr.eni.encheres.bll.CategorieManager" %>

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
	                    
	                </c:forEach>
	                
	            </c:if>
	            
	        </div><!-- @end .items-container -->
	        		
        </main>

	</body>

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>