<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="img.ImgDTO"></jsp:useBean>
<jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	int inum=Integer.parseInt(request.getParameter("inum"));
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	String nowPage=request.getParameter("nowPage");

	Map map=new HashMap();
	map.put("inum", dto.getInum());
	map.put("pw", dto.getPw());
	 
	boolean flag=dao.mypwCheck(map);
	if(flag){	%>

	<jsp:forward page="/img/aa.jsp"></jsp:forward> 
	<%}else{%>
	<jsp:forward page="/img/bb.jsp"></jsp:forward> 
<%	}
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 
</head> 

<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- 내용 시작 -->
<div style="width: 100%; background-color: #f7fdfc;">
<br><br>
<!-- *********************************************** -->
 

<!-- 	<div class="w3-panel w3-green w3-display-container"> -->
<!-- 		<span onclick="this.parentElement.style.display='none'" -->
<!-- 			class="w3-button w3-green w3-large w3-display-topright">&times;</span> -->
<!-- 		<h3>Success!</h3> -->
<!-- 		<br> -->
<!-- 		<p>글이 수정되었습니다.</p> -->
<!--     </DIV> -->
<!--      	<div class='w3-center'> -->
<!-- 	    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='확인' onclick='iclose()'> -->
<!-- 	    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='홈' onclick="location.href='../index.jsp"> -->
<!-- 	</div> -->
<%-- <%}else{%> --%>
<!-- 	<div class="w3-panel w3-red w3-display-container"> -->
<!-- 		<span onclick="this.parentElement.style.display='none'" -->
<!-- 			class="w3-button w3-red w3-large w3-display-topright">&times;</span> -->
<!-- 		<h3>Warning!</h3> -->
<!-- 		<br> -->
<!-- 		<p>글 수정에 실패했습니다. -->
<!-- 		<br><br>다시 입력하세요.<br><br></p> -->
<!-- 	</div> -->
<!--  	<div class='w3-center'> -->
<!-- 	    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='다시시도' onclick='history.back()'> -->
<!-- 	    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='취소' onclick='window.close()'> -->
<!-- 	</div> -->
<%-- 	<%}%> --%>
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 