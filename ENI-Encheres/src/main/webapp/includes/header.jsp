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
			    <label for="menu-toggle" class="menu-icon"><a class="hamb" href="Accueil">&#9776;</a></label>		    
			    <ul class="menu">
			    	<li><a class="" href="NosEncheresServlet">Enchères en cours</a></li>
			    	<li><a class="" href="CahierDesCharges">Cahier des charges de l'application</a></li>
			        <li><a class="no-cursor" href="#">Actualité & astuces</a></li>
			        <li><a class="no-cursor" href="#">Aide / Contact</a></li>
			        <li><a class="no-cursor" href="#">Newsletter</a></li>
			        <li><a class="no-cursor" href="#">Conditions générales de vente</a></li>
			    </ul>
			    
			</div>			
		
			<% if (Boolean.TRUE.equals(isConnected)) { %>		        
			
			<div class="userConnect-container">
				<p class="userConnect">Bienvenue, <%= session.getAttribute("userPseudo") %> ! Vous êtes connecté. Votre crédit actuel est de <span class="credit"><%= creditText %>.</span></p>
			</div>
			   
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
					        <a href="AddArticleServlet" class="nav-submenu-link">Créer un nouvel article</a>
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
		    // Récupérez le nom de la page depuis la valeur attribuée par la servlet
		    var pageName = "${pageContext.request.getAttribute('pageName')}";
		    
		    // Si la page est la page d'accueil, ne générez pas de lien vers l'accueil
		    if (pageName === "Accueil") 
		    {
		        var breadcrumb = document.getElementById('breadcrumb');
		        breadcrumb.innerHTML = '<span>' + pageName + '</span>';
		    } 
		    else 
		    {
		        var breadcrumb = document.getElementById('breadcrumb');
		        
		        // Générez le fil d'Ariane en utilisant le nom de la page
		        breadcrumb.innerHTML = '<a href="Accueil">Accueil</a> › ';
		        
		        // Si la page est "Modifier mon profil", ajoutez également le lien vers "Mon profil"
		        if (pageName === "Modifier mon profil") 
		        {
		            breadcrumb.innerHTML += '<a href="UserProfilServlet">Mon profil</a> › ';
		        }
		        
		        // Si la page est "Modifier mon profil", ajoutez également le lien vers "Mon profil"
		        if (pageName === "Modifier mon annonce") 
		        {
		            breadcrumb.innerHTML += '<a href="UpdateItemServlet">Mes articles à vendre</a> › ';
		        }
		        
		        // Ajoutez le nom de la page actuelle
		        breadcrumb.innerHTML += '<span>' + pageName + '</span>';
		    }
		});
		
	</script>