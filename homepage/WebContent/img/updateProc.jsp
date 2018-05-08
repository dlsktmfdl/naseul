<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>
<jsp:useBean id="dto" class="img.ImgDTO"></jsp:useBean>
<%
	UploadSave upload=new UploadSave(request,-1,-1,tempDir3);
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	
	dto.setInum(Integer.parseInt(upload.getParameter("inum")));
	
	int inum=Integer.parseInt(upload.getParameter("inum"));
	String nowPage=upload.getParameter("nowPage");
	String col=upload.getParameter("col");
	String word=UploadSave.encode(upload.getParameter("word"));

	String oldfile=UploadSave.encode(upload.getParameter("oldfile"));//변경전 사진
	
	FileItem fileItem=upload.getFileItem("fname");//변경후 사진
		
	String fname=oldfile;
	int size=(int)fileItem.getSize();
	if(size>0){	
		UploadSave.deleteFile(upDir3, oldfile);
		fname=UploadSave.saveFile(fileItem, upDir3);
	}
	dto.setFilesize(size);
	dto.setFname(fname);


	boolean flag=dao.update(dto);   

	
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 
<script type="text/javascript">
function iread(){
	var url="read.jsp";
	url+="?inum=<%=inum%>";
	url+= "&col=<%=request.getParameter("col")%>";
	url+= "&word=<%=request.getParameter("word")%>";
	url+= "&nowPage=<%=request.getParameter("nowPage")%>";
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
<%if(flag){ %>

		<script>
		<%session.setAttribute("Update", "S");%>
		location.href="<%=root%>/img/read.jsp?inum=<%=inum%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>";
		</script>

<%}else{%>
		<script>
		alert("글 수정에 실패했습니다.");
		history.back();
		</script>
	<%}%>
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 