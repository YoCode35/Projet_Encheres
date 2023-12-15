<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="fr">
	
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Connexion - ENI Encheres</title>
		<link href="css/style.css" rel="stylesheet" />
		<script src="https://cdn.tailwindcss.com"></script>
	</head>
	
	<body>
	  
		<div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
		  
		  <div class="sm:mx-auto sm:w-full sm:max-w-sm">
		    <div class="text-7xl font-bold">Connexion</div>
		    <div class="mt-3 text-center"><p class="text-gray-700">Connectez-vous pour découvrir des enchères exclusives et des trésors uniques.</p></div>
		  </div>
		  
			<div class="mt-7 sm:mx-auto sm:w-full md:max-w-xl">
				      
				<% String error = request.getParameter("error");
				if (error != null) { %>
				<p style="color: red;">Error: <%= error %></p>
				<% } %>
					       
				<form action="ServletConnectDB" method="post">
					      
				<!-- Container du formulaire avec espacement vertical -->
				<div class="p-8 space-y-6 bg-white rounded-xl border border-neutral-100">
				    <!-- Section pour l'e-mail -->
				    <div>
				        <label for="email">E-mail</label>
				        <div class="mt-1">
				            <!-- Champ de saisie de l'e-mail -->
				            <input type="email" id="email" name="email" placeholder="Entrez votre adresse e-mail" required class="mt-2 w-full border py-1.5 rounded-md px-2 shadow-sm">
				        </div>
				    </div>
				
				    <!-- Section pour le mot de passe -->
				    <div>
				        <!-- Label du champ de saisie du mot de passe -->
				        <label for="password">Password</label>
				        <div class="mt-2">
				            <!-- Champ de saisie du mot de passe -->
				            <input type="password" id="password" name="password" placeholder="Entrez votre mot de passe" required
				                   class="mt-2 w-full border py-1.5 rounded-md px-2 shadow-sm">
				        </div>
				    </div>
				    
				    <div class="flex items-center justify-between">
				        <div class="flex items-center">
				            <!-- Checkbox "Se souvenir de moi" à gauche -->
				            <input type="checkbox" id="rememberMe" name="rememberMe" class="mr-2">
				            <label for="rememberMe">Se souvenir de moi</label>
				        </div>
					<div>
						<!-- lien "Mot de passe oublié" à droite -->
						<a href="reinitpassword.jsp" class="underline">Mot de passe oublié ?</a>
				</div>
			</div>
				    
			<div>
				<div class="text-center mt-9">Vous n'êtes pas en inscrit ? <a href="register.jsp" class="underline">Créer un compte</a></div>
			</div>
				      
			<div class="flex items-center justify-center mt-7 space-x-4">
				<!-- Bouton "Retour" -->
				<a href="index.jsp" class="py-2 px-10 border border-neutral rounded-full bg-white">Retour</a>
				
				<!-- Bouton "Se connecter" avec arrière-plan noir et texte blanc -->
				<button type="submit" class="py-2 px-10 border border-neutral rounded-full bg-black text-white">Se connecter</button>
			</div>
		</div>
	</form>
</div></div>
	</body>
	
</html>
