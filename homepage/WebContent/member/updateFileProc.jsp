<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	UploadSave upload=new UploadSave(request,-1,-1,tempDir);
	String id=upload.getParameter("id");
	String oldfile=UploadSave.encode(upload.getParameter("oldfile"));
	 
	FileItem fileItem=upload.getFileItem("fname");
	
	int size=(int)fileItem.getSize();
	
	String fname=null;
	if(size>0) {
		if(oldfile!=null && !oldfile.equals("member.jpg"))
			UploadSave.deleteFile(upDir, oldfile);
		
		fname=UploadSave.saveFile(fileItem, upDir);
	}
	
	Map map=new HashMap();
	map.put("id", id);
	map.put("fname", fname);
	
	boolean flag=dao.updateFile(map);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function read()	{
	var url='./read.jsp';
	url+="?id=<%=id%>";
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
			<div class="w3-panel w3-green w3-display-container">
				<span onclick="this.parentElement.style.display='none'" class="w3-button w3-green w3-large w3-display-topright">&times;</span>
				<h3>Success!</h3>
				<br>
				<p>사진이 수정되었습니다.</p>
			</div>
			<br>
			<div class='w3-center'>
				<input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='확인' onclick="read()">
			</div>
		<%}else{%>
			<div class="w3-panel w3-red w3-display-container">
				<span onclick="this.parentElement.style.display='none'" class="w3-button w3-red w3-large w3-display-topright">&times;</span>
				<h3>Failed!</h3>
				<br>
				<p>사진 수정에 실패했습니다.</p>
			</div>
			<br>
			<div class='w3-center'>
				<input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='다시시도' onclick="history.back()">
				<input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='취소' onclick="read()">
			</div>
			<%}%>

</div>
 
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 