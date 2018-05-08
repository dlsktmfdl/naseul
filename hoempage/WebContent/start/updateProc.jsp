<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="start.StartDAO"></jsp:useBean>
<jsp:useBean id="dto" class="start.StartDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="*" />
<%
	boolean flag = dao.update(dto);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function read(){
	var url = "./read.jsp";
	url += "?id=<%=dto.getId()%>";

	location.href = url;
}
</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="../main/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">정보수정</DIV>

	<div class="content">
		<%
			if (flag) {
				out.print("정보수정했다");
			} else {
				out.print("정보수정실패");
			}
		%>
	</div>
	<DIV class='bottom'>
	<input type='button' value='정보확인' onclick="read()">
	</DIV>



	<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>
