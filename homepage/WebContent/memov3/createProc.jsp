<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty name="dto" property="*" />

<%
	boolean flag=dao.create(dto);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<script type="text/javascript">
function mclose(){
	var url="../homepage/contact.jsp";
	opener.location.href=url;
	window.close();
}
function mhome(){
	var url="../index.jsp";
	opener.location.href=url;
	window.close();
}
</script>
</head>
<body>
<br>
<div class='w3-center' style="margin:auto; width:80%; max-width:400px;">
<%if(flag){%>
<div class="w3-panel w3-green w3-display-container" >
  <span onclick="this.parentElement.style.display='none'"
  class="w3-button w3-green w3-large w3-display-topright">&times;</span>
  <h3>Success!</h3><br>
  <p>글이 성공적으로 전송되었습니다.</p>
</div>
<br>
<div class='w3-center'>
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='닫기' onclick="mclose()">
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='홈' onclick="mhome()">
</div>
<%}else{%>
<div class="w3-panel w3-red w3-display-container" >
  <span onclick="this.parentElement.style.display='none'"
  class="w3-button w3-red w3-large w3-display-topright">&times;</span>
  <h3>Failed!</h3><br>
  <p>글 전송에 실패했습니다.</p>
</div>
<br>
<div class='w3-center'>
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='취소' onclick="mclose()">
  <input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='다시시도' onclick="window.close()">
</div>
	<%}%>
</div>

</body>
</html>
