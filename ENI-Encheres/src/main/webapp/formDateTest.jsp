<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

	<head>
	    <meta charset="UTF-8">
	    <title>Test de Formatage de Date</title>
	</head>
	
	<body>
    	<h2>Test de Formatage de Date</h2>

    	<form action="DateFormatterServlet" method="post">
    	
			<label class="additem" for="dateD">Date de début de l'enchère :</label>
			<input class="inputitem" type="date" id="dateD" name="dateD">
		        
			<label class="additem" for="heureD">Heure de début :</label>
			<input class="inputitem" type="time" id="heureD" name="heureD"><br>
		        
			<label class="additem" for="dateF">Date de fin de l'enchère :</label>
			<input class="inputitem" type="date" id="dateF" name="dateF">
		        
			<label class="additem" for="heureF">Heure de fin :</label>
			<input class="inputitem" type="time" id="heureF" name="heureF"><br>
		        
        	<button type="submit">Soumettre</button>
        	
    	</form>
    	
	</body>
	
</html>
