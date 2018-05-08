<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="memo.MemoDAO"></jsp:useBean> 
<% request.setCharacterEncoding("utf-8"); 
	int memono=Integer.parseInt(request.getParameter("memono"));
	
	boolean flag=dao.checkRefnum(memono);
	
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<link href="../css/style.css" rel="stylesheet">
<script type="text/javascript">
function mlist(){
	var url="list.jsp";
	location.href=url;
}
</script>
</head> 
<body> 
<jsp:include page="/menu/top.jsp"></jsp:include>
<% if(flag) {%>
	<div class="content">
	메인글은 삭제할 수 없습니다.<br><Br>
	<button type="button" onclick="history.back()">뒤로가기</button>
	<button type="button" onclick="mlist()">목    록</button>
	</div>
<%}else{%>
<div class="title">삭제 확인</div>

<div class="content">
<form method="post" action="deleteProc.jsp">
<input type="hidden" name="memono" value="<%=memono %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
<br>
삭제를 하면 다시 복구 할 수 없습니다.<br>
그래도 삭제하시려면 삭제 버튼을 눌러주시고,<br>
취소하고 싶으시면 목록 버튼을 눌러주세요.<br>
<br>
<button>삭제처리</button>
<button type="button" onclick="mlist()">목    록</button>

</form>
</div>
<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body> 
</html>
<%}%>