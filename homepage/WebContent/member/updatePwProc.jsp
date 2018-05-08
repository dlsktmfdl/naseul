<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	String id=request.getParameter("id");
	String passwd=request.getParameter("repasswd");
	
	Map map=new HashMap();
	map.put("id", id);
	map.put("passwd", passwd);
	boolean flag=dao.updatePw(map); 

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
function mclose(){
	var url="./read.jsp";
	url+="?id=<%=id%>";
	opener.location.href=url;
	window.close();
}
</script>

</head> 
<!-- *********************************************** -->
<body>
 
<%if(flag){%>
		<div class="w3-panel w3-green w3-display-container">
				<span onclick="this.parentElement.style.display='none'" class="w3-button w3-green w3-large w3-display-topright">&times;</span>
				<h3>Success!</h3>
				<br>
				<p>비밀번호가 변경되었습니다.</p>
			</div>
			<br>
			<div class='w3-center'>
				<input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='확인' onclick="mclose()">
			</div>
	<%}else{%>
		<div class="w3-panel w3-red w3-display-container">
				<span onclick="this.parentElement.style.display='none'" class="w3-button w3-red w3-large w3-display-topright">&times;</span>
				<h3>Failed!</h3>
				<br>
				<p>비밀번호 변경에 실패했습니다.</p>
			</div>
			<br>
			<div class='w3-center'>
				<input class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' value='다시시도' onclick="history.back()">
			</div>
	<%}%>

</body>
<!-- *********************************************** -->
</html> 