				document.addEventListener('DOMContentLoaded', function () 
				{
			    	const submenuItems = document.querySelectorAll('.has-submenu');

			    	submenuItems.forEach(function (item) 
			    	{
			        	const submenu = item.querySelector('.nav-submenu');

			        	item.addEventListener('click', function (event)
			        	{
			            	if (event.target.classList.contains('nav-link'))
			            	{
			                	event.preventDefault(); // Empêche le comportement par défaut du lien

				                // Affiche ou masque le sous-menu en fonction de son état actuel
				                submenu.style.maxHeight = submenu.style.maxHeight ? null : submenu.scrollHeight + 'px';
	
				                // Ajoute ou supprime la classe 'open' sur le parent
				                item.classList.toggle('open');
			                }
			            });
			        });
			    });