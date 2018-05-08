<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="bbs.BbsDTO"></jsp:useBean>
<%
	UploadSave upload=new UploadSave(request,-1,-1,tempDir2);
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno")));
	dto.setGrpno(Integer.parseInt(upload.getParameter("grpno")));
	dto.setIndent(Integer.parseInt(upload.getParameter("indent")));
	dto.setAnsnum(Integer.parseInt(upload.getParameter("ansnum")));
	
	String nowPage=upload.getParameter("nowPage");
	String col=upload.getParameter("col");
	String word=UploadSave.encode(upload.getParameter("word"));
	
	FileItem fileItem=upload.getFileItem("filename");
	int size=(int)fileItem.getSize();
	String filename="파일없음";
	if(size>0){	
		filename=UploadSave.saveFile(fileItem, upDir2);
	}
	dto.setFilesize(size);
	dto.setFilename(filename);

	//ansnum 증가
	Map map=new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	dao.upAnsnum(map);

	//답변추가
	boolean flag=dao.createReply(dto);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function blist(){
	var url="list.jsp";
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+= "&nowPage=<%=nowPage%>";
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<div style="width: 100%; background-color: #f7fdfc;">
<br><br>
<!-- *********************************************** -->
<div class='w3-center' style="margin:auto; width:80%; max-width:400px;">
<%if(flag){%>
<div class="w3-panel w3-green w3-display-container" >
  <span onclick="this.parentElement.style.display='none'"
  class="w3-button w3-green w3-large w3-display-topright">&times;</span>
  <h3>Success!</h3><br>
  <p>답글이 등록되었습니다.</p>
</div>
<br>
<div class='w3-center'>
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='확인' onclick="location.href='./list.jsp'">
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='홈' onclick="location.href='../index.jsp'">
</div>
<%}else{%>
<div class="w3-panel w3-red w3-display-container" >
  <span onclick="this.parentElement.style.display='none'"
  class="w3-button w3-red w3-large w3-display-topright">&times;</span>
  <h3>Failed!</h3><br>
  <p>답글 등록에 실패했습니다.</p>
</div>
<br>
<div class='w3-center'>
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='목록' onclick="location.href='./list.jsp'">
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='다시시도' onclick="history.back()">
</div>
	<%}%>
</div>
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 