<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>
<%	
	int gustno = Integer.parseInt(request.getParameter("gustno"));
	
	GustDAO dao = new GustDAO();
	boolean flag = dao.delete(gustno);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title></title>
<style type="text/css">
*{
font-family:gulim;
font-size:20px;
}
div{
	text-align:center;
	margin-top:100px
	}
</style>
<script type="text/javascript">
function mlist(){
	var url = "list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
}
</script>
</head>
<body>
<div>
<%
if(flag){
	out.print("삭제");
}else{
	out.print("삭제 실패");
}
%>
<br>
<button type="button" onclick="mlist()">목록</button>
</div>
</body>
</html>