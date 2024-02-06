<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>

<%@ page import="fr.eni.encheres.util.DateTimeFormatterUtil" %>

<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>

<html>

	<head>
	
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Modification des informations de mon Annonce</title>	    
 
	</head>
	
	<body>
	
	    <!-- Header -->
	    <%@ include file="includes/header.jsp" %>
	
	    <h2>- Modification de mon annonce -</h2>
	    
    <%
        String confirmationMessage = (String) request.getAttribute("MessConfirmModifAnnonce");
        if (confirmationMessage != null && !confirmationMessage.isEmpty()) {
    %>
            <div class="confirmation-message">
                <%= confirmationMessage %>
            </div>
    <% } %>
	    
    	<form action="UpdateItemServlet?idArticle=<%= request.getAttribute("no_article") %>" method="post"  enctype="multipart/form-data">
    	
	        <div class="form-container">
	
	            <!-- Begin Fieldset for Modification of an article -->
	            <fieldset class="itemToEdit">
	            
	                <legend class="infoItem">Informations sur l'article à vendre</legend>
	                
			        <p class="noArticleInfo">Numéro de l'article : <%= request.getAttribute("no_article") %></p>
			        <input type="number" id="noArticle" name="noArticle" value="<%= request.getAttribute("no_article") %>"required><br>
			        
			        <label class="additem" for="categories">Sélectionnez une catégorie :</label>
					<select name="noCategorie" id="noCategorie">
					    <!-- Utilisez la balise forEach pour parcourir la liste des catégories -->
					    <c:forEach var="category" items="${categoriesMap}">
					        <option value="${category.key}" <c:if test="${category.key eq no_categorie}">selected</c:if>>${category.value}</option>
					    </c:forEach>
					</select>			
			        
			        <label class="additem" for="newArticleName">Nom de l'article :</label>
			        <input type="text" id="newArticleName" name="newArticleName" value="<%= request.getAttribute("nom_article") %>" required><br>
			        
			        <label class="additem" for="newDescription">Description* :</label>
					<textarea id="newDescription" name="newDescription" rows="4" cols="50" required><%= request.getAttribute("description") %></textarea><br>
					

					<!-- HTML -->
					<div class="input-img-container">
						<label id="imgFileNameLabel">Votre image actuelle : <%= request.getAttribute("img_FilePath").toString() %></label>
						<input class="custom-file-upload" type="file" name="newImgFilePath" id="newImgFilePath" accept="<%= request.getAttribute("img_FilePath") %>" value="<%= request.getAttribute("img_FileName") %>">
						<div class="imgItemToModify-container">
							<img class="imgItemToModify" id="itemImg" src="<%= request.getAttribute("img_FilePath") %>">	
						</div>														
					</div>
	            </fieldset>
	            <!-- End Fieldset for Modification of an article -->
	            
	            <!-- Début Fieldset for News Auction Infos Dates -->
	            <fieldset class="itemToEdit">
	            
	                <legend class="infoItem">Détails de l'enchère</legend>
	
					<label class="additem" for="dateD">Date de début de l'enchère :</label>
					<input class="inputitem" type="date" id="newDateDebutEncheres" name="newDateDebutEncheres" value="<%= request.getAttribute("date_debut_encheres") %>">
					<label class="additem" for="heureD">Heure de début :</label>
					<input class="inputitem" type="time" id="newHeureDebutEncheres" name="newHeureDebutEncheres" value="<%= request.getAttribute("heure_debut_encheres") %>">
					<label class="additem" for="dateF">Date de fin de l'enchère :</label>
					<input class="inputitem" type="date" id="newDateFinEncheres" name="newDateFinEncheres" value="<%= request.getAttribute("date_fin_encheres") %>">
					<label class="additem" for="heureF">Heure de fin :</label>
					<input class="inputitem" type="time" id="newHeureFinEncheres" name="newHeureFinEncheres" value="<%= request.getAttribute("heure_fin_encheres") %>">
					
					<!--  <legend class="infoItem">Prix de départ et livraison</legend>	-->
	                <label class="additem" for="prixInit">Prix initial (point(s)) :</label>
	                <input class="inputitem" type="number" name="newPrixInitial" id="newPrixInitial" placeholder="point(s)" value="<%= request.getAttribute("prix_initial") %>" required>
	            	
	            	<label class="additem" for="adresseRetrait">Adresse de retrait (<em>Par défaut, celle de votre profil</em>) :</label>
	                <textarea name="newAdressRetrait" id="newAdressRetrait" rows="4" cols="50"><%= request.getAttribute("adresse_retrait") %></textarea>
	            	
	            </fieldset>
	            <!-- End Fieldset for News Auction Infos Dates -->
			
	        </div>
	            
			<!-- Confirmer les modifications -->
			<button class="updateitem" type="submit">Confirmer la Modification</button>
						  
    	</form>
    
		<!-- Retour sur la page user sans les modifications -->
		<a class="back" href="<%=request.getContextPath()%>/MyItemsServlet">Retour > Article(s) à Vendre</a>
	
	</body>

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>