<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>
<jsp:useBean id="dto" class="img.ImgDTO"></jsp:useBean>

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
	
	int inum=0;
	if(request.getParameter("inum")!=null)
	 	inum=Integer.parseInt(request.getParameter("inum"));
	dao.upViewcnt(inum); 
	
	List<ImgDTO> list=dao.list(map);  
	
	int totalRecord=dao.total(map);

%> 
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function read(inum){
	var url="read.jsp";
	url+="?inum="+inum;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	
	location.href=url;
}

</script>
</head> 

<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- 내용 시작 -->
<div style="width: 100%; background-color: #f7fdfc;">
<br><br><br>
<!-- *********************************************** -->
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green w3-wide" style="width:70%; max-width:250px; margin:0 auto; font-size: x-large; text-align: center;">사진 게시판</DIV>
<br>
<!-- 검색 -->
<FORM class="w3-container" method='POST' action='list.jsp'>
<div style="width:100%; max-width:500px; margin: 0 auto;"> 
<table class="w3-table" >
<tr>
	<td style="width:30%;">
		<select class="w3-select" name="col">
			<option value="title" <% if(col.equals("title")) out.print("selected"); %>>제목</option>
			<option value="content" <% if(col.equals("content")) out.print("selected"); %>>내용</option>
			<option value="mname" <% if(col.equals("mname")) out.print("selected"); %> selected>이름</option>
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
  <TABLE class="w3-table w3-white w3-table-all w3-centered">
    <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444; width:15%;">번호</TH>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444; width:25%;">제목</TH>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444; width:15%;">이름</TH>
      <TH class="w3-teal w3-text-white w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444; width:25%;">사진(download)</TH>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444; width:20%;">조회수</TH>
    </TR>
    
	<%if(list.size()==0){%>
	<tr>
		<td colspan="5" style="text-align:center">등록된 글이 없습니다.</td>
	</tr>
    <%
	}else{
		for(int i=0;i<list.size();i++){
		dto=list.get(i);
	%>
    <TR>
      <TD><%=dto.getInum() %></TD>
      <TD>
      	<a href="javascript:read('<%=dto.getInum() %>')"><%=dto.getTitle() %></a>
      </TD>
      <TD><%=dto.getMname() %></TD>
      <TD>
	      <div class="w3-col m3" style="width: 160px; height: 140px; overflow: hidden">
	      	<img src="./storage/<%=dto.getFname()%>" style=" display:block; width:160px; height: auto;" onclick="location.href='<%=root %>/download?dir=/img/storage&filename=<%=dto.getFname()%>'" class="w3-hover-opacity" 
	      		 alt="<%
	      		 String a=dto.getFname();
	      		 out.print(a.substring(0,a.length()-4));
	      		 %>">
	      		 <br>
	      </div>
      </TD>
      <TD><%=dto.getViewcnt() %></TD>
    </TR>
   <%
		}
	}
	%>
  </TABLE>
</div>
<br>
  
  <DIV class='w3-center'>
	<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
  </DIV>
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 