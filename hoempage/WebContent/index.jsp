<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%    request.setCharacterEncoding("utf-8");
//         String root = request.getContextPath();
        
        String id =(String)session.getAttribute("id");
        String grade =(String)session.getAttribute("grade");
        String title= "환 영 합 니 다";
        if(id!=null && grade.equals("A")){
        	title= id+"님의 관리자 페이지 입니다.";
        }
        String str = null;
        if(id==null){  
        str = "메인 페이지 입니다.";
        }else{
        str = "안녕하세요 "+id+"님!";
        }
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
/* *{  */
/*   font-family: gulim;  */
/*   font-size: 20px;  */
/* }  */
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/main/top2.jsp" flush="false"/>
<%-- <jsp:include page="/main/top.jsp" flush="false"/> --%>
<!-- *********************************************** -->
 
<DIV class="title"><%=title %></DIV>

<div class="content">
 <h1><%=str %></h1>
<img src="<%=root%>/start/storage/1.jpg"  width="50%"><br>

<%if(id==null){ %>
<input type="button" value="로그인"
onclick="location.href='<%=root%>/start/loginForm.jsp'">

<%}else{ %>

<input type="button" value="로그아웃"
onclick="location.href='<%=root%>/start/logout.jsp'">

<%} %>
  </div>
  <DIV class='bottom'>
<!--     <input type='button' value='' onclick="location.href=''"> -->
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/main/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
