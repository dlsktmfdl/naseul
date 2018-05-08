<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty property="*" name="dto"/>
<%
	//검색관련
	String col=Utility.checkNull(request.getParameter("col"));
	String word=Utility.checkNull(request.getParameter("word"));

	if(col.equals("total")) word="";
	
	//페이징관련
	int nowPage=1;
	int recordPerPage=5;
	
	if(request.getParameter("nowPage")!=null)
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	
	int sno=((nowPage-1)*recordPerPage)+1;
	int eno=nowPage*recordPerPage;
	
	Map map=new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	
	List<MemoDTO> list=dao.list(map); 
	
	int totalRecord=dao.total(map);//map에 col, word가져가려고 

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
.search{
	width: 50%;
	margin:15px auto;
	text-align:center;
	font-size:17px;
}
table,td{
	font-size:15px;
}
table,th{
	font-size:18px;
}
</style> 

<script type="text/javascript">
function read(memono){//타입 필요 없이 매개변수 선언 가능
	//alert(memono);
	
	var url="read.jsp";
	url+="?memono="+memono;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	
	
	location.href=url;
}
</script>

</head> 
<body> 
<jsp:include page="/menu/top.jsp" />

<div class="search">
<form action="list.jsp" method="post">
	<select name="col">
		<option value="title"
		<% if(col.equals("title")) out.print("selected"); %>
		>제목</option>
		<option value="content"
		<% if(col.equals("content")) out.print("selected"); %>
		>내용</option>
		<option value="total">전체보기</option>
	</select>
<input type="search" name="word" value="<%=word%>" required>
<button>검색</button>
<button type="button" onclick="location.href='memoCreate.jsp'">등록</button>
</form>
</div>

 <div class="container">
	<h2 style="text-align:center;"><span class="glyphicon glyphicon-list"></span>
	메모 목록
	</h2>

<table class="table table-hover">
<thead>
	<tr>
	<th>번호</th>
	<th>제목</th>
	<th>날짜</th>
	<th>조회수</th>
	<th>grpno</th>
	<th>indent</th>
	<th>ansnum</th>
	</tr>
</thead>
<%
	if(list.size()==0){
%>
<tbody>
	<tr>
	<td colspan="7" style="text-align:center">등록된 메모가 없습니다.</td>
	</tr>
</tbody>
<%
	}else{
	for(int i=0;i<list.size();i++){
		dto=list.get(i);
%>
<tbody>
<tr>
	<td style="text-align:center"><%=dto.getMemono() %></td>
	<td style="text-decoration: underline; font-size:17px;">
	<%
	if(dto.getIndent()>0){
		for(int in=0;in<dto.getIndent();in++){
		out.print("<img src='../images/화살표.jpg' width='20p'>");	
		}
		out.print("<img src='../images/re.jpg' width='30px'>");
	}%>
	<a href="javascript:read('<%=dto.getMemono() %>')"><%=dto.getTitle() %></a>
	<%
		if(Utility.compareDay(dto.getWdate())){%>
			<img src="../images/new2.jpg" width="30px">
		<%}
	%>
	</td>
	
	<td style="text-align:center"><%=dto.getWdate() %></td>
	<td style="text-align:center"><%=dto.getViewcnt() %></td>
	<td style="text-align:center"><%=dto.getGrpno() %></td>
	<td style="text-align:center"><%=dto.getIndent() %></td>
	<td style="text-align:center"><%=dto.getAnsnum() %></td>
	</tr>
</tbody>
	<%
		}
	}//for end
	%>
</table>


<div class="bottom">
	<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
</div>

</div>
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html>
