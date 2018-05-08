<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<%
	//String passwd=request.getParameter("passwd");
	String id=request.getParameter("id");
	
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title></title> 
<style type="text/css">
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif;}
body, html {
    height: 100%;
    color: #777;
    line-height: 1.8;
}
</style>

</head> 
<body>

<br>
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green" style="margin:0 auto; width:50%; font-size: x-large; text-align: center;">패스워드 확인</DIV>
<br>
<form method="post" action="./updatePwForm.jsp">
<input type="hidden" name="id" value="<%=id %>">

<div style=" width:100%; max-width:400px; margin: 0 auto;"> 
  <TABLE class="w3-table w3-white w3-border">
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="width:40%; font-size:16px; text-shadow:1px 1px 0 #444;">P/W 입력</TH>
      <TD><input class="w3-input" type="password" name="passwd"  placeholder="기존 패스워드 입력" ></TD>
    </TR>
  </TABLE>
</div>
<br>  
  <DIV align="center">
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='submit' value='확인'  >
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='취소' onclick="window.close()">
  </DIV>
</form>
 
 
</body>
<!-- *********************************************** -->
</html> 