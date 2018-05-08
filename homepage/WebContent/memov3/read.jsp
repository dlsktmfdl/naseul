<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"></jsp:useBean>
<%@ page import="java.net.*" %>
<%
	int memono=Integer.parseInt(request.getParameter("memono"));
	
	dao.upViewcnt(memono);//조회수 증가
	MemoDTO dto=dao.read(memono);//조회
	
	String content=dto.getContent();
	content=content.replaceAll("\r\n","<br>");//\r\n을 <br>로 바꿔줌
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<link href="../css/style.css" rel="stylesheet">
<script type="text/javascript">
// function mcreate(){
// 	var url="memoCreate.jsp";
	
// 	location.href=url;
// }
function mlist(){
	var url="list.jsp";
	url+="?col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
}
function mupdate(memono){
	var url="updateForm.jsp";
	url+="?memono="+memono;
	url+="&col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
}
function mdelete(memono){
	var url="deleteForm.jsp";
	url+="?memono="+memono;
	url+="&col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
}
function mreply(memono){
	var url="replyForm.jsp";
	url+="?memono="+memono;
	url+="&col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}

</script>

</head> 
<body> 
<jsp:include page="/menu/top.jsp" />
<div class="title">조회</div>
<table>
	<tr>
		<th>제  목</th>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>
		<th>내  용</th>
		<td><%=content%></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=dto.getViewcnt() %></td>
	</tr>
	<tr>
		<th>등록일</th>
		<td><%=dto.getWdate() %></td>
	</tr>	

</table>

<div class="bottom">
	<button type="button" onclick="mreply('<%=memono%>')">답글</button>
	<button type="button" onclick="mupdate('<%=memono%>')">수정</button>
	<button type="button" onclick="mdelete('<%=memono%>')">삭제</button>
	<button type="button" onclick="mlist()">목록</button>
</div >
<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body> 
</html>