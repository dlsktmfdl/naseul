<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="start.StartDAO"></jsp:useBean>

<%  UploadSave upload = new UploadSave(request,-1,-1,tempDir); 
	String id = upload.getParameter("id");
	String email = upload.getParameter("email");
	
	String str ="";
	
	
	if(dao.duplicateID(id)){
		str = "중복된 아이디 입니다. 아이디 중복 확인 하세요";
	}else if(dao.duplicateEmail(email)){
		str = "중복된 이메일 입니다. 이메일 중복을 확인 하세요";
	}else{
		request.setAttribute("upload",upload);
// 		upload라는 request객체를 사용하기위해 쓴것
//      리퀘스트에 저장할 수 있다
%>
	<jsp:forward page = "/start/createProc.jsp"/>
<!-- 	forward:이동해라 -->
<%
	return;
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
 
<DIV class="title">아이디 및 이멜 중복확인</DIV>
<DIV class="content">
<%=str %>
</DIV>
  
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='createForm.jsp'">
    
  </DIV>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
