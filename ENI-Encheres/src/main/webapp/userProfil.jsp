<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="fr">
	
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">	    		
	    <title>Plateforme d'enchères d'objets de seconde main - ENI Enchères</title>
	</head>
	
	<!-- Header -->

	
	<body>
	
		<%@ include file="includes/header.jsp" %>
		
		<h2>Mon Profil</h2>
		
		<div class="profile-information">		
		
			<div class="user-details">
				<span class="title-vwdMyProfile">Compte n° :</span> <%=session.getAttribute("userID") %>
			</div>
			
			<div class="user-details">
				<span class="title-vwdMyProfile">Pseudo</span> : <%= session.getAttribute("userPseudo") %>
			</div>
			
			<div class="user-details">
				<span class="title-vwdMyProfile">Nom :</span> <%=session.getAttribute("userNom") %>
			</div>
			
			<div class="user-details">
				<span class="title-vwdMyProfile">Prenom :</span> <%=session.getAttribute("userPrenom") %>
			</div>
			
			<div class="user-details">
				<span class="title-vwdMyProfile">Email :</span> <%=session.getAttribute("userEmail") %>
			</div>
			
			<div class="user-details">
				<span class="title-vwdMyProfile">Telephone :</span> <%=session.getAttribute("userTelephone") %>
			</div>
			
			<div class="user-details">
				<span class="title-vwdMyProfile">Rue :</span> <%=session.getAttribute("userRue") %>
			</div>
			
			<div class="user-details">
				<span class="title-vwdMyProfile">Code Postal :</span> <%=session.getAttribute("userCodePostal") %>
			</div>
			
			<div class="user-details">
				<span class="title-vwdMyProfile">Ville :</span> <%=session.getAttribute("userVille") %>
			</div>
			
			<div class="user-details">
				<span class="title-vwdMyProfile">Credit :</span> <%=session.getAttribute("userCredit") %>
			</div>
			
			<div class="user-details">
				<span class="title-vwdMyProfile">Adresse de Livraison :</span> <%=session.getAttribute("userCoordonnees") %>
			</div>
			
			<!-- "UPDATE" Renvoie à la Servlet pour faire l'UPDATE -->
	        <a class="edit-account" href="<%=request.getContextPath()%>/updateUser.jsp"><button type="button">Modifier mon Compte</button></a>
			
			<!-- Supprime le profil Utilisateur de la base de donnée -->
			<a class="delete-account" href="<%=request.getContextPath()%>/userDeleteConfirmation.jsp">Supprimer mon compte</a>
		
		</div>
		
	</body>

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>