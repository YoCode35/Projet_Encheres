<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="fr">

	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="css/success_messages.css" rel="stylesheet" />
	    <title>Confirmation de modification de l'article</title>
	
	    <script>
	        // Redirection vers la servlet UpdateItemServlet avec l'id de l'article après 3 secondes
	        setTimeout(function() {
	            // Récupérer le numéro d'article depuis la page JSP
	            var noArticle = <%= request.getAttribute("no_article") != null ? request.getAttribute("no_article") : -1 %>;
	            if (noArticle !== -1) {
	                window.location.href = "UpdateItemServlet?idArticle=" + noArticle;
	            }
	        }, 1500); // 3 secondes
	    </script>
	
	</head>
	
	<body>
	
	    <%
	        String confirmationMessage = (String) request.getAttribute("MessConfirmModifAnnonce");
	        if (confirmationMessage != null && !confirmationMessage.isEmpty()) {
	    %>
			<div class="confirmation-message">
				<%= confirmationMessage %>
			</div>
	    <% } %>
	
	</body>

</html>
