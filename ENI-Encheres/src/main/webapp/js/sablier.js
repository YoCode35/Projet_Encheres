			// calcul du temps restant à partir de la date actuelle jusqu'à la date de fin de l'enchère
			document.addEventListener("DOMContentLoaded", function () 
			{
	        	// Sélectionnez tous les éléments avec la classe "decompte"
	        	var countdownElements = document.querySelectorAll('.countdown, .mycountdown');
	
	        	// Parcourez tous les éléments et ajoutez le décompte du temps restant
	        	countdownElements.forEach(function (element) 
				{
		            // Obtenez la date de fin à partir de l'attribut data-end-date
		            var endDateString = element.getAttribute('data-end-date');
		
		            // Convertissez la date de fin en objet Date
		            var endDate = new Date(endDateString);
		
		            // Mettez à jour le décompte du temps restant chaque seconde
		            function updateCountdown() 
		            {
		                var timeRemaining = endDate - new Date();
		
		                // Convertissez le temps restant en jours, heures, minutes et secondes
		                var days = Math.floor(timeRemaining / (1000 * 60 * 60 * 24));
		                var hours = Math.floor((timeRemaining % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		                var minutes = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60));
		                var seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);
		
		                // Mettez à jour le contenu de l'élément avec le décompte du temps restant
		                element.innerHTML = "Plus que " + days + " jrs, " + hours + " hrs, " + minutes + " mns et " + seconds + " secondes avant la fin de cette enchère !";
		            }

		            // Appelez la fonction updateCountdown initialement
		            updateCountdown();

		            // Mettez à jour le décompte chaque seconde
		            setInterval(updateCountdown, 1000);
				});
			});