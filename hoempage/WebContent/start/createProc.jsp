<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="start.StartDAO"></jsp:useBean>
<jsp:useBean id="dto" class="start.StartDTO"></jsp:useBean>
<%
	UploadSave upload= (UploadSave)request.getAttribute("upload");
	
	dto.setId(UploadSave.encode(upload.getParameter("id")));
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setJob(upload.getParameter("job"));
	dto.setEmail(upload.getParameter("email"));
	dto.setTel(upload.getParameter("tel"));
	
	FileItem fileItem = upload.getFileItem("fname");
	String fname= "main.jpg";
	int size = (int)fileItem.getSize();
	
	if(size>0){
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	
	dto.setFname(fname);
	boolean flag = dao.create(dto); 
	
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function login(){
	
	var url = "../start/main.jsp";
	
	location.href=url;
	
}
</script>
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
 
<DIV class="title">회원가입 처리</DIV>
 
<div class="content">
 <%
 if(flag){
	 out.print("회원가입을 했습니다");
	 %>
	   <input type='button' value='로그인' onclick="location.href='loginForm.jsp'">
	 <%
 }else{
	 out.print("회원가입 실패했습니다");
 }
 %>
</div>
  <DIV class='bottom'>
    <input type='button' value='홈' onclick="location.href='main.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
