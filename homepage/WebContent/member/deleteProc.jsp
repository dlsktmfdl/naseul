<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<% 
	String id=request.getParameter("id");
	String fname=request.getParameter("fname");

	
	boolean flag=dao.delete(id);
	
	if(flag){
		if(fname!=null && fname.equals("member.jpg"))
			UploadSave.deleteFile(upDir, fname);
		
		session.invalidate();
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
 
<%if(flag){ %>
<div class="w3-panel w3-blue w3-display-container" style="margin:auto; width:50%;">
  <span onclick="this.parentElement.style.display='none'"
  class="w3-button w3-blue w3-large w3-display-topright">&times;</span>
  <h3>Result!</h3>
  <p>탈퇴가 완료되었습니다.<br>자동 로그아웃됩니다.</p><br>
</div>
<br>
<div class='w3-center'>  
  <button class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' onclick="location.href='../index.jsp'">확인</button> 
</div>
<%}else{ %>
<div class="w3-panel w3-blue w3-display-container" style="margin:auto; width:50%;">
  <span onclick="this.parentElement.style.display='none'"
  class="w3-button w3-blue w3-large w3-display-topright">&times;</span>
  <h3>Result!</h3>
  <p>탈퇴에 실패했습니다.</p>
</div>
<br>
<div class='w3-center'> 
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='다시시도' onclick="history.back()">
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='목록' onclick="location.href='./list.jsp'">
</div> 
  <%} %>
</div> 
 
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 