<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="gust.GustDAO"/>
<!-- MemoDAO dao = new MemoDAO(); -->
<%
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
	
	int gustno = Integer.parseInt(request.getParameter("gustno"));
 	
	
	dao.upViewcnt(gustno);//조회수 증가
	GustDTO dto = dao.read(gustno);//조회
	
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
	
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href="../css/style.css" rel="stylesheet">
<style type="text/css"> 
/* *{  */
/*   font-family: gulim;  */
/*   font-size: 20px;  */
/* }  */

/* div{ */
/* 	text-align: center; */
/* 	margin-top: 20px; */
/* 	margin-bottom: 20px; */
/* } */

/* table{ */
/* 	width:60%; */
/* 	margin:auto; */
/* } */
/* table,th,td{ */
/* 	border:1px solid black; */
/* 	border-collapse: collapse; */
/* } */
/* th,td{ */
/* 	padding:10px */
/* } */


</style> 
<script type="text/javascript">
function mreply(gustno){
	var url = "replyForm.jsp";
	url += "?gustno=" + gustno;
	url += "&col=<%=request.getParameter("col")%>"; 
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}

function mdelete(gustno){
	var url = "deleteForm.jsp";
	url += "?gustno="+gustno;
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}
function mlist(){
	
	var url="list.jsp"
	url += "?col=<%=request.getParameter("col")%>"; 
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}
function mupdate(gustno){
	var url = "updateForm.jsp"
	url += "?gustno="+gustno;
	url += "&oldfile=<%=dto.getFname()%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
	// 띄어쓰기 과다 사용 금지
}

</script>
</head> 
<body>
<jsp:include page="../main/top.jsp"></jsp:include>
<div class="title">조회</div>
<table>
	<tr>
		<th>사진</th>
		<td><%=dto.getFname() %><img src="./storage/<%=dto.getFname() %>" width="100%">
		</td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td><%=dto.getTitle()%></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><%=content%>
		</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=dto.getViewcnt()%></td>
	</tr>
	<tr>
		<th>등록일</th>
		<td><%=dto.getWdate() %></td>
</table>
<div class="bottom">
<%if(id!=null){ %>
	<button type="button" onclick="mreply('<%=gustno%>')">답변</button>
	<button type="button" onclick="mupdate('<%=gustno%>')">수정</button>
	<button type="button" onclick="mdelete('<%=gustno%>')">삭제</button>
	<%} %>
	<button type="button" onclick="mlist()">목록</button>
</div>
</body> 
</html> 
<!-- 내용을 보여주기 위해 -->