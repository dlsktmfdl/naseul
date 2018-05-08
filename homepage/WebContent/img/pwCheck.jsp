<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="img.ImgDTO"></jsp:useBean>
<%
	int inum=Integer.parseInt(request.getParameter("inum"));
	String fname=request.getParameter("fname");
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
<script type="text/javascript">
function checkSame(f){
	if(f.pw.value!=f.repw.value){
		alert("비밀번호가 일치하지 않습니다. \n다시입력하세요.");
		f.repasswd2.focus();
		return false;
	}
}
</script>
</head> 
<body>

<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green" style="margin:0 auto; width:30%; font-size: x-large; text-align: center;">P/W 확인</DIV>
<br>
<FORM class="w3-container " onsubmit="return checkSame(this)" name='frm' method='POST' action='./deleteProc.jsp'>
<input type="hidden" name="inum" value="<%=inum %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">


<div style=" width:100%; max-width:400px; margin: 0 auto;"> 
  <TABLE class="w3-table w3-white w3-border">
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="width:40%; font-size:16px; text-shadow:1px 1px 0 #444;">P/W</TH>
      <TD><input class="w3-input" type="password" name="pw" size="20" placeholder="비밀번호를 입력하세요." required></TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="width:40%; font-size:16px; text-shadow:1px 1px 0 #444;">P/W 재입력</TH>
      <TD><input class="w3-input" type="password" name="repw" size="20" placeholder="비밀번호를 다시 입력하세요." required></TD>
    </TR>
    
  </TABLE>
</div>
<br>
  <DIV align="center">
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='submit' value='확인'>
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='취소' onclick="window.close()">
  </DIV>
</FORM>

 
</body>
<!-- *********************************************** -->
</html> 