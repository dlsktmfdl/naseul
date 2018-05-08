<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="gb.GbDAO"></jsp:useBean>
<jsp:useBean id="mdao" class="member.MemberDAO"></jsp:useBean>
<jsp:useBean id="dto" class="gb.GbDTO"></jsp:useBean>
<%
	int gbno=0;
	if(gbno>=0)
		gbno=Integer.parseInt(request.getParameter("gbno"));

	String id=request.getParameter("id");
	if(id==null)
	id=(String)session.getAttribute("id");
	
	
	MemberDTO mdto= mdao.read(id);
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String today = formatter.format(new java.util.Date());

		//page관련
		int nowPage=1;//현재 보고있는 페이지
			if(request.getParameter("nowPage")!=null){
				nowPage=Integer.parseInt(request.getParameter("nowPage"));
			}
		
		int recordPerPage=5;//한 페이지당 보여줄 레코드 수
		
		int sno=((nowPage-1)*recordPerPage)+1;//페이지당 시작 넘버
		int eno=nowPage*recordPerPage;
		//page-end
		
		Map map=new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);

		List<GbDTO> list=dao.list(map);
		
		
		//전체 레코드 수 가져오기
		int totalRecord=dao.total();  
		

%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function gupdate(gbno){
	var url="updateProc.jsp";
	url+="?gbno="+gbno;
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
 
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green w3-wide" style="width:70%; max-width:250px; margin:0 auto; font-size: x-large; text-align: center;">방명록</DIV>
<br>
<FORM class="w3-container" name='frm' method='POST' action='./createProc.jsp'>
<input type="hidden" name="mname" value="<%=mdto.getMname()%>">
<input type="hidden" name="fname" value="<%=mdto.getFname()%>">
<input type="hidden" name="gbno" value="<%=dto.getGbno()%>">
<div style="width:50%; max-width:700px; margin: 0 auto;"> 
  <TABLE style=" width:100%; " class="w3-table w3-white w3-bordered">
    <tr>
      	<TD style="border-right-color: white;" rowspan="3" width="30%">
      		<div style="width: 190px; height: 165px; overflow: hidden">
      			<img src="../member/storage/<%=mdto.getFname()%>"  style=" display:block; width:190px; height: auto;">
      		</div>
      	</TD>
       	<TD style="border-bottom-color: white;" width="70%">
	       <%if(id==null){%>
	    	   <input type="text" size="10" name="mname2" placeholder="닉네임입력">(<%=today %>)
	       <%}else{%>
	       <%=mdto.getMname() %> (<%=today %>)
	       <%} %>
       </TD>
  	</tr>
    <TR>
      <TD style="border-bottom-color: white;">
      <textarea rows="4" cols="45" name="content"></textarea></TD>
    </TR>
    <TR>
      <TD style="text-align: right;">
      	<input class="w3-button w3-border w3-padding-small w3-hover-teal" style="width:60pt;height:20pt;" type='submit' value='등록하기'>
      	<input class="w3-button w3-border w3-padding-small w3-hover-teal" style="width:60pt;height:20pt;" type='reset' value='다시쓰기'>
      </TD>
    </TR>
  </TABLE>
</div>
</FORM>

<hr>
<%
  	for(int i=0; i<list.size();i++){
  		dto=list.get(i);
  		
	%>
<form name='frm' method='POST' action='./updateProc.jsp'>

  <input type="hidden" name="gbno" value="<%=dto.getGbno()%>">
  <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">

 <div style="width:100%; max-width:500px; margin: 0 auto; "> 
  <TABLE style=" width:100%; " class="w3-table w3-white w3-bordered">
    <tr>
      <TD style="border-right-color: white;" rowspan="3" width="30%">
      	<div style="width: 180px; height: 150px; overflow: hidden">
      		<img src="../member/storage/<%=dto.getFname()%>"  style=" display:block; width:190px; height: auto;">
      	</div>
      </TD>
       <TD style="border-bottom-color: white;" width="70%"><%=dto.getMname() %>(<%=dto.getWdate() %>)</TD>
  	</tr>
  	
    <TR>
      <TD style="border-bottom-color: white;" ><br>
      <%
      String content=dto.getContent();
   	  content=content.replaceAll("<br>", "\r\n");
      %>
    <%if(gbno==dto.getGbno()) {%> 
      <textarea rows="3" cols="35" name="content2"><%=content %></textarea>
 	<%}else{ %> 
 	<%=content %> 
 	<%} %> 
      </TD>
   
    </TR>
    <TR>
      <TD style="text-align: right;">
      	<%
      	if(gbno==dto.getGbno()){
      	%>
      	<input class="w3-button w3-border w3-padding-small w3-hover-teal" type="submit" value='수정'>
      	<input class="w3-button w3-border w3-padding-small w3-hover-teal" type="button" onclick="history.back()" value='취소'>
		<%}%>      
      </TD>
    </TR>
  </TABLE>
 </div>
  </form>
  <br>
  <%} %>
  
  <DIV class='w3-center'>
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='홈' onclick="location.href='../index.jsp'">
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='돌아가기' onclick="history.back()">
  <br><%=Utility.paging3(totalRecord, nowPage, recordPerPage) %>
  </DIV>
  
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 