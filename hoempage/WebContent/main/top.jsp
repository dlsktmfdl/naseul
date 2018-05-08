<%@ include file="/ssi/ssi.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%
String id = (String)session.getAttribute("id");
String grade = (String)session.getAttribute("grade");
%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>
<body class="w3-content" style="max-width:1200px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b>신 듀랑고</b></h3>
  </div>
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="<%=root %>/start/main.jsp" class="w3-bar-item w3-button">메인</a>
    
    <a onclick="myAccFunc()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      게시판 <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
    <%if(id!=null){ %>
      <a href="../gust/list.jsp" class="w3-bar-item w3-button w3-light-grey"><i class="fa fa-caret-right w3-margin-right"></i>비밀게시판</a>
      <%} %>
      <a href="<%=root %>/image/list.jsp" class="w3-bar-item w3-button">질문게시판</a>
      <a href="#" class="w3-bar-item w3-button">팁 게시판</a>
      <a href="#" class="w3-bar-item w3-button">자랑글</a>
    </div>
    <a href="#" class="w3-bar-item w3-button">공략집</a>
    <a href="#" class="w3-bar-item w3-button">친구</a>
    <a href="#" class="w3-bar-item w3-button">채팅방</a>
    <a href="#" class="w3-bar-item w3-button">랭킹</a>
  </div>
<!--   document.getElementById('newsletter').style.display='block' -->
<!-- javascript:void(0) -->
<%-- <%if(id!=null){ %> --%>
<%--       <li><a href="<%=root %>/member/deleteForm.jsp">회원탈퇴</a></li> --%>
<%--       <li><a href="<%=root %>/member/logout.jsp">로그아웃</a></li> --%>
<%--       <%} %> --%>


   <%if(id==null){ %>
  <a href="../start/loginForm.jsp" class="w3-bar-item w3-button w3-padding" onclick=''>로그인</a> 
  <a href="../start/agreement.jsp" class="w3-bar-item w3-button w3-padding">회원가입</a> 
  
    <%}else{ %>
<%--       <li><a href="<%=root %>/start/logout.jsp">로그아웃</a></li> --%>

    <a href="../start/read.jsp"><span class="glyphicon glyphicon-user"></span>
      <span class="glyphicon glyphicon-thumbs-up"></span>  
      My Info</a>
      
 	<a href="../start/deleteForm.jsp" class="w3-bar-item w3-button w3-padding" onclick=''>회원탈퇴</a> 
    <a href="../start/logout.jsp"  class="w3-bar-item w3-button w3-padding">로그아웃</a>
    <%} %>
</nav>

<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  <div class="w3-bar-item w3-padding-24 w3-wide">LOGO</div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
 
 <script>

// Accordion 
function myAccFunc() {
    var x = document.getElementById("demoAcc");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}

// Click on the "Jeans" link on page load to open the accordion for demo purposes
document.getElementById("myBtn").click();


// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
function login(){
		var url = "../loginForm.jsp";
		
		location.href=url;
}
</script>

</body>
</html>