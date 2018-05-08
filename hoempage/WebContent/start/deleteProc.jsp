<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="start.StartDAO"></jsp:useBean>
<% 
	String id = request.getParameter("id");
	String fname = request.getParameter("fname");

	
    boolean flag = dao.delete(id);
	
    
    if(flag){
    	if(fname!=null && !fname.equals("member.jpg"))
    	UploadSave.deleteFile(upDir, fname);
    	
    	session.invalidate();
    	//자동으로 로그아웃 되도록
    }
    
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
<jsp:include page="../main/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">탈퇴확인</DIV>
<div class="content">
<%  
if(flag){
	out.print("탈퇴를 했습니다 자동 로그아웃 됩니다.");
}else{
	out.print("실패했습니다");
}
%>
</div>
  
  <DIV class='bottom'>     
    <input type='button' value='홈'  onclick="location.href='../start/main.jsp'">
    <input type='button' value='돌아가' onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
