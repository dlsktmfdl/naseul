<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi3.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"/>
<jsp:useBean id="dto" class="image.ImageDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	
	if(col.equals("total")) word="";
	//만약 col에 있는 total의 값이 기존의 값과 같은지 확인하고 word 빈공간 출력
	
	//페이징관련
	
	int nowPage = 1;
	int recordPerPage = 5;
	
	if(request.getParameter("nowPage")!=null)
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	
	int sno = ((nowPage-1) * recordPerPage) +1;
	int eno = nowPage * recordPerPage;
	Map map = new HashMap();
	map.put("col",col);
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno",eno);

	
	List<ImageDTO> list = dao.list(map);
	
	int totalRecord = dao.total(map);
	
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<!-- <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css"> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<title></title> 
<style type="text/css">

.search{
width :80%;
margin : 20px auto;
text-align : center;
}
.title{
font-size: 28px;
text-align: center;
border-style: solid; /* 실선 */
border-width: 1px; /* 선 두께 */
border-color: #AAAAAA; /* 선 색깔 */
color: #000000; /* 글자 색깔 */
width: 30%; /* 화면의 30% */ 
padding: 10px; /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
TABLE{
margin: 0 auto; /* 테이블 가운데 정렬 */
border-color: #AAAAAA; /* 테이블 외곽선 색깔 */ 
border-width: 1px; /* 테이블 외곽선 두께 */ 
border-style: solid; /* 테이블 외곽선 스타일 */
border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */
}
TH{
border-color: #AAAAAA; /* 테이블 외곽선 색깔 */ 
border-width: 1px; /* 테이블 외곽선 두께 */ 
border-style: solid; /* 테이블 외곽선 스타일 */

color: #FFFFFF; /* 글자 색 */ 
background-color: #668db4; /* 배경 색 */
padding: 5px; /* 셀 내부 간격 */
}
td{
border-color: #AAAAAA; /* 테이블 외곽선 색깔 */ 
border-width: 1px; /* 테이블 외곽선 두께 */ 
border-style: solid; /* 테이블 외곽선 스타일 */

color: #000000; /* 글자 색 */ 
background-color: #FFFFFF; /* 배경 색 */
padding: 5px; /* 셀 내부 간격 */ 
}
.bottom{
text-algin:center;
}


</style>

<script type="text/javascript">
function read(ino){
	
	var url = "read.jsp";
	url += "?ino="+ino;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	location.href=url;
}

</script>

</head> 
<body>
<jsp:include page="../main/top2.jsp"></jsp:include>



<!-- <div class="container-fluid"> -->
<h2 class="title">게시글 목록</h2>

<!-- <table class="table table-condensed"> -->
<table>
<!--  style ="border:0px solid ; text-align:center;" -->
<thead>
<tr>

<th> 번호 </th>
<th> 제목 </th>
<th> 내용 </th>
<th> 날짜 </th>
<th> 이미지 </th>

</tr>
</thead>

<%if(list.size()==0){ %>
<tbody>
<tr>

<td colspan="5"> 등록된 메모가 없습니다. </td>

</tr>
</tbody>
<tr>
<%} else{
	for(int i=0; i<list.size(); i++){
	dto= list.get(i);	
	
%>
<td> <%=dto.getIno() %> </td>

<td>
<a href="javascript:read('<%=dto.getIno() %>')"> <%=dto.getTitle()%></a> 
</td>

<td> <%=dto.getContent()%></td>

<td> <%=dto.getWdate() %> </td>

<td rowspan="5" width="30%">
	<img src="./storage/<%=dto.getFname()%>" width="70px" height="50px">
	</td>

</tr>
</tbody>
<%} 
}
%>
</table>


<div class="bottom">
<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
</div>

<div class="search">
<form action="./list.jsp" method="post">
<select name="col">
	<option value="title"
	<%if(col.equals("title")) out.print("selected");%>
	>제목</option>
	<option value="content"
	<%if(col.equals("content")) out.print("selected");%>
	>내용</option>
	<option value="total">전체출력</option>
</select>
<input type="search" name="word" value="<%=word %>" required>
<button>검색</button>
<button type="button" onclick="location.href='createForm.jsp'">등록</button>
</form>
</div>
<jsp:include page="../main/bottom.jsp" flush="false"/>
</body> 
</html> 