<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi3.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"></jsp:useBean> 
<% 
	int ino = Integer.parseInt(request.getParameter("ino"));
    
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="../main/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">비밀번호를 입력하세요</DIV>
 
<FORM name='frm' method='POST' action='deleteProc.jsp'>
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="ino" value="<%=ino%>">
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>">
  <TABLE>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd" placeholder="비번을 입력하세요" required></TD>
      
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='삭제'>
    <input type='button' value='목록' onclick="location.href='list.jsp'">
  </DIV>
</FORM>
 
<jsp:include page="../main/bottom.jsp" flush="false"/> 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
