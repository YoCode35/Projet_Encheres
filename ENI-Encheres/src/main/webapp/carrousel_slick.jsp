<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>

<title>Insert title here</title>

<style>
        /*------ slider width ------*/
        .slider {
            width: 70%;
            margin: 0 auto;
            text-align: center; /* Centrer le contenu à l'intérieur du slider */
        }

        /*------ slider image ------*/
        .slider img {
            width: 50%;
            display: inline-block; /* Empêche les images de se comporter comme des blocs */
        }

        /*-------- height ----------*/
        .slider .slick-slide {
            height: auto !important;
        }

        /*---------- arrows ---------*/
        .slick-next {
            right: -30px !important;
        }

        .slick-prev {
            left: -30px !important;
        }

        .slick-next:before {
            background: url(img/arrow_right.png) !important;
            background-size: contain !important;
        }

        .slick-prev:before {
            background: url(img/arrow_left.png) !important;
            background-size: contain !important;
        }

        .slick-arrow {
            z-index: 2 !important;
            width: 60px !important;
            height: 60px !important;
        }

        .slick-arrow:before {
            content: "" !important;
            width: 100% !important;
            height: 100% !important;
            position: absolute;
            top: 0;
            left: 0;
            opacity: 1 !important;
        }
</style>

</head>
<body>

<div class="page-wrapper">
    <div class="slider">   
        <div><img src="img/Article_001.png" alt="Article 1"></div>
        <div><img src="img/Article_002.png" alt="Article 2"></div>   
        <div><img src="img/Article_003.png" alt="Article 3"></div>
    </div>
</div>

<script>
    $('.slider').slick({
        autoplay: true,       //autoplay
        autoplaySpeed: 2000,  //autoplay speed
        speed: 800,           //slide speed
        dots: true,           //dots below slide
        arrows: true,         //arrows both sides of slide
        infinite: true,       //loop infinitely
    });
</script>
</body>
</html>