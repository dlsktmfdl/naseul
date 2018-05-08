<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi2.jsp" %>
<jsp:useBean id="dao" class="gust.GustDAO"/>
<%
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	
	if(col.equals("total")) word="";
	
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

	
	List<GustDTO> list = dao.list(map);
	
	int totalRecord = dao.total(map);
	
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
.search{
	width:80;
	text-align: center;
	margin: 2px auto;
}
</style>
<style type="text/css"> 
/* .search{ */
/* width :80%; */
/* margin : 20px auto; */
/* text-align : center; */
/* } */
/* .title{ */
/* font-size: 28px; */
/* text-align: center; */
/* border-style: solid; /* 실선 */ */
/* border-width: 1px; /* 선 두께 */ */
/* border-color: #AAAAAA; /* 선 색깔 */ */
/* color: #000000; /* 글자 색깔 */ */
/* width: 30%; /* 화면의 30% */  */
/* padding: 10px; /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */ */
/* margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/ */
/* } */
/* TABLE{ */
/* margin: 0 auto; /* 테이블 가운데 정렬 */ */
/* border-color: #AAAAAA; /* 테이블 외곽선 색깔 */  */
/* border-width: 1px; /* 테이블 외곽선 두께 */  */
/* border-style: solid; /* 테이블 외곽선 스타일 */ */
/* border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */ */
/* } */
/* TH{ */
/* border-color: #AAAAAA; /* 테이블 외곽선 색깔 */  */
/* border-width: 1px; /* 테이블 외곽선 두께 */  */
/* border-style: solid; /* 테이블 외곽선 스타일 */ */

/* color: #FFFFFF; /* 글자 색 */  */
/* background-color: #668db4; /* 배경 색 */ */
/* padding: 5px; /* 셀 내부 간격 */ */
/* } */
/* td{ */
/* border-color: #AAAAAA; /* 테이블 외곽선 색깔 */  */
/* border-width: 1px; /* 테이블 외곽선 두께 */  */
/* border-style: solid; /* 테이블 외곽선 스타일 */ */

/* color: #000000; /* 글자 색 */  */
/* background-color: #FFFFFF; /* 배경 색 */ */
/* padding: 5px; /* 셀 내부 간격 */  */
/* } */
/* .bottom{ */
/* text-algin:center; */
/* } */
</style>
<!-- <link href="../css/style.css" rel="stylesheet"> -->

<script type="text/javascript">
function read(gustno){
	var url = "read.jsp";
	url += "?gustno="+gustno;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	location.href=url;
}
/*JSP 코드 상에서 자바스크립트 변수는 직접적으로 사용 불가능하다. 그러므로 자바스크립트에서 따로 표시를 해줘야한다. 매개변수 선언 시
타입을 표시해주지 않는다.
링크에 색깔을 기본 파란색이 아닌 검정색으로 입히기 위해 a:link,visited 등을 사용했다
var로 변수 선언하고 url를 만들었다. location.href=url;은 get 방식이다. http://localhost:8000/jsptest/memo/read.jsp?memono=13 이런식으로 memono=13으로 가게된다.
*/
</script>

</head> 
<body> 
<jsp:include page="../main/top2.jsp"></jsp:include>

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
<button type="button" onclick="location.href='gustCreate.jsp'">등록</button>
</form>
</div>

<div class="container-fluid">
<h2><span class="glyphicon glyphicon-th-list"></span>메모 목록</h2>

<table class="table table-condensed">

<thead>
<tr>
<th> 사진 </th>
<th> 번호 </th>
<th> 제목 </th>
<th> 날짜 </th>
<th> 조회수 </th>
<th> grpno </th>
<th> indent </th>
<th> ansnum </th>
</tr>
</thead>
<!-- tr은 행, th가 열을 생성한다.-->
<%if(list.size()==0){ %>
<tbody>
<tr>
<!-- resultset select dql 했을 때 결과값을 받아오는 것 처음에는 Column을 가리키고 있다가 rs.next하면 다음 행을 가리킨다.-->
<td colspan="7"> 등록된 메모가 없습니다. </td>
<!-- rs.next가 없을 때까지 확인하고 가로로 병합한다. -->
</tr>
</tbody>
<%} else{
	for(int i=0; i<list.size(); i++){
	GustDTO dto= list.get(i);	
	
%>
<tbody>
<tr>
<td rowspan="8" width="10%">
<img src="./storage/<%=dto.getFname()%>" width="70px" height="15px">
</td>
<td> <%=dto.getGustno() %> </td>
<td>
<%if(dto.getIndent()>0) {
	
	for(int r=0; r<dto.getIndent();r++){
		out.print("&nbsp;&nbsp;");
	}
	out.print("<img src='../images/re.jpg' width=20 height=15>");
}%>
<a href="javascript:read('<%=dto.getGustno() %>')"> <%=dto.getTitle()%></a> 
<%if(Utility.compareDay(dto.getWdate())){%>
<!-- 		 <img src='../images/new.gif'> -->
<%}%>
			

</td>
<td> <%=dto.getWdate() %> </td>
<td> <%=dto.getViewcnt() %> </td>
<td> <%=dto.getGrpno() %> </td>
<td> <%=dto.getIndent() %> </td>
<td> <%=dto.getAnsnum() %> </td>
</tr>
</tbody>
<%} 
}
	
%>
</table>

<!-- do-while 문은 무조건 1번은 실행하는 반복문. %=는 표현식(out.print 개념으로 브라우저에 출력) 계속 테이블을 만들다가 false면 반복문.. 테이블을 빠져나온다.-->
<div class="bottom">
<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>

<!-- <button type="button" onclick="location.href='./memoCreate.jsp'"> 등록 </button> -->
</div>
</div>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</body> 
</html> 