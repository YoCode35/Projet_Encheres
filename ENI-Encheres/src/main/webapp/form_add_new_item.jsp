<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="fr.eni.encheres.bll.CategorieManager" %>

<!DOCTYPE html>

<html lang="fr">

	<head>
	
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Ajouter un nouvel article</title>
	
	    <script>
	        document.addEventListener("DOMContentLoaded", function () {
	        // Récupérer les champs du formulaire
	        var nomArticleInput = document.getElementById("nomArticle");
	        var descInput = document.getElementById("desc");
	        var categorieInput = document.getElementById("categorie");
	        var dateDInput = document.getElementById("dateD");
	        var heureDInput = document.getElementById("heureD");
	        var dateFInput = document.getElementById("dateF");
	        var heureFInput = document.getElementById("heureF");
	        var prixInitInput = document.getElementById("prixInit");
	
	        // Charger les données du localStorage si elles existent
	        nomArticleInput.value = localStorage.getItem("nomArticle") || "";
	        descInput.value = localStorage.getItem("desc") || "";
	        categorieInput.value = localStorage.getItem("categorie") || "";
	        dateDInput.value = localStorage.getItem("dateD") || "";
	        heureDInput.value = localStorage.getItem("heureD") || "";
	        dateFInput.value = localStorage.getItem("dateF") || "";
	        heureFInput.value = localStorage.getItem("heureF") || "";
	        prixInitInput.value = localStorage.getItem("prixInit") || "";
	
	        // Ajouter des écouteurs d'événements pour détecter les changements dans les champs
	        nomArticleInput.addEventListener("input", function () 
			{
		        localStorage.setItem("nomArticle", nomArticleInput.value);
	            });
	            descInput.addEventListener("input", function () {
	                localStorage.setItem("desc", descInput.value);
	            });
	            categorieInput.addEventListener("input", function () {
	                localStorage.setItem("categorie", categorieInput.value);
	            });
	            dateDInput.addEventListener("input", function () {
	                localStorage.setItem("dateD", dateDInput.value);
	            });
	            heureDInput.addEventListener("input", function () {
	                localStorage.setItem("heureD", heureDInput.value);
	            });
	            dateFInput.addEventListener("input", function () {
	                localStorage.setItem("dateF", dateFInput.value);
	            });
	            heureFInput.addEventListener("input", function () {
	                localStorage.setItem("heureF", heureFInput.value);
	            });
	            prixInitInput.addEventListener("input", function () {
	                localStorage.setItem("prixInit", prixInitInput.value);
	            });
	        });
	
	        // Fonction pour formater l'heure dans le format "HH'h'mm"
	        function formatHeure(heureStr) 
	        {
	            var heureFormat = new Intl.DateTimeFormat('fr', { hour: 'numeric', minute: 'numeric', hour12: false });
	            var [hours, minutes] = heureFormat.formatToParts(new Date('2023-01-01 ' + heureStr));
	            return hours.value + 'h' + minutes.value;
	        }
	    </script>
	
	</head>
		
	<body>
	
		<!-- Header -->
		<%@ include file="includes/header.jsp" %>
		
		<h2>Ajouter un nouvel article</h2>
		
	
	    <%@ page session="true" %>
	    
	    <%
	        // Récupérer le message de confirmation depuis la session
	        String confirmationMessage = (String) session.getAttribute("confirmationMessage");
	
	        // Vérifier si un message de confirmation existe
	        if (confirmationMessage != null && !confirmationMessage.isEmpty()) {
	    %>
	    <div class="confirmation-message">
	        <%= confirmationMessage %>
	    </div>
	    <%
	        // Nettoyer l'attribut de session après l'avoir affiché
	        session.removeAttribute("confirmationMessage");
	    }
	    %>
		
	    <div class="form-container">
	    
		    <form class="additem" action="AddArticleServlet" method="post" enctype="multipart/form-data">
		
		        <label class="additem" for="nomArticle">Nom de l'article :</label>
				<input class="inputitem custom-input" type="text" id="nomArticle" name="nomArticle" required><br>
		
		        <label class="additem" for="desc">Description :</label>
		        <textarea id="desc" name="desc" rows="4" cols="50" required></textarea><br>
		
		        <label class="additem" for="categorie">Catégorie :</label>
		       	<select id="categorie" name="categorie" required>
		            <% 	List<String> categories = CategorieManager.getInstance().getValidCategories();
		            	for (String category : categories) 
		            	{ 
		            %>
		            		<option value="<%= category %>"><%= category %></option>
		            <% 	} %>
		        </select>
		
		        <!--<label class="additem" for="imageFile">Image :</label>
		        <input class="inputitem" type="file" name="imageFile" id="imageFile"/>-->
		
		        <label class="additem" for="dateD">Date de début de l'enchère :</label>
		        <input class="inputitem" type="date" id="dateD" name="dateD">
		        <label class="additem" for="heureD">Heure de début :</label>
		        <input class="inputitem" type="time" id="heureD" name="heureD"><br>
		
		        <label class="additem" for="dateF">Date de fin de l'enchère :</label>
		        <input class="inputitem" type="date" id="dateF" name="dateF">
		        <label class="additem" for="heureF">Heure de fin :</label>
		        <input class="inputitem" type="time" id="heureF" name="heureF"><br>
		
		        <label class="additem" for="prixInit">Prix initial :</label>
		        <input class="inputitem" type="number" id="prixInit" name="prixInit" required><br>
		
		        <label class="additem" for="adresseRetrait">Adresse de retrait (<em>Par défaut, celle de votre profil</em>) :</label>
		        <textarea name="adresseRetrait" id="adresseRetrait" rows="4" cols="50">
		            <%= session.getAttribute("userCoordonnees") %>
		        </textarea>
		
		        <button type="submit" class="additem">Ajouter l'article</button>
		
		    </form>
		    
		</div>
	
	</body>

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>