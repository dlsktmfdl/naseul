<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi2.jsp"%>
<jsp:useBean id="dao" class="gust.GustDAO"></jsp:useBean>
<jsp:useBean id="dto" class="gust.GustDTO"></jsp:useBean>

<%	
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	dto.setGustno(Integer.parseInt(upload.getParameter("gustno")));
	
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	
	String oldfile = upload.getParameter("oldfile");
	
	FileItem fileItem =upload.getFileItem("fname");
	
	int size =(int)fileItem.getSize();
	String fname="";
	if(size>0){
		fname=UploadSave.saveFile(fileItem, upDir);
		UploadSave.deleteFile(upDir, oldfile);
	}
	dto.setFname(fname);
	
	
	boolean flag = dao.update(dto);
	if(flag)UploadSave.deleteFile(upDir, oldfile);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
div {
	text-align: center;
	margin-top: 100px;
}

* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<script type="text/javascript">
	function mlist() {
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
	
	
</script>
</head>
<body>
	<div>
		<%
			if (flag) {
				out.print("수정했다.");
			} else {
				out.print("실패했습니다.");
			}
		%>
		<br>
		<button type="button" onclick="location.href='./list.jsp'">목록</button>
	</div>
</body>
</html>
