<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<%

String id=(String)session.getAttribute("id");
String grade=(String)session.getAttribute("grade");
String str=null;

if(id!=null&&grade.equals("A")){
	str="관리자 페이지 입니다.";
}
if(id==null){ 
	str="Hello :-)"	;
}else{
	str="Hello~ "+id+"! :-)";
}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>NADORI's</title>
<style>
body,h1,h2,h3,h4,h5,h6 {
font-family: "Lato", sans-serif;
}
body, html {
    height: 100%;
    color: #777;
    line-height: 1.8;
}

/* First image (Logo. Full height) */
.bgimg-1 {
    background-image: url('<%=root%>/w3images/parallax2.jpg');
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    min-height: 100%;
}
.w3-wide {letter-spacing: 10px;}
.w3-hover-opacity {cursor: pointer;}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1024px) {
    .bgimg-1, .bgimg-2, .bgimg-3 {
        background-attachment: scroll;
    }
}
</style>
</head>

<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->

<!-- First Parallax Image with Logo Text -->
<div class="bgimg-1 w3-display-container w3-opacity-min" id="home">
  <div class="w3-display-middle" style="white-space:nowrap;">
    <span class="w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity">
    MY <span class="w3-hide-small">TRAVEL</span> BLOG</span>
  </div>

<!-- Container (index Section) -->
<div class="w3-content w3-container w3-padding-64" id="contact" >
	<h3 class="w3-center w3-text-lightgrey"><br><%=str %></h3>
</div>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>