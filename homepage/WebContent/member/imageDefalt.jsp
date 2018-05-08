<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<jsp:useBean id="dto" class="member.MemberDTO"></jsp:useBean>

<% 
	String id=request.getParameter("id");
	String fname=request.getParameter("fname");
	dao.resetFile(id);

%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
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

<DIV class="title">사진 삭제</DIV>
 
<div class="content">사진이 삭제되었습니다.</div>
  
  <DIV class='bottom'>

    <input type='button' value='확인' onclick="mclose()">
  </DIV>

 

</body>
<!-- *********************************************** -->
</html> 