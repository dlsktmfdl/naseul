<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi3.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"></jsp:useBean> 
<jsp:useBean id="dto" class="image.ImageDTO"></jsp:useBean> 
<% 
	UploadSave upload = new UploadSave(request, -1 , -1, tempDir);
	dto.setIno(Integer.parseInt(upload.getParameter("ino")));

	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	String oldfile = upload.getParameter("oldfile");
	
	
	
	Map map = new HashMap();
	map.put("ino", dto.getIno());
	map.put("passwd", dto.getPasswd());
	
	
	FileItem fileItem = upload.getFileItem("fname");
	
	int size= (int)fileItem.getSize();
	String fname = null;
	if(size>0){
		fname=UploadSave.saveFile(fileItem, upDir);
		UploadSave.deleteFile(upDir, oldfile);
	}
	dto.setFname(fname);
	
	
	boolean pflag = dao.pwCheck(map);
	boolean flag = false;
	if(pflag){
		flag = dao.update(dto);
	}
	if(flag)UploadSave.deleteFile(upDir, oldfile);
	
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
<center>
<DIV class="title">업데이트 확인</DIV>
<% 
if(pflag==false){
	out.print("실패");
	out.print("비밀번호를 확인하세요");
}else if(pflag==true){
	out.print("업데이트에 성공하셨습니다");
}else{
	out.print("죄송합니다 왜 실패했는지 저도 잘 모르겠네요 ");
}

%> 
</center>
 <center><input type='button' value='목록'  onclick="location.href='./list.jsp'">
 </center>
<!-- *********************************************** -->
<jsp:include page="../main/bottom.jsp" flush="false"/>
</body>

<!-- *********************************************** -->
</html> 
