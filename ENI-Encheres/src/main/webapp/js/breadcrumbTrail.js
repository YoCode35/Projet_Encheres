document.addEventListener('DOMContentLoaded', function() {
    // Récupérez l'élément du fil d'Ariane
    var breadcrumb = document.getElementById('breadcrumb');

    // Créez une fonction pour générer le fil d'Ariane en fonction de l'emplacement de l'utilisateur
    function generateBreadcrumb() {
        var pathArray = window.location.pathname.split('/').filter(function(item) {
            return item !== ''; // Supprimez les éléments vides
        });

        var breadcrumbHTML = '<a href="#">Accueil</a> › ';

        pathArray.forEach(function(path, index) {
            var isLast = index === pathArray.length - 1;
            breadcrumbHTML += '<a href="#">' + path + '</a>';
            if (!isLast) {
                breadcrumbHTML += ' › ';
            }
        });

        breadcrumb.innerHTML = breadcrumbHTML;
    }

    // Appelez la fonction initiale
    generateBreadcrumb();
});