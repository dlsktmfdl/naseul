<%@page import="com.sun.org.apache.bcel.internal.classfile.Attribute"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 
<script type="text/javascript">
function inCheck(f){
	if(f.fname.value==""){
		alert("사진 파일을 선택하세요.");
		f.fname.focus();
		return false;
	}
	if(f.mname.value==""){
		alert("이름을 입력하세요.");
		f.mname.focus();
		return false;
	}
	if(f.title.value==""){
		alert("제목을 입력하세요.");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요.");
		f.content.focus();
		return false;
	}
	if(f.pw.value==""){
		alert("비밀번호를 입력하세요.");
		f.pw.focus();
		return false;
	}
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
 
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green" style="width:50%; max-width:200px; margin:0 auto; font-size: x-large; text-align: center;">글 쓰기</DIV>
<br>
<FORM class="w3-container" name='frm' method='POST' enctype="multipart/form-data" onsubmit="return inCheck(this)" action='./createProc.jsp'>
<div style=" width:70%; max-width:500px; margin: 0 auto;"> 
  <TABLE class="w3-table w3-white w3-bordered">
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444;">사진</TH>
      <TD>
      	<input class="w3-input w3-border-0" type="file" name="fname" accept=".jpg,.png,.gif" ><p style="text-align: right;">(JPG, PNG, GIF 파일)</p>
      </TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444;">이름</TH>
      <TD>
      	
      	<input class="w3-input w3-border-0" type="text" name="mname">
      </TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444;">제목</TH>
      <TD>
      	<input class="w3-input w3-border-0" type="text" name="title">
      </TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444;">내용</TH>
      <TD>
      	<textarea name="content" style="width:100%; height:200px;"></textarea>
      </TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444;">비밀번호</TH>
      <TD>
      	<input class="w3-input w3-border-0" type="password" name="pw">
      </TD>
    </TR>
  </TABLE>
</div>
<br>
  
  <DIV class='w3-center'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='submit' value='등록'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='reset' value='다시쓰기'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='취소' onclick="location.href='./list.jsp'">
  </DIV>
</FORM>
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 