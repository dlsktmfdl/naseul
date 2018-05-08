<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="gb.GbDAO"></jsp:useBean>
<jsp:useBean id="dto" class="gb.GbDTO"></jsp:useBean>


<%
	int nowPage=Integer.parseInt(request.getParameter("nowPage"));
	int gbno=Integer.parseInt(request.getParameter("gbno"));

	
	dao.delete(gbno);
	
	response.sendRedirect("./list.jsp?nowPage="+nowPage);
%>