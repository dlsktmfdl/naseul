<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="img.ImgDTO"></jsp:useBean>
<%
	int inum=Integer.parseInt(request.getParameter("inum"));
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	String nowPage=request.getParameter("nowPage");

%>
<script>

		opener.location.href="<%=root%>/img/updateForm.jsp?inum=<%=inum%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>";
		window.close();


</script>