<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="gust.GustDAO"></jsp:useBean>
<jsp:useBean id="dto" class="gust.GustDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="*"/>
<%
	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	
	dao.upAnsnum(map);
	
	
	boolean flag = dao.createReply(dto);
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
function mlist(){
	var url = "list.jsp";
	
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
}

</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="../main/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">답변확인</DIV>
<div class="content">
<%
	if(flag){
		out.print("답변을 등록했습니다");
	}else{
		out.print("등록을 실패했습니다");
	}
	

%>
</div>

  <DIV class='bottom'>

    <input type='button' value='목록' onclick="mlist()">
  </DIV>

 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
