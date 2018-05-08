<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="gust.GustDAO"></jsp:useBean>
<!-- 	MemoDAO dao = new MemoDAO(); -->
<% 
	int gustno = Integer.parseInt(request.getParameter("gustno"));

	GustDTO dto = dao.readReply(gustno);

 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet"/>
<script type="text/javascript">
function incheck(){
	var f = document.frm;
	
	if(f.title.value==""){
		alert("제목을 입력하세요");
		f.title.focus();
		return ;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요");
		f.content.focus();
		return ;
	}
	f.submit();
}

</script>
</head>

<body>
<jsp:include page="../main/top.jsp"></jsp:include>
<div class="title">
답변
</div>

<form name="frm" action="replyProc.jsp" method="POST">

<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type ="hidden" name = "gustno" value ="<%=dto.getGustno()%>">
<input type ="hidden" name = "grpno" value ="<%=dto.getGrpno()%>">
<input type ="hidden" name = "indent" value ="<%=dto.getIndent()%>">
<input type ="hidden" name = "ansnum" value ="<%=dto.getAnsnum()%>">

<table>
<tr>
<th>제목</th>
<td><input type="text" name="title" size="30" value='<%=dto.getTitle()%>'>
</td>
</tr>
<tr>
<th>내용</th>
<td><textarea rows="10" cols="30" name="content"></textarea>
</td>
</tr>

</table>


<div class="bottom">
<button type="button" onclick="incheck()">전송</button>
</div>
</form>
</body>
</html>