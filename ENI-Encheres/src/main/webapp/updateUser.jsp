<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">		
		<title>Modification des informations de votre profil - ENI-Encheres</title>
	</head>
	    
    <%
	    // Récupération des valeurs des champs de mot de passe depuis la requête
	    String newPassword = request.getParameter("userPassword");
	    String confirmerNewPassword = request.getParameter("confirmerUserPassword");
	
	    if (newPassword != null && confirmerNewPassword != null) {
	        if (newPassword.equals(confirmerNewPassword)) {
	            out.println("Les mots de passe correspondent !");
	        } else {
	            out.println("Les mots de passe ne correspondent pas !");
	        }
	    }
	%>    

	<body>

		<!-- Header -->
		<%@ include file="includes/header.jsp" %>
	
		<h2>Modification de votre profil</h2>
		
		<div class="container">
		
			<form class="update-profil" method="post" action="UpdateUserServlet">
				
				Pseudo : 
				<input type="text" name="pseudo" value="<%= session.getAttribute("userPseudo") %>">
				
				Nom 
				<input type="text" name="nom" value="<%= session.getAttribute("userNom")%>">
				
				Prenom 
				<input type="text" name="prenom" value="<%= session.getAttribute("userPrenom")%>">
				
				Email 
				<input type="email" name="email" value="<%= session.getAttribute("userEmail")%>">
				
				Telephone 
				<input type="text" name="telephone" value="<%= session.getAttribute("userTelephone")%>">
				
				Rue 
				<input type="text" name="rue" value="<%= session.getAttribute("userRue")%>">
				
				Code Postal 
				<input type="text" name="codePostal" value="<%= session.getAttribute("userCodePostal")%>">
				
				Ville 
				<input type="text" name="ville" value="<%= session.getAttribute("userVille")%>">
				
				<label for="newPassword">Mot de passe :</label>
		        <input type="password" id="newPassword" name="newPassword" placeholder="Vide, si vous ne mofifiez pas le mot de passe">
				
		        <label for="confirmerNewPassword">Confirmer le mot de passe :</label>
		        <input type="password" id="confirmerNewPassword" name="confirmerNewPassword" placeholder="Vide, si vous ne mofifiez pas le mot de passe">
		        
				<!-- Retour sur la page user avec les modifications -->
				<input class="valider" type="submit" value="Valider">
		
				<!-- Retour sur la page user sans les modifications -->
		  		<a class="retour" href="<%=request.getContextPath()%>/userProfil.jsp"><button type="button">Retour</button></a>
		  	
			</form>
			
		</div>

	</body>

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>