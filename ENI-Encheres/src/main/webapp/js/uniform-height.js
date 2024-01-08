			// Détermine la hauteur maximale et applique cette hauteur à toutes les fiches
			document.addEventListener("DOMContentLoaded", function() 
			{
	            // Sélectionnez tous les conteneurs d'articles
	            var itemContainers = document.querySelectorAll('.item-container');

	            // Trouvez la hauteur maximale parmi tous les conteneurs
	            var maxHeight = 0;
	            itemContainers.forEach(function(container)
	            {
	                maxHeight = Math.max(maxHeight, container.offsetHeight);
	            });

	            // Appliquez la hauteur maximale à tous les conteneurs
	            itemContainers.forEach(function(container) 
	            {
	                container.style.height = maxHeight + 'px';
	            });
	        });	