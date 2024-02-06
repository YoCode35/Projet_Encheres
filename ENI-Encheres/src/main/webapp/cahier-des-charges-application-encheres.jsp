<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

	<head>
		<meta charset="UTF-8">		
		<link href="css/cahierDesCharges.css" rel="stylesheet" />		
		<title>Cahier des charges de l'application ENI Enchères</title>
	</head>
	
	<body>
	
	    <!-- Header -->
	    <%@ include file="includes/header.jsp" %>
	
		<table class="table-no-border">
	  
		    <tbody>
		    
		      <!-- Entête : Logo ENI + Légende -->
				<tr class="first-row">
				
			        <td class="entete-LogoEni" colspan="7">
			        	
			        	<img src="img/logo-eni_(50x50).png">
			        	
						<div class="container">
				        	
				        	<div class="legende">
				        		
						        <div class="color-square blue"></div>
						        <div class="label">Réalisé</div>
						        
						        <div class="color-square orange"></div>
						        <div class="label">En cours de réalisation</div>
						        
						        <div class="color-square grey"></div>
						        <div class="label">Reste à réaliser</div>
			
							</div>
							
						</div>
						
			        </td>
			        
				</tr>
		      
				<!-- Entête : Titre du tableau -->
				<tr>
		        	<td class="entete-TitreTableau" colspan="7">LISTE DES EXIGENCES</td>
				</tr>
		      
				<!-- Détail des exigences : Libellés des colonnes -->
				<tr class="entete-LibellesTableau">
			        <td>Itération</td>
			        <td>Importance</td>
			        <td>Catégorie</td>
			        <td>ID</td>
			        <td>Nom</td>
			        <td>Description</td>
			        <td>Démonstration</td>
		      	</tr>
		      
				<!-- Détail des exigences : Contenu -->					
				<tr class="realise">
			        <td>1</td>
			        <td>2000</td>
			        <td>Gestion des utilisateurs</td>
			        <td>1001</td>
			        <td>Se connecter</td>
			        <td>En tant qu'utilisateur, je peux me connecter sur la plateforme ENI-Encheres avec un login (adresse mail ou pseudo) et un mot de passe.</td>
			        <td class="demo"><span class="underline">Cas nominal</span> : suite à la saisie d'un login et d'un mot de passe corrects, j'accède à la plateforme.<br>
									 <span class="underline">Cas d'erreur</span> : suite à la saisie d'un login inconnu ou d'un mot de passe erroné, le site affiche un message d'erreur</td>
				</tr>
		      
				<tr class="realise">
			        <td>1</td>
			        <td>1900</td>
			        <td>Gestion des utilisateurs</td>
			        <td>1003</td>
			        <td>S’inscrire</td>
			        <td>En tant qu’utilisateur, je peux m’inscrire sur la plateforme ENI-Enchères.
			        	Le pseudo ainsi que l’e-mail doivent être uniques sur toute la plateforme. Le pseudo n’accepte que des caractères alphanumériques.
			        	Si la création du profil est validée, l’utilisateur est dirigé vers la page d’accueil (liste des enchères). Le crédit initial est de 0.</td>
			        <td></td>
				</tr>
		      
				<tr class="realise">
			        <td>1</td>
			        <td>1800</td>
			        <td>Navigation</td>
			        <td>6002</td>
			        <td>Page d’accueil</td>
			        <td>La page d’accueil du site est la page qui (liste les enchères).
			        	Cette page doit être chargée automatiquement si aucune ressource n’est indiquée dans l’url (http://localhost:8080/encheres/)</td>
			        <td class="demo">Si l’url ne précise pas de ressource (http://localhost:8080/encheres/), la page affichée est la page de connexion</td>
				</tr>			
		      
				<tr class="realise">
			        <td>1</td>
			        <td>1750</td>
			        <td>Gestion des utilisateurs</td>
			        <td>1009</td>
			        <td>Se déconnecter</td>
			        <td>En tant qu’utilisateur connecté, je peux me déconnecter. Je suis alors ramené vers la page d’accueil en mode déconnecté.</td>
			        <td></td>
				</tr>
		      
				<tr class="realise">
			        <td>1</td>
			        <td>1700</td>
			        <td>Gestion des utilisateurs</td>
			        <td>1006</td>
			        <td>Afficher un profil</td>
			        <td>En tant qu’utilisateur, je peux afficher le profil d’un autre utilisateur. Les pseudo, nom, prénom, e-mail, numéro de téléphone, rue, code postal, ville sont affichés.</td>
			        <td></td>
				</tr>
				
				<tr class="realise">
			        <td>1</td>
			        <td>1600</td>
			        <td>Gestion des utilisateurs</td>
			        <td>1007</td>
			        <td>Modifier mon profil</td>
			        <td>En tant qu’utilisateur, je peux modifier mes informations de profil : pseudo, nom, prénom, e-mail, numéro de téléphone, rue, code postal, ville et mot de passe.</td>
			        <td></td>
				</tr>
				
				<tr class="realise">
			        <td>1</td>
			        <td>1500</td>
			        <td>Gestion des utilisateurs</td>
			        <td>1004</td>
			        <td>Supprimer mon compte</td>
			        <td>En tant qu’utilisateur, je peux supprimer mon compte. Dans ce cas, je suis déconnecté et redirigé sur la page d’accueil.</td>
			        <td></td>
				</tr>
				
				<tr class="realise">
			        <td>1</td>
			        <td>1400</td>
			        <td>Gestion des enchères</td>
			        <td>2001</td>
			        <td>Vendre un article</td>
			        <td>En tant qu’utilisateur, je peux vendre un article sur la plateforme Enchères.org.
			        	Pour cela, je donne les informations sur l’article vendu : nom, description et catégorie.
			        	J’indique un prix de départ (en points), une date et une heure d’ouverture de l’enchère, une date et une heure de fin d’enchères et les modalités du retrait : 
			        	adresse (par défaut celle du vendeur).</td>
			        <td></td>
				</tr>
				
				<tr class="enCours">
			        <td>1</td>
			        <td>1300</td>
			        <td>Gestion des enchères</td>
			        <td>2004</td>
			        <td>Lister les enchères en mode déconnecté</td>
			        <td>En tant qu’utilisateur non connecté, je peux lister les enchères en cours.
			        	Je peux filtrer ma recherche par catégorie, et par nom d’article (l’article est affiché si il contient le critère saisi)
			        	– Pour consulter le détail des enchères, l’utilisateur doit se connecter.</td>
			        <td></td>
				</tr>
				
				<tr class="enCours">
			        <td>1</td>
			        <td>1200</td>
			        <td>Gestion des enchères</td>
			        <td>2005</td>
			        <td>Lister les enchères en mode connecté</td>
			        <td>En tant qu’utilisateur connecté, je peux lister les enchères en cours, les enchères auxquelles je participe,
			        	c’est-à-dire celles sur lesquelles j’ai fait au moins une offre, et mes enchères gagnées.
			        	Je peux aussi sélectionner mes ventes, non commencées, en cours ou terminées.</td>
			        <td></td>		        
				</tr>
				
				<tr class="resteA">
			        <td>1</td>
			        <td>1100</td>
			        <td>Gestion des enchères</td>
			        <td>2006</td>
			        <td>Faire une enchère</td>
			        <td>En tant qu’utilisateur, je peux faire une enchère sur un article si je propose un prix (en points) supérieur au tarif actuel
			        	et si mon compte de points ne devient pas négatif. Si l’enchère est possible, mon crédit de points est débité du montant proposé.
			        	Le meilleur enchérisseur précédent, s'il existe, est re-crédité de son offre.</td>
			        <td></td>
				</tr>
				
				<tr class="resteA">
			        <td>1</td>
			        <td>1100</td>
			        <td>Gestion des enchères</td>
			        <td>2007</td>
			        <td>Remporter une vente</td>
			        <td>En tant qu’enchérisseur, je deviens acquéreur si au terme de l’enchère j’ai proposé l’enchère la plus haute.</td>
			        <td></td> 
				</tr>
				
				<tr class="resteA">
			        <td>1</td>
			        <td>950</td>
			        <td>Navigation</td>
			        <td>6003</td>
			        <td>Lien logo Encheres</td>
			        <td>Un clic sur le logo du site ramène l’utilisateur sur la page principale (page de recherche d’articles) si celui-ci est connecté.</td>
			        <td></td>		        
				</tr>
				
				<tr class="resteA">
			        <td>1</td>
			        <td>900</td>
			        <td>Gestion des enchères</td>
			        <td>2009</td>
			        <td>Afficher le détail d’une enchère</td>
			        <td>En tant qu’utilisateur, je peux afficher le détail d’une enchère.
			        	Les informations sur l’article vendu sont affichées (nom, description, meilleure offre, mise à prix, début et fin de l’enchère, adresse de retrait, vendeur).
			        	En fonction de l’état de la vente, et du rôle de l’utilisateur (vendeur ou acheteur), l’utilisateur peut seulement consulter les information,
			        	enchérir ou modifier la vente (s'il est le vendeur et que l’enchère n’a pas débuté).</td>
			        <td></td> 
				</tr>
				
				<tr class="resteA">
			        <td>1</td>
			        <td>850</td>
			        <td>Navigation</td>
			        <td>6001</td>
			        <td>Boutons rafraîchir et retour du navigateur</td>
			        <td>En tant qu’utilisateur, je peux rafraîchir la page courante ou revenir sur la page précédente en utilisant le bouton « Back » du navigateur.</td>
			        <td></td>		        
				</tr>
				
		    </tbody>
		    
		</table>
	  
	</body>

	<%@ include file="WEB-INF/includes/footer.jsp"%>

</html>