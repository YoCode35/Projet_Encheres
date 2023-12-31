<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>

<!doctype html>

<html lang="fr">

	<head>
		<meta http-equiv="Content-Type" content="text/html">
	  	<title>Responsive Horizontal Posts Slider - Template Monster Demo</title>
	  	<link rel="stylesheet" type="text/css" media="all" href="css/carrousel.css">
	  	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	 	<script type="text/javascript" src="js/responsiveCarousel.min.js"></script>
	</head>

<body>
  <div id="w">
    <h1>Horizontal Posts Slider with jQuery</h1>
    
    <nav class="slidernav">
      <div id="navbtns" class="clearfix">
        <a href="#" class="previous">prev</a>
        <a href="#" class="next">next</a>
      </div>
    </nav>
    
    <div class="crsl-items" data-navigation="navbtns">
      <div class="crsl-wrap">
        <div class="crsl-item">
          <div class="thumbnail">
            <img src="img/thumb01.jpg" alt="nyc subway">
            <span class="postdate">Feb 16, 2014</span>
          </div>
          
          <h3><a href="#">Lorem Ipsum Dolor Sit</a></h3>
          
          <p>Suspendisse laoreet eu tortor vel dapibus. Etiam auctor nisl mattis, ornare nibh eu, lobortis leo. Sed congue mi eget velit dictum, id dictum massa tempus. Cras lobortis lectus neque. Fusce aliquet mauris ac bibendum pharetra.</p>
          
          <p class="readmore"><a href="#">Read More &raquo;</a></p>
        </div><!-- post #1 -->
        
        <div class="crsl-item">
          <div class="thumbnail">
            <img src="img/thumb02.jpg" alt="danny antonucci">
            <span class="postdate">Feb 19, 2014</span>
          </div>
          
          <h3><a href="#">A Look Back over A.K.A Cartoon</a></h3>
          
          <p>Vestibulum in venenatis velit. Praesent commodo eget purus sed interdum. Curabitur faucibus purus ut erat fermentum posuere. Suspendisse blandit viverra sagittis. Nullam cursus scelerisque lorem ut ornare.</p>
          
          <p class="readmore"><a href="#">Read More &raquo;</a></p>
        </div><!-- post #2 -->
        
        <div class="crsl-item">
          <div class="thumbnail">
            <img src="img/thumb03.jpg" alt="watercolor paints">
            <span class="postdate">Feb 23, 2014</span>
          </div>
          
          <h3><a href="#">Watercoloring for Beginners</a></h3>
          
          <p>Cras eget interdum nunc. Nam suscipit congue augue, id interdum risus adipiscing nec. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla non diam id nisi tempus sodales.</p>
          
          <p class="readmore"><a href="#">Read More &raquo;</a></p>
        </div><!-- post #3 -->
        
        <div class="crsl-item">
          <div class="thumbnail">
            <img src="img/thumb04.jpg" alt="apple ipod classic photo">
            <span class="postdate">Mar 02, 2014</span>
          </div>
          
          <h3><a href="#">Classic iPods are Back!</a></h3>
          
          <p>Phasellus condimentum enim nisl, volutpat dapibus turpis euismod nec. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec id elit lorem. Vivamus at eros elit. Nullam cursus euismod purus.</p>
          
          <p class="readmore"><a href="#">Read More &raquo;</a></p>
        </div><!-- post #4 -->
        
        <div class="crsl-item">
          <div class="thumbnail">
            <img src="img/thumb05.jpg" alt="web design magazines">
            <span class="postdate">Mar 11, 2014</span>
          </div>
          
          <h3><a href="#">The 10 Best Web Design Magazines</a></h3>
          
          <p>Morbi quis tempus leo, eget vestibulum quam. Pellentesque ac orci urna. Proin vitae neque vel metus pulvinar luctus vitae eu nulla.</p>
          
          <p class="readmore"><a href="#">Read More &raquo;</a></p>
        </div><!-- post #5 -->
      </div><!-- @end .crsl-wrap -->
    </div><!-- @end .crsl-items -->
    
  </div><!-- @end #w -->
<script type="text/javascript">
$(function(){
  $('.crsl-items').carousel({
    visible: 3,
    itemMinWidth: 180,
    itemEqualHeight: 370,
    itemMargin: 9,
  });
  
  $("a[href=#]").on('click', function(e) {
    e.preventDefault();
  });
});
</script>
</body>
	</html>