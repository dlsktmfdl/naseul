<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi3.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"></jsp:useBean>
<%	
	int ino = Integer.parseInt(request.getParameter("ino"));
	ImageDTO dto = dao.read(ino);
	String content = dto.getContent();
	content = content.replace("\r\n","<br>");
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
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
function mupdate(ino){
var url ="./updateForm.jsp";
url += "?ino=<%=ino%>"; 
url += "&oldfile=<%=dto.getFname()%>"; 
location.href=url;
}

function mdel(ino){
var url ="./deleteForm.jsp";
url += "?ino=<%=ino%>";
url += "&oldfile=<%=dto.getFname()%>";
location.href=url;
}

function readGo(ino){
	var url = "./read.jsp";
	url = url +"?ino="+ino;
	
	location.href=url;
}

function fileDown(fname){
var url="<%=root%>/download";
url += "?filename="+fname;
url += "&dir=/image/storage";
location.href=url;
}


</script>
<!-- <link href="../css/style.css" rel="Stylesheet" type="text/css"> -->
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="../main/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">조회</DIV>
 
  <TABLE style="width:50%">
    <TR>
      <TD colspan="2">
      <a href="javascript:fileDown('<%=dto.getFname() %>')"><img src="./storage/<%=dto.getFname() %>" width="100%">
      </a>
      </TD>
    </TR>
	
	<tr>
    <th>제목</th>
    <td><%=dto.getTitle() %></td>
    </tr>
	    
    <tr>
    <th>내용</th>
    <td><%=content %></td>
    </tr>
    
    <tr>
    <th>작성자</th>
    <td><%=dto.getMname() %></td>
    </tr>
    
    <tr>
    <th>날짜</th>
    <td><%=dto.getWdate() %></td>
    </tr>
  </TABLE>
  <table style="width:50%">
  <tr>
  <%
  List list = dao.imgRead(ino);
  String[] files = (String[])list.get(0);
  int[] noArr = (int[])list.get(1);
  for(int i=0; i<5; i++){
	  if(files[i]==null){
  %>
  <td class="td_padding">
  <img src="./storage/default.jpg" width="100%">
  <td>
  <%
  }else{
	  if(noArr[i]==ino){
  
  %>
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img class="curImg" src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
  <%
  		}else{
  %>
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
  <%
  		}
  	}
  }
  %>
  </tr>
  </table>

 
  <DIV class='bottom'>
   <center>
    <input type='button' value='정보수정' onclick="mupdate(<%=dto.getIno()%>)">
    <input type='button' value='삭제'    onclick="mdel(<%=dto.getIno()%>)">
    <input type='button' value='목록'    onclick="location.href='./list.jsp'">
  </center>
  </DIV>
 
<jsp:include page="../main/bottom.jsp" flush="false"/> 
</body>
</html> 
