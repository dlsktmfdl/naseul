<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="gb.GbDAO"></jsp:useBean>
<jsp:useBean id="dto" class="gb.GbDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	int nowPage=Integer.parseInt(request.getParameter("nowPage"));
	String content=request.getParameter("content2");
	int gbno=Integer.parseInt(request.getParameter("gbno"));
	
	Map map=new HashMap();
	map.put("content", content);
	map.put("gbno",gbno);
	
	boolean flag=dao.update(map);
	if(flag) 
	
	response.sendRedirect("./list.jsp?nowPage="+nowPage);
%>