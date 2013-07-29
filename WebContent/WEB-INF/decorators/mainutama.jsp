<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- import tag properties JSTL & EL from JSP -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- import tag properties sitemesh decorator -->
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Blog Xsis</title>
<!-- CSS for Main Decorators -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>" />


<script type="text/javascript" src="<c:url value="/resources/script/clockp.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/script/clockh.js"/>"></script> 
<script type="text/javascript" src="<c:url value="/resources/script/jquery/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/script/ddaccordion.js"/>"></script>
<script type="text/javascript">
ddaccordion.init({
	headerclass: "submenuheader", //Shared CSS class name of headers group
	contentclass: "submenu", //Shared CSS class name of contents group
	revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
	mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
	collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
	defaultexpanded: [], //index of content(s) open by default [index1, index2, etc] [] denotes no content
	onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
	animatedefault: false, //Should contents open by default be animated into view?
	persiststate: true, //persist state of opened contents within browser session?
	toggleclass: ["", ""], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
	togglehtml: ["suffix", "<img src='images/plus.gif' class='statusicon' />", "<img src='images/minus.gif' class='statusicon' />"], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
	animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
	oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//do nothing
	}
});
</script>

<script language="javascript" type="text/javascript" src="<c:url value="/resources/script/niceforms.js"/>"></script>
<link rel="stylesheet" type="text/css" media="all" href="<c:url value="/resources/css/niceforms-default.css"/>" />
<decorator:head/>

</head>


<body>
<div id="main_container">

	<!-- Header Position -->
	<div class="header">
    <div class="logo"><a href="#"><img src="<c:url value="/resources/images/images/logo.png"/>" alt="" title="" border="0" /></a></div>
    
    <div class="right_header">Selamat Datang di Menu Utama, <a href="#">Visit site</a></div>
    <div id="clock_a"></div>
    </div>
	<!-- End of Header Position -->
	
	<!-- Main Content Position Start -->
	<div class="main_content">
		<!-- Menu Position Start -->
		<div class="menu">
			<ul>
                    <li><a href="<c:url value="/utama/menuutama/home"/>">Home</a></li>
                    <li><a href="<c:url value="/"/>">About Us</a></li>
                    <li><a href="<c:url value="/master/artikel/searchArtikel"/>">News</a></li>
                    <li><a href="<c:url value="/"/>">Comment</a></li>
                   
 			</ul>
		</div>
		<!-- End of Menu Position -->
		
		
		<!-- Center Content Position Start -->
		<div class="center_content">
		<decorator:body/>
		</div>
		<!-- End of Center COntent -->
	<div class="clear"></div>	
	</div>
	<!-- End of Main Content -->
	
	<!-- Footer Position Start -->
	<div class="footer">
		<div class="left_footer">IN ADMIN PANEL | Powered by <a href="http://indeziner.com">@dvelnimo7x</a></div>
    	<div class="right_footer"><a href="http://indeziner.com"><img src="<c:url value="/resources/images/images/indeziner_logo.gif"/>" alt="" title="" border="0" /></a></div>	
	</div>
	<!-- End of Footer Position -->
	
	
</div>

</body>
</html>