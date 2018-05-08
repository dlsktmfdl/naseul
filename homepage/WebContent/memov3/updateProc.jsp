<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="memo.MemoDTO"></jsp:useBean>
<jsp:useBean id="dao" class="memo.MemoDAO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%	int memono=Integer.parseInt(request.getParameter("memono"));
	//String title=request.getParameter("title");
	//String content=request.getParameter("content");
	
	//dto.setMemono(memono);
	//dto.setTitle(title);
	//dto.setContent(content);
	
	boolean flag=dao.update(dto);
	
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
div{
	text-align:center;
	margin-top:100px;
}
</style>
<script type="text/javascript">
function mlist(){
	var url="list.jsp";
	url+="?col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}
</script>

</head> 
<body> 

<div>
<%
if(flag){
	out.print("메모를 수정했습니다.");
}else{
	out.print("메모수정을 실패했습니다.");
}
%>
<br><br>
<button type="button" onclick="mlist()">목록</button>
</div>

</body> 
</html>