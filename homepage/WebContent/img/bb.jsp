<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="img.ImgDTO"></jsp:useBean>
<%
	int inum=Integer.parseInt(request.getParameter("inum"));
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	String nowPage=request.getParameter("nowPage");
	String fname=request.getParameter("fname");

%>
<script>
	alert("비밀번호가 틀렸습니다. 다시 입력하세요.");
	location.href="<%=root%>/img/pwCheck2.jsp?inum=<%=inum%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>&fname=<%=fname%>";

</script>