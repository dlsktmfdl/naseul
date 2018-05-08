<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
	String id=(String)session.getAttribute("id");
	String grade=(String)session.getAttribute("grade");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title></title> 
<style type="text/css"> 
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif;}
body, html {
    height: 100%;
    color: #777;
    line-height: 1.8;
}
.w3-wide {letter-spacing: 10px;}
.w3-hover-opacity {cursor: pointer;}

}
</style>

<script type="text/javascript">

// Change style of navbar on scroll
window.onscroll = function() {myFunction()};
function myFunction() {
    var navbar = document.getElementById("myNavbar");
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        navbar.className = " w3-card" + " w3-animate-top" + " w3-white";
    } else {
        navbar.className = navbar.className.replace(" w3-card w3-animate-top w3-white", "");
    }
}

// Used to toggle the menu on small screens when clicking on the menu button
function toggleFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}
function myFunction2() {
    var x = document.getElementById("Demo");
    if (x.className.indexOf("w3-show") == -1) {  
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>
</head> 
<body> 
<!-- 상단 메뉴 -->

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar" id="myNavbar">
    <a class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu">
      <i class="fa fa-bars"></i>
    </a>
    <a href="<%=root %>/index.jsp" class="w3-bar-item w3-button"><span class="glyphicon glyphicon-home"></span></a>
    <a href="<%=root %>/homepage/about.jsp" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-user"></i> ABOUT ME</a>
    <a href="<%=root %>/homepage/portfolio.jsp" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-th"></i> PORTFOLIO</a>
    <a href="<%=root %>/homepage/contact.jsp" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-envelope"></i> CONTACT</a>

    <div class="w3-bar-item  w3-dropdown-hover">
      <span class="glyphicon glyphicon-edit"></span> BULLETIN BOARD
      	<span class="caret"></span>
        <div id="Demo" class="w3-dropdown-content w3-bar-block w3-card-4">
          <a href="<%=root %>/img/list.jsp" class="w3-bar-item w3-button"><span class="glyphicon glyphicon-picture"></span> photo board</a>
          <a href="<%=root %>/bbs/list.jsp" class="w3-bar-item w3-button"><span class="glyphicon glyphicon-list-alt"></span> free board</a>
          <a href="<%=root %>/gb/list.jsp" class="w3-bar-item w3-button"><span class="glyphicon glyphicon-th-list"></span> visitor board</a>
        </div>
    </div>
    
    <%if(id!=null){ %>
    <a href="<%=root %>/member/deleteForm.jsp" class="w3-bar-item w3-button"><span class="glyphicon glyphicon-remove"></span> WITHDRAWAL</a>
    <%} %>

    <%if(id==null){ %>
    <a href="<%=root %>/member/agreement.jsp" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><span class="glyphicon glyphicon-plus"></span> JOIN</a>
	<a href="<%=root %>/member/loginForm.jsp" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><span class="glyphicon glyphicon-log-in"></span> LOG-IN</a>
	
    <%}else{ %>
    <a href="<%=root %>/member/logout.jsp" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><span class="glyphicon glyphicon-log-out"></span> LOG-OUT</a>
    <a href="<%=root %>/member/read.jsp" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><span class="glyphicon glyphicon-cog"></span> MY-INFO</a>
    <%} %>
    <%if(id!=null && grade.equals("A")){ %>
    <a href="<%=root %>/memov3/list.jsp" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><span class="glyphicon glyphicon-th-list"></span> MEM-memo</a>
    <a href="<%=root %>/admin/list.jsp" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><span class="glyphicon glyphicon-th-list"></span> MEM-list</a>
  	<%} %>
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
    <%if(id==null){ %>
    <a href="<%=root %>/member/agreement.jsp" class="w3-bar-item w3-button">JOIN</a>
    <a href="<%=root %>/member/loginForm.jsp" class="w3-bar-item w3-button">LOG-IN</a>
  	<%}else{ %>
  	<a href="<%=root %>/member/logout.jsp" class="w3-bar-item w3-button">LOG-OUT</a>
    <a href="<%=root %>/member/read.jsp" class="w3-bar-item w3-button">MY-INFO</a>
  	<%} %>
  	<%if(id!=null && grade.equals("A")){ %>
    <a href="<%=root %>/memov3/list.jsp" class="w3-bar-item w3-button">MEM-memo</a>
    <a href="<%=root %>/admin/list.jsp" class="w3-bar-item w3-button">MEM-list</a>
  	<%} %>
  	<hr>
  	<a href="<%=root %>/homepage/about.jsp" class="w3-bar-item w3-button" onclick="toggleFunction()">ABOUT ME</a>
    <a href="<%=root %>/homepage/portfolio.jsp" class="w3-bar-item w3-button" onclick="toggleFunction()">PORTFOLIO</a>
    <a href="<%=root %>/homepage/contact.jsp" class="w3-bar-item w3-button" onclick="toggleFunction()">CONTACT</a>
 
  </div>
</div>

<!-- 상단 메뉴 끝 -->

