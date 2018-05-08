<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>
<jsp:useBean id="dto" class="img.ImgDTO"></jsp:useBean>
<%
	UploadSave upload=new UploadSave(request,-1,-1,tempDir);

	int inum=Integer.parseInt(upload.getParameter("inum"));
	String pw=UploadSave.encode(upload.getParameter("pw"));
	String nowPage=upload.getParameter("nowPage");
	String col=upload.getParameter("col");
	String word=UploadSave.encode(upload.getParameter("word"));
	String fname=UploadSave.encode(upload.getParameter("fname"));
	
	Map map=new HashMap();
	map.put("inum", inum);
	map.put("pw", pw);
	
	boolean flag=dao.mypwCheck(map);
	if(flag){		
		UploadSave.deleteFile(upDir3, fname);
		boolean pflag=dao.delete(inum); 
	
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title></title> 

<style type="text/css"> 
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif;}
body, html {
    height: 100%;
    color: #777;
    line-height: 1.8;
}

</style> 
<script type="text/javascript">
function iclose(){
	var url="./list.jsp";
	url+="?inum=<%=inum%>";
	opener.location.href=url;
	window.close();
}
</script>
</head> 

<!-- *********************************************** -->
<body>

<!-- 내용 시작 -->
<div style="width: 100%; background-color: #f7fdfc;">
<br><br>
<!-- *********************************************** -->
	<div class="w3-panel w3-green w3-display-container">
		<span onclick="this.parentElement.style.display='none'"
			class="w3-button w3-green w3-large w3-display-topright">&times;</span>
		<h3>Success!</h3>
		<br>
		<p>글이 삭제되었습니다.</p>
    </DIV>
     	<div class='w3-center'>
	    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='확인' onclick='iclose()'>
	    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='홈' onclick="location.href='../index.jsp'">
	</div>
<%}else{%>
	<div class="w3-panel w3-red w3-display-container">
		<span onclick="this.parentElement.style.display='none'"
			class="w3-button w3-red w3-large w3-display-topright">&times;</span>
		<h3>Warning!</h3>
		<br>
		<p>비밀번호가 틀렸습니다. 
		<br><br>다시 입력하세요.<br><br></p>
	</div>
 	<div class='w3-center'>
	    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='다시시도' onclick='history.back()'>
	    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='취소' onclick='window.close()'>
	</div>
	<%}%>
</body>
<!-- *********************************************** -->
</html> 