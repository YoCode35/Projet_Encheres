<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="fr">

	<head>		    
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
    	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
   	 	<script type="text/javascript" src="js/slick.min.js"></script>
   	 	
    	<link href="css/slick.css" rel="stylesheet">
    	<link href="css/allItems.css" rel="stylesheet" />
		<link href="css/style.css" rel="stylesheet" />    
		<link href="css/header.css" rel="stylesheet" />
		<link href="css/nav.css" rel="stylesheet" />
		<link href="css/index.css" rel="stylesheet" />
		<link href="css/form_style.css" rel="stylesheet" />
		<link href="css/encheres.css" rel="stylesheet" />
		<link href="css/viewedMyProfile.css" rel="stylesheet" />
		<link href="css/myItemsForSale.css" rel="stylesheet" />			    
	    <link href="css/success_messages.css" rel="stylesheet" />
	    <link href="css/footer.css" rel="stylesheet" />
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
		    
			<div class="menu-container-general">
			
			    <input type="checkbox" id="menu-toggle">
			    <label for="menu-toggle" class="menu-icon"><a class="hamb" href="AccueilServlet">&#9776;</a></label>		    
			    <ul class="menu">
			    	<li><a class="" href="NosEncheresServlet">Enchères en cours</a></li>
			    	<li><a class="" href="cahier-des-charges-application-encheres.jsp">Cahier des charges de l'application</a></li>
			        <li><a class="no-cursor" href="#">Actualité & astuces</a></li>
			        <li><a class="no-cursor" href="#">Aide / Contact</a></li>
			        <li><a class="no-cursor" href="#">Newsletter</a></li>
			        <li><a class="no-cursor" href="#">Conditions générales de vente</a></li>
			    </ul>
			    
			</div>			
		
			<% if (Boolean.TRUE.equals(isConnected)) { %>		        
	
			<p class="userConnect">Bienvenue, <%= session.getAttribute("userPseudo") %> ! Vous êtes connecté. Votre crédit actuel est de <span class="credit"><%= creditText %>.</span></p>
			    
			<div class="menu-container-user">
				
			    <img src="img/icone_mon-compte.png" alt="Image de déclenchement" class="image-trigger">
			    <!--  <p class="mon-compte">Mon compte</p>-->
			    
			    <ul class="nav-user" id="menu-accordeon">
			    
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
					        <a href="userProfil.jsp" class="nav-submenu-link">Mon profil</a>
					    </div>
					</li>
			        <li class="nav-item">
			            <a href="ServletLogout" class="nav-link">Se déconnecter</a>
			        </li>
					<li class="nav-item close-submenus"></li>
			        
			    </ul>
			    
			</div>
			
			<div class="image-container-panier">
				<img src="img/icone_mon-panier.png" alt="Mes transactions">
			</div>
		            
		    <% } else { %>
		        
		    <!-- Contenu à afficher lorsque l'utilisateur n'est pas connecté -->
			<div class="container-connect">
				
				<form class="connectdb" action="ServletConnectDB" method="post">
				
					<input class="connectdb" placeholder="Email" type="email" name="email" required />
					<input class="connectdb" placeholder="Mot de passe" type="password" name="password" required />
					<button class="connectdb" type="submit">Se connecter</button>
				    
				    <div class="remember-group">
						<label for="rememberMe">Se souvenir de moi</label>
						<input type="checkbox" id="rememberMe" name="rememberMe">
						<a href="reinitpassword.jsp" class="forget-mdp">Mot de passe oublié ?</a>
				    </div>
				    
				</form>
					
				<a href="register.jsp" class="btn-register">S'inscrire</a>
				  
			</div>
		    <!-- Fin du contenu pour l'utilisateur non connecté -->
	           
		    <% } %>
		    
			<div id="breadcrumb">
            	<!-- Le fil d'Ariane est généré ici par JavaScript -->
        	</div>
			
		</nav> 
		       
	</header>

	<script>
	
		document.addEventListener('DOMContentLoaded', function()
		{
		    // Récupérez l'élément du fil d'Ariane
		    var breadcrumb = document.getElementById('breadcrumb');
	
		    // Créez une fonction pour générer le fil d'Ariane en fonction de l'emplacement de l'utilisateur
		    function generateBreadcrumb()
		    {
		        var pathArray = window.location.pathname.split('/').filter(function(item)
		        {
		            return item !== ''; // Supprimez les éléments vides
		        });
	
		        var breadcrumbHTML = '<a href="#">Accueil</a> › ';
	
		        pathArray.forEach(function(path, index)
		        {
		            var isLast = index === pathArray.length - 1;
		            breadcrumbHTML += '<a href="#">' + path + '</a>';
		            if (!isLast)
		            {
		                breadcrumbHTML += ' › ';
		            }
		        });
	
		        breadcrumb.innerHTML = breadcrumbHTML;
		    }
	
		    // Appelez la fonction initiale
		    generateBreadcrumb();
		});
		
	</script>