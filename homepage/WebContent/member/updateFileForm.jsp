<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	String id=request.getParameter("id");
	String oldfile=request.getParameter("oldfile");

%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function checkFile(f){
	if(f.fname.value==""){
		alert("사진을 변경해주세요.\n변경을 원하지 않으시면, 돌아가기를 눌러주세요.");
		return false;
	}
	
}
function mread(){
	var url="./read.jsp";
	url+="?id=<%=id%>";
	location.href=url;
}
function changeFile(){
	if(confirm("사진을 삭제하시겠습니까?")){

	var url="./imageDefalt.jsp";
  	url+="?id=<%=id%>";  
  	
  	wr=window.open(url,"사진초기화","width=400,height=300");
	wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
	document.focus();
	}

}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<div style="width: 100%; background-color: #f7fdfc;">
<br><br><br>
<!-- *********************************************** -->
 
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green w3-wide" style="width:30%; max-width:200px; margin:0 auto; font-size: x-large; text-align: center;">
사진 수정</DIV>
<br><br>

<div style=" width:50%; max-width:500px; margin: 0 auto;"> 
<FORM onsubmit="return checkFile(this)" name='frm' method='POST' action='./updateFileProc.jsp'
	  enctype="multipart/form-data">
<input type="hidden" name="id" value="<%=id %>">
<input type="hidden" name="oldfile" value="<%=oldfile %>">

  <TABLE class="w3-table w3-white w3-bordered">
    <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center">현재 사진</TH>
      <TD>
      	<img src="./storage/<%=oldfile%>" width="190px" height="170px">
      	<br>현재파일명 : '<%=oldfile %>'
      </TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center">변경할 사진</TH>
      <TD>
      	<input type="file" name="fname" accept=".jpg, .gif, .png"><br>(가능파일 : JPG, PNG, GIF)
      </TD>
    </TR>
  </TABLE>
<br> 
  <DIV class='w3-center'>
    <input type='submit' value='변경하기'>
    <input type='button' value='사진삭제' onclick="changeFile()">
    <input type='button' value='돌아가기' onclick="mread()">
  </DIV>
</FORM>
</div>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 