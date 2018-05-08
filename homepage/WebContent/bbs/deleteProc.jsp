<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<%-- <jsp:setProperty property="*" name="dto"/> --%>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	String passwd=request.getParameter("passwd");
	String oldfile=request.getParameter("oldfile");

	Map map=new HashMap();
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);
	boolean pflag=dao.pwCheck(map);
	boolean flag=false;
	if(pflag){
		flag=dao.delete(bbsno);
	}
	
	if(flag){
		UploadSave.deleteFile(upDir2, oldfile);
	}
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title></title> 

<script type="text/javascript">
function blist(){
	var url="list.jsp";
	url+="?col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+= "&nowPage=<%=request.getParameter("nowPage")%>";
	opener.location.href=url;
	
	window.close();
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<div style="width: 100%; background-color: #f7fdfc;">
<br><br>
<!-- *********************************************** -->
<div class='w3-center' style="margin:auto; width:80%; max-width:400px;"> 

 <%if(pflag==false){%>
	<div class="w3-panel w3-yellow w3-display-container" >
  		<span onclick="this.parentElement.style.display='none'" class="w3-button w3-yellow w3-large w3-display-topright">&times;</span>
  		<h3>Warning!</h3><br>
 	 	<p>잘못된 비밀번호 입니다.</p>
	</div>
	<br>
	<div class='w3-center'>
	 	<input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='다시시도' onclick="history.back()">
	</div>
 <%}else if(flag){%>
	<div class="w3-panel w3-green w3-display-container" >
  		<span onclick="this.parentElement.style.display='none'" class="w3-button w3-green w3-large w3-display-topright">&times;</span>
  		<h3>Success!</h3><br>
 	 	<p>글이 삭제되었습니다.</p>
	</div>
	<br>
	<div class='w3-center'>
	 	<input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='확인' onclick="blist()">
	</div>
 <%}else{%>
	<div class="w3-panel w3-red w3-display-container" >
  		<span onclick="this.parentElement.style.display='none'" class="w3-button w3-red w3-large w3-display-topright">&times;</span>
  		<h3>Failed!</h3><br>
 	 	<p>글 삭제에 실패했습니다.</p>
	</div>
	<br>
	<div class='w3-center'>
	 	<input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='확인' onclick="blist()">
	</div>
 <%}%>
 </div>


<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 