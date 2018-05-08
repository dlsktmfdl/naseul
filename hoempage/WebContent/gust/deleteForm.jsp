<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="gust.GustDAO"></jsp:useBean>
<% request.setCharacterEncoding("utf-8");


	int gustno = Integer.parseInt(request.getParameter("gustno"));
	boolean flag = dao.checkRefnum(gustno);
	
%>    

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title></title>
<link href="../css/style.css" rel="stylesheet"/>
</head>
<body>
<jsp:include page="../main/top.jsp"></jsp:include>
<div class="title">삭제 확인</div>

<%if(flag){ %>
<div class = "content">
	부모상속받아서 삭제 할 수 없다 
</div>
	  <DIV class='bottom'>
    <input type='submit' value='뒤로' onclick="history.back()">
    <input type='button' value='목록' onclick="location.href='list.jsp'">
  </DIV>
<%}else{%>

<div class="content">
<form method="post" action="deleteProc.jsp">
<input type ="hidden" name = "nowPage" value ="<%=request.getParameter("nowPage") %>">
<input type ="hidden" name = "col" value ="<%=request.getParameter("col") %>">
<input type ="hidden" name = "word" value ="<%=request.getParameter("word")%>">
<input type="hidden" name="gustno" value="<%=gustno%>">
<br>
삭제를 하면 복구가 될 수 없어요.<br>
삭제하려면 삭제 버튼을 클릭하세요<br>
취소는 목록버튼을 누르세요<br>
<br>
<button >삭제처리</button>
<button type="button" onclick="mlist()">목록</button>

</form>
<%} %>
</div>

</body>
</html>