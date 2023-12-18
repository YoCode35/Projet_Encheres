<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="fr">

	<head>		    
		<meta name="viewport" content="width=device-width, initial-scale=1.0">    
		<link href="css/header.css" rel="stylesheet" />
		<link href="css/nav.css" rel="stylesheet" />
	</head>		    

	<header>
	
	    <nav>
	
		    <% 
		        Boolean isConnected = (Boolean) session.getAttribute("userConnected"); 
		        String creditText = "";
		
		        if (Boolean.TRUE.equals(isConnected)) {
		            int userCredit = (session.getAttribute("userCredit") != null)
		                    ? Integer.parseInt(session.getAttribute("userCredit").toString())
		                    : 0;
		            
		            creditText = (userCredit == 0) ? "0 point" : userCredit + " point" + (userCredit != 1 ? "s" : "");
		        }
		    %>
		    
			<div class="menu-container_general">
			
			    <input type="checkbox" id="menu-toggle">
			    <label for="menu-toggle" class="menu-icon"><a class="hamb" href="AccueilServlet">&#9776;</a></label>		    
			    <ul class="menu">
			        <li><a href="#">Actualité & astuces</a></li>
			        <li><a href="#">Aide / Contact</a></li>
			        <li><a href="#">Newsletter</a></li>
			        <li><a href="#">Conditions générales de vente</a></li>
			    </ul>
			    
			</div>			

		
			<% if (Boolean.TRUE.equals(isConnected)) { %>
		        
	
			<p class="userConnect">Bienvenue, <%= session.getAttribute("userPseudo") %> ! Vous êtes connecté. Votre crédit actuel est de <span class="credit"><%= creditText %>.</span></p>
			    
			<div class="menu-container_user">
				
			    <img src="img/icône_mon-compte_(50x150px).png" alt="Image de déclenchement" class="image-trigger">
			    <!--  <p class="mon-compte">Mon compte</p>-->
			    
			    <ul class="nav_user" id="menu-accordeon">
			    
			        <!-- Titre du menu -->
			        <li class="nav-item menu-title">
			            <p class="menu-title-text">Mon compte</p>
			        </li>
			        
			        <li class="nav-item no-cursor">
			            <a href="#activite" class="nav-link">Mes enchères actuelles</a>
			        </li>
			        <li class="nav-item no-cursor">
			            <a href="#achat" class="nav-link">Mes achats</a>
			        </li>
					<li class="nav-item has-submenu">
					    <a href="#" class="nav-link">Mes ventes</a>
					    <div class="nav-submenu">
					        <a href="MyItemsServlet" class="nav-submenu-link">Mes articles</a>
					        <a href="form_add_new_item.jsp" class="nav-submenu-link">Créer un nouvel article</a>
					    </div>
					</li>
					<li class="nav-item has-submenu">
					    <a href="#" class="nav-link">Mes informations personnelles</a>
					    <div class="nav-submenu">
					        <a href="UserProfilServlet" class="nav-submenu-link">Mon profil</a>
					    </div>
					</li>
			        <li class="nav-item">
			            <a href="ServletLogout" class="nav-link">Se déconnecter</a>
			        </li>
					<li class="nav-item close-submenus"></li>
			        
			    </ul>
			    
			</div>
			
			<script>
			document.addEventListener('DOMContentLoaded', function () {
			    const submenuItems = document.querySelectorAll('.has-submenu');

			    submenuItems.forEach(function (item) {
			        const submenu = item.querySelector('.nav-submenu');

			        item.addEventListener('click', function (event) {
			            if (event.target.classList.contains('nav-link')) {
			                event.preventDefault(); // Empêche le comportement par défaut du lien

			                // Affiche ou masque le sous-menu en fonction de son état actuel
			                submenu.style.maxHeight = submenu.style.maxHeight ? null : submenu.scrollHeight + 'px';

			                // Ajoute ou supprime la classe 'open' sur le parent
			                item.classList.toggle('open');
			                }
			            });
			        });
			    });
			</script>
			
			<div class="image-container_panier">
				<img src="img/icone_mon-panier_(ss-titre).png" alt="Mes transactions">
			</div>
		            
		    <% } else { %>
		        
		    <!-- Contenu à afficher lorsque l'utilisateur n'est pas connecté -->
			<div class="container_connect">
				
				<form action="ServletConnectDB" method="post">
					<input placeholder="Email" type="email" name="email" required />
					<input class="" placeholder="Mot de passe" type="password" name="password" required />
					<button type="submit">Se connecter</button>
				</form>
					
				<a href="register.jsp" class="btn_connect">S'inscrire</a>
				  
			</div>
		    <!-- Fin du contenu pour l'utilisateur non connecté -->
	           
		    <% } %>
			
		</nav> 
		       
	</header>