<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="start.StartDAO"></jsp:useBean>
<%
	String email = request.getParameter("email");
	boolean flag = dao.duplicateEmail(email);
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function use(){
	opener.frm.email.value='<%=email%>';
	self.close();
	
}
</script>

<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">email 중복 확인</DIV>

<DIV class="content">
입력된 email:<%=email %><br><br>
<% 
if(flag){
	out.print("email이 중복됩니다.<br><br>");
	}else{	
	out.print("사용가능합니다.<br><br>");
	out.print("<button type='button' onclick='use()'>사용</button>");
} 
%> 
</DIV>
 

  
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='./email_form.jsp'">
<!--     내장된 메소드 -->
    <input type='button' value='닫기' onclick="window.close()">
    											
  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
