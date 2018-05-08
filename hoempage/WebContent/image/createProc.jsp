<%@page import="java.nio.file.attribute.FileTime"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi3.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"></jsp:useBean>
<jsp:useBean id="dto" class="image.ImageDTO"></jsp:useBean>
<% 
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
 	dto.setContent(UploadSave.encode(upload.getParameter("content")));
 	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
 	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
 
 	
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
 
<DIV class="title">글 등록</DIV>

<div class = "content">
<%
if(flag){
	out.print("글 등록에 성공");
}
else{
	out.print("글 등록에 실패");
%>
<%} %>
</div>
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="location.href='./list.jsp'">
  </DIV>

 
 
<jsp:include page="../main/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
