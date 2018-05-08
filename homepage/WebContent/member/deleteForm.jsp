<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<% 
	String id=request.getParameter("id");
	if(id==null) id=(String)session.getAttribute("id");
	String fname=dao.getFname(id);
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 
<script type="text/javascript">
function checkText(f){

	var confirm="탈퇴하기";
	if(f.checktext.value!=confirm){
		alert("탈퇴하기를 정확히 입력해주세요.");
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
 
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green" style="margin:0 auto; width:25%; font-size: x-large; text-align: center;">탈퇴 확인</DIV>
<br>
 
<FORM class="w3-container" onsubmit="return checkText(this)" name='frm' method='POST' action='./deleteProc.jsp'>
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="fname" value="<%=fname%>">

  <div class="w3-center">
  	탈퇴를 하시면 더이상 정보를 제공받을 수 없습니다.
  	<br>그래도 탈퇴하시려면 '탈퇴하기'를 입력해주세요.<br>
  	<div style="width:30%; margin:auto;"><input class="w3-input w3-border" type="text" name="checktext" placeholder="탈퇴하기 입력"></div>
	<br>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='submit' value='탈퇴하기'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 