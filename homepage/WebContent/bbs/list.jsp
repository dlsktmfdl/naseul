<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<%
	//검색관련
	String col=Utility.checkNull(request.getParameter("col"));
	String word=Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) word="";
	//검색관련 end
	
	
	//page관련
	int nowPage=1;//현재 보고있는 페이지
		if(request.getParameter("nowPage")!=null){
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
	
	int recordPerPage=10;//한 페이지당 보여줄 레코드 수
	
	int sno=((nowPage-1)*recordPerPage)+1;//페이지당 시작 넘버
	int eno=nowPage*recordPerPage;
	//page관련 end
	
	
	Map map=new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<BbsDTO> list=dao.list(map);
	
	//전체 레코드 수 가져오기
	int totalRecord=dao.total(map); 
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function bcreate(){
	var url="./createForm.jsp";
	location.href=url;
}
function read(bbsno){
	var url="./read.jsp";
	url+= "?bbsno="+bbsno;
	url+= "&col=<%=col%>";
	url+= "&word=<%=word%>";
	url+= "&nowPage=<%=nowPage%>";
	location.href=url;
}
function fileDown(filename){
	if(filename!="파일없음"){
	var url="<%=root%>/download";
	url+="?filename="+filename;
	url+="&dir=/bbs/storage";
	location.href=url;
	}
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<div style="width: 100%; background-color: #f7fdfc;">
<br><br><br>
<!-- *********************************************** -->
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green w3-wide" style="width:70%; max-width:250px; margin:0 auto; font-size: x-large; text-align: center;">자유 게시판</DIV>
<br>
<!-- 검색 -->
<FORM class="w3-container" method='POST' action='list.jsp'>
<div style="width:100%; max-width:500px; margin: 0 auto;"> 
<table class="w3-table" >
<tr>
	<td style="width:30%;">
		<select class="w3-select" name="col">
 		<option value="wname"
 		<%if(col.equals("wname")) out.print("selected"); %>
 		>성명</option>
 		<option value="title"
 		<%if(col.equals("title")) out.print("selected"); %>
 		 selected>제목</option>
 		<option value="content"
 		<%if(col.equals("content")) out.print("selected"); %>
 		>내용</option>
 		<option value="total">전체보기</option>
 	</select>
	</td>
	<td style="width:50%; align-content: center;">
		<input class="w3-input w3-border" type="search" name="word" value="<%=word%>" required>
	</td>
	<td style="width:20%;">
		<button class="w3-button w3-border w3-padding-small w3-hover-teal">검색</button>
	</td>
</tr>
</table>
</div>
</FORM>
<br>
<!-- 검색 끝 -->

<br>

<div style=" width:90%; max-width:800px; margin: 0 auto;"> 
<button class="w3-button w3-border w3-padding-small w3-hover-teal w3-block" type="button" onclick="location.href='createForm.jsp'">글 쓰기</button>
  <TABLE style=" width:100%; " class="w3-table w3-table-all">
    <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444; width:15%;">번		호</TH>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444; width:15%;">성		명</TH>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444; width:20%;">제		목</TH>
      <TH class="w3-teal w3-text-white w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444; width:20%;">등 록 날 짜</TH>
      <TH class="w3-teal w3-text-white w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444; width:15%;">조   회   수</TH>
      <th class="w3-teal w3-text-white w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444; width:15%;">파   일   명</th>
    </TR>

    <%if(list.size()==0){%>
	  <tr>
	   	<td colspan="6" style="text-align:center;">등록된 글이 없습니다.</td>
	  </tr>
    <%}else{
    	for(int i=0;i<list.size();i++){
    		BbsDTO dto=list.get(i);
    
    %>
	  <tr >
	    <td style="text-align:center; "><%=dto.getBbsno() %></td>
	    <td style="text-align:center; "><%=dto.getWname() %></td>
	    <td style="text-decoration: underline; font-size:17px;">
	    	<%
	    	if(dto.getIndent()>0){
	    	
	    	for(int r=0; r<dto.getIndent(); r++){
	    		out.print("<img src='../images/화살표.jpg' width='25px'>");
	    	}
	    		out.print("<img src='../images/re.jpg' width='30px'>");
	    	} %>
	    	<a href="javascript:read('<%=dto.getBbsno() %>')"><%=dto.getTitle() %></a>
			<%
			if (Utility.compareDay(dto.getWdate())){%>
				<img src="../images/new2.jpg" width="30px">
			<%}
			%> 
	    </td>
	    <td style="text-align:center; "><%=dto.getWdate() %></td>
	    <td style="text-align:center; "><%=dto.getViewcnt() %></td>
	    <td style="text-align:center; ">

	    				<a href="javascript:fileDown('<%=dto.getFilename() %>')"><%=dto.getFilename() %></a>
	    </td>	
	  </tr>
    </tbody>
    <%		} 
    	}%>
  </TABLE>
  <br>
  <DIV class='w3-center'>
   <%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
  </DIV>

  </div>
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 