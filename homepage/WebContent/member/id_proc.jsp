<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	String id=request.getParameter("id");
 
	boolean flag=dao.duplicateId(id);

%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title></title> 
<style type="text/css"> 
.w3-myfont {
    font-family: "Comic Sans MS", cursive, sans-serif;
}
</style> 
<script type="text/javascript">
function use(){
	opener.frm.id.value='<%=id%>';
	self.close();
}
</script>
</head> 

<body class="w3-panel w3-leftbar w3-sand" style="text-align: center;">


<div class="w3-myfont w3-xlarge">
'<%=id %>'은(는)<br>
<%
if(flag){
	out.print("사용 중인 ID입니다. <br>다시시도 해주세요.");
}else
	out.print("사용 가능한 ID입니다.");
%>
</div>

<br>  
  <DIV>
    <input class="w3-button w3-round-large w3-padding-small w3-blue-grey" type='button' value='사용하기' onclick="use()">
    <input class="w3-button w3-round-large w3-padding-small w3-blue-grey" type='button' value='다시시도' onclick="location.href='./id_form.jsp'">
    <input class="w3-button w3-round-large w3-padding-small w3-blue-grey" type='button' value='닫기' onclick="window.close()">
  </DIV>
</body>
</html> 