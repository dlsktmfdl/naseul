<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<jsp:useBean id="dto" class="member.MemberDTO"></jsp:useBean>
<% 
	UploadSave upload=(UploadSave)request.getAttribute("upload");
	
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setId(UploadSave.encode(upload.getParameter("id")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setEmail(upload.getParameter("email"));
	dto.setJob(upload.getParameter("job"));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setTel(upload.getParameter("tel"));
	
	FileItem fileItem=upload.getFileItem("fname");
	String fname="member.jpg";
	int size=(int)fileItem.getSize();
	if(size>0){
		fname=UploadSave.saveFile(fileItem, upDir);
	}
	dto.setFname(fname);
	
	boolean flag=dao.create(dto); 
	
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 
<script type="text/javascript">
function login(){
	var url="./loginForm.jsp";
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- 내용 시작 -->
<div style="width: 100%; background-color: #f7fdfc;">
<br><br>
<!-- *********************************************** -->

<div class='w3-center' style="margin:auto; width:80%; max-width:400px;">
<%if(flag){%>
<div class="w3-panel w3-green w3-display-container" >
  <span onclick="this.parentElement.style.display='none'"
  class="w3-button w3-green w3-large w3-display-topright">&times;</span>
  <h3>Success!</h3><br>
  <p>회원가입이 완료되었습니다.</p>
</div>
<br>
<div class='w3-center'>
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='홈' onclick="location.href='../index.jsp'">
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='로그인' onclick="location.href='./loginForm.jsp'">
<!--   <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='회원목록' onclick="location.href='./list.jsp'"> -->
</div>
<%}else{%>
<div class="w3-panel w3-red w3-display-container" >
  <span onclick="this.parentElement.style.display='none'"
  class="w3-button w3-red w3-large w3-display-topright">&times;</span>
  <h3>Warning!</h3><br>
  <p>회원가입에 실패했습니다.</p>
</div>
<br>
<div class='w3-center'>
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='홈' onclick="location.href='../index.jsp'">
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='뒤로가기' onclick="history.back()">
</div>
	<%}%>
</div>
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 