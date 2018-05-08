<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
 
	UploadSave upload=new UploadSave(request,-1,-1,tempDir);
	String id=upload.getParameter("id");
	String email=upload.getParameter("email");
	
	String str="";
	if(dao.duplicateId(id)){
		str="중복된 아이디입니다. <br>아이디 중복 확인을 해주세요.";
	}else if(dao.duplicateEmail(email)){
		str="중복된 이메일입니다. <br>이메일 중복 확인을 해주세요.";
	}else{
		request.setAttribute("upload", upload);//저장
%>
	<jsp:forward page="/member/createProc.jsp"></jsp:forward>
	<!--   forward ->이동해라     --> 
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

</style> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- 내용 시작 -->
<div style="width: 100%; background-color: #f7fdfc;">
<br><br>
<!-- *********************************************** -->


<div class='w3-center' style="margin:auto; width:80%; max-width:400px;">

<div class="w3-panel w3-yellow w3-display-container" >
  <span onclick="this.parentElement.style.display='none'"
  class="w3-button w3-yellow w3-large w3-display-topright">&times;</span>
  <h3>Warning!</h3><br>
  <p><%=str %></p>
</div>
<br>

<input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='다시시도' onclick="history.back()">
</div> 
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 