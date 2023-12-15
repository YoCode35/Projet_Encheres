<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="fr">
	
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="css/form_userProfil.css" rel="stylesheet" />
	    <title>Plateforme d'enchères d'objets de seconde main - ENI Enchères</title>
	</head>
	
	<!-- Header -->
	<%@ include file="includes/header.jsp" %>
	
	<body>
		
	<h2>Mon Profil</h2>
	
	<form method="get" action="UserProfilServlet">					<!-- Affiche le profil Utilisateur -->
	
		Compte n° : <%=session.getAttribute("userID") %>
		<br/>
		Pseudo : <%= session.getAttribute("userPseudo") %>
		<br/>
		Nom : <%=session.getAttribute("userNom") %>
		<br/>
		Prenom : <%=session.getAttribute("userPrenom") %>
		<br/>
		Email : <%=session.getAttribute("userEmail") %>
		<br/>
		Telephone : <%=session.getAttribute("userTelephone") %>
		<br/>
		Rue : <%=session.getAttribute("userRue") %>
		<br/>
		Code Postal : <%=session.getAttribute("userCodePostal") %>
		<br/>
		Ville : <%=session.getAttribute("userVille") %>
		<br/>
		Credit : <%=session.getAttribute("userCredit") %>
		<br/>
		Adresse de Livraison : <%=session.getAttribute("userCoordonnees") %>
		<br/>
		<!-- "UPDATE" Renvoie à la Servlet pour faire l'UPDATE -->
        <a href="<%=request.getContextPath()%>/updateUser.jsp"><input type="submit" value="Modifier mon Compte"/></a>
        
    </form>
	
	<form method="get" action="UserDeleteConfirmationServlet">
	
	<!-- Supprime le profil Utilisateur de la base de donnée -->
	<a href="<%=request.getContextPath()%>/userDeleteConfirmation.jsp">Supprimer mon compte</a>
	
	</form>
</body>

</html>