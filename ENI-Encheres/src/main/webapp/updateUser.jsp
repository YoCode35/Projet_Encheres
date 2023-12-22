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
		
		<div class="form-container">
		
			<form class="update-profil" method="post" action="UpdateUserServlet">
				
				<label class="update-user" for="nomArticle">Pseudo :</label> 
				<input type="text" name="pseudo" value="<%= session.getAttribute("userPseudo") %>">
				
				<label class="update-user" for="nomArticle">Nom</label> 
				<input type="text" name="nom" value="<%= session.getAttribute("userNom")%>">
				
				<label class="update-user" for="nomArticle">Prenom</label>
				<input type="text" name="prenom" value="<%= session.getAttribute("userPrenom")%>">
				
				<label class="update-user" for="nomArticle">Email</label> 
				<input type="email" name="email" value="<%= session.getAttribute("userEmail")%>">
				
				<label class="update-user" for="nomArticle">Telephone</label> 
				<input type="text" name="telephone" value="<%= session.getAttribute("userTelephone")%>">
				
				<label class="update-user" for="nomArticle">Rue</label> 
				<input type="text" name="rue" value="<%= session.getAttribute("userRue")%>">
				
				<label class="update-user" for="nomArticle">Code Postal</label> 
				<input type="text" name="codePostal" value="<%= session.getAttribute("userCodePostal")%>">
				
				<label class="update-user" for="nomArticle">Ville</label> 
				<input type="text" name="ville" value="<%= session.getAttribute("userVille")%>">
				
				<label class="update-user" for="newPassword">Mot de passe :</label>
		        <input type="password" id="newPassword" name="newPassword" placeholder="Vide, si vous ne mofifiez pas le mot de passe">
				
		        <label class="update-user" for="confirmerNewPassword">Confirmer le mot de passe :</label>
		        <input type="password" id="confirmerNewPassword" name="confirmerNewPassword" placeholder="Vide, si vous ne mofifiez pas le mot de passe">
		        
				<!-- Retour sur la page user avec les modifications -->
				<button class="confirm" type="submit">Confirmer la Modification</button>
		
				<!-- Retour sur la page user sans les modifications -->
		  		<a class="retour" href="<%=request.getContextPath()%>/userProfil.jsp"><button type="button">Retour</button></a>
		  	
			</form>
			
		</div>

	</body>

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>