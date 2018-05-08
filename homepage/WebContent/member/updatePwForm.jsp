<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	String id=request.getParameter("id");
	String passwd=request.getParameter("passwd");
	
	Map map=new HashMap();
	map.put("id", id);
	map.put("passwd", passwd);
	
	boolean flag=dao.mypwCheck(map);

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

<script type="text/javascript">
function checkSame(f){
	if(f.passwd.value==f.repasswd.value){
		alert("기존과 같은 패스워드를 사용할 수 없습니다.");
		f.repasswd.focus();
		return false;
	}
	if(f.repasswd.value!=f.repasswd2.value){
		alert("비밀번호가 일치하지 않습니다. \n다시입력하세요.");
		f.repasswd2.focus();
		return false;
	}
	
}
</script>

</head> 
<!-- *********************************************** -->
<body>
	<%if(flag){%>
<br>
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green" style="margin:0 auto; width:50%; font-size: x-large; text-align: center;">비밀번호 변경</DIV>
<br>
<FORM onsubmit="return checkSame(this)" name='frm' method='POST' action='./updatePwProc.jsp'>
<input type="hidden" name="id" value="<%=id %>">
<input type="hidden" name="passwd" value="<%=passwd %>">

<div style=" width:100%; max-width:400px; margin: 0 auto;"> 
  <TABLE class="w3-table w3-white w3-border">

    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="width:40%; font-size:16px; text-shadow:1px 1px 0 #444;">변경할 P/W</TH>
      <TD>
      	<input class="w3-input" type="password" name="repasswd" placeholder="변경할 패스워드 입력" required>
      </TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="width:40%; font-size:16px; text-shadow:1px 1px 0 #444;">P/W 재입력</TH>
      <TD>
      	<input class="w3-input" type="password" name="repasswd2" placeholder="변경할 패스워드 재입력" required>
      </TD>
    </TR>
  </TABLE>
</div>
<br>  
  <DIV class='w3-center'>
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='submit' value='변경' >
 	<input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='취소' onclick="history.back()">  </DIV>
</FORM>

	<%}else{%>

		<div class="w3-panel w3-red w3-display-container">
			<span onclick="this.parentElement.style.display='none'" class="w3-button w3-red w3-large w3-display-topright">&times;</span>
			<h3>Failed!</h3>
			<br>
			<p>비밀번호가 틀렸습니다. <br><br>다시 입력하세요.<br><br></p>
		</div>
		<br>
		<div class='w3-center'>
			<input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='확인' onclick="history.back()">
		</div>

	<%}%>
</body>
<!-- *********************************************** -->
</html> 