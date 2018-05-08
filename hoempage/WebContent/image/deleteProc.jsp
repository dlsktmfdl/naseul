<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"></jsp:useBean>


<%
	int ino = Integer.parseInt(request.getParameter("ino"));
	String passwd = request.getParameter("passwd");
	String oldfile = request.getParameter("oldfile");
	
	Map map = new HashMap();
	map.put("ino",ino);
	map.put("passwd",passwd);
	
	boolean pflag = dao.pwCheck(map);
	boolean flag = false;
	if(pflag){
		flag=dao.delete(ino);
	}
	if(flag)UploadSave.deleteFile(upDir, oldfile);
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
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="../main/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">삭제확인</DIV>
<div class="content">
<%
	if(pflag==false){
		out.print("잘못된 비번입니다.");
		out.print("<button type='button' onclick='history.back()'>다시시도</button>)");
	}else if(flag){
		out.print("글을 삭제하였습니다");
	}else{
		out.print("글 삭제를 실패하였습니다");
	}

%>

</div> 

<input type='button' value='목록'    onclick="location.href='./list.jsp'"> 
 
<!-- *********************************************** -->
<jsp:include page="../main/bottom.jsp" flush="false"/>
</body>

<!-- *********************************************** -->
</html> 
