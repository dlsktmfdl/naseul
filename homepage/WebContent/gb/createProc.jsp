<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="gb.GbDAO"></jsp:useBean>
<jsp:useBean id="dto" class="gb.GbDTO"></jsp:useBean>
 
<%
	String mname=request.getParameter("mname");
	String fname=request.getParameter("fname");
	String content=request.getParameter("content");
	
	dto.setMname(mname);
	dto.setFname(fname);
	dto.setContent(content);
	
	dao.create(dto);

	response.sendRedirect("./list.jsp");
%>
