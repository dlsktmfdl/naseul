<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>

<%
String id=request.getParameter("id");
if(id==null) id=(String)session.getAttribute("id");
	//검색관련
	String col=Utility.checkNull(request.getParameter("col"));
	String word=Utility.checkNull(request.getParameter("word"));
	if(col.equals("total")) word="";
	
	//페이징관련
	int nowPage=1;
	int recordPerPage=3;
	if(request.getParameter("nowPage")!=null){
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
	
	//db에서 가져올 순번
	int sno=((nowPage-1)*recordPerPage)+1;
	int eno=nowPage*recordPerPage;
	
	//dao메소드 호출
	Map map=new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	List<MemberDTO> list=dao.list(map);
	
	//페이징 출력 메소드 호출
	int totalRecord=dao.total(map);
	String paging=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function read(id){
	var url="../member/read.jsp";
	url+="?id="+id;
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<div style="width: 100%; background-color: #f7fdfc;">
<br><br><br>
<!-- *********************************************** -->
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green w3-wide" style="width:70%; max-width:250px; margin:0 auto; font-size: x-large; text-align: center;">회원 목록</DIV>
<br>

<FORM class="w3-container" method='POST' action='list.jsp'>
<div style="width:100%; max-width:500px; margin: 0 auto; text-align: center;"> 
	<table class="w3-table" style="margin: 0 auto; text-align: center;">
		<tr>
			<td style="width:30%;">
			 	<select name="col">
			 		<option value="mname"
			 		<%if(col.equals("mname")) out.print("selected");%>
			 		>성명</option>
			 		<option value="id"
			 		<%if(col.equals("id")) out.print("selected");%>
			 		>ID</option>
			 		<option value="email"
			 		<%if(col.equals("email")) out.print("selected");%>
			 		>E-mail</option>
			 		<option value="total"
			 		<%if(col.equals("total")) out.print("selected");%>
			 		>전체보기</option>
			 	</select>
			 </td>
			 <td style="width:50%; align-content: center;">
			 		<input class="w3-input w3-border" type="search" name="word" required value="<%=word%>">
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

  	<%
  	for(int i=0; i<list.size();i++){
  		MemberDTO dto=list.get(i);		
	%>
<div style=" width:90%; max-width:800px; margin: 0 auto;"> 
  <TABLE style=" width:100%; " class="w3-table w3-table-all">
    <TR>
      <TD rowspan="5" width="20%">
      	<div style="width: 190px; height: 170px; overflow: hidden">
      		<img src="../member/storage/<%=dto.getFname()%>"  style=" display:block; width:190px; height: auto;">
      	</div>
      </TD>
      <th width="30%">ID</th>
      <td width="50%"  style="text-decoration: underline; font-size:17px;">
      <a href="javascript:read('<%=dto.getId() %>')"><%=dto.getId() %></a></td>
    </TR>
    
    <TR>
      <TH>성명</TH>
      <TD><%=dto.getMname() %></TD>
    </TR>
    
    <TR>
      <TH>전화번호</TH>
      <TD><%=dto.getTel()%></TD>
    </TR>
    
    <TR>
      <TH>E-mail</TH>
      <TD><%=dto.getEmail() %></TD>
    </TR>
    
    <TR>
      <TH>주소</TH>
      <TD>
        <%=Utility.checkNull(dto.getAddress1()) %>
      	<br><%=Utility.checkNull(dto.getAddress2()) %>
      </TD>
    </TR>

  </TABLE>
</div>
  <br>
<%}%> 
  <DIV class='w3-center'>
    <%=paging %>
  </DIV>
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 