<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="gb.GbDAO"></jsp:useBean>
<jsp:useBean id="mdao" class="member.MemberDAO"></jsp:useBean>
<jsp:useBean id="dto" class="gb.GbDTO"></jsp:useBean>
<%
 	String id=request.getParameter("id");
 	if(id==null)
	id=(String)session.getAttribute("id");
	
	MemberDTO mdto= mdao.read(id);
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String today = formatter.format(new java.util.Date());

	//페이징
		int nowPage=1;//현재 보고있는 페이지
			if(request.getParameter("nowPage")!=null){
				nowPage=Integer.parseInt(request.getParameter("nowPage"));
			}
		
		int recordPerPage=4;//한 페이지당 보여줄 레코드 수
		
		int sno=((nowPage-1)*recordPerPage)+1;//페이지당 시작 넘버
		int eno=nowPage*recordPerPage;

		//dao메소드 호출
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
	var url="./updateForm.jsp";
	url+="?gbno="+gbno;
	url+="&nowPage=<%=nowPage%>";
	location.href=url;

}
 function gdelete(gbno){
 	
	if(confirm("삭제하면 데이터를 복구할 수 없습니다.\n그래도 삭제하시겠습니까?")){
 	var url="./deleteProc.jsp"
 	url+="?gbno="+gbno;
 	url+="&nowPage=<%=nowPage%>"; 
 	location.href=url;
 	}
 
 }
 function gdelete2(){
	alert("로그인 후 이용해주세요.");
 }
 function gdelete3(){
	 alert("다른 사람의 글은 삭제할 수 없습니다.");
 }
 function gupdate2(){
	alert("로그인 후 이용해주세요.");
 }
 function gupdate3(){
	 alert("다른 사람의 글은 수정할 수 없습니다.");
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
<% if(id!=null){ %>  
<FORM class="w3-container"  name='frm' method='POST' action='./createProc.jsp'>
<input type="hidden" name="mname" value="<%=mdto.getMname() %>">
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
       		<%=mdto.getMname() %> (<%=today %>)
       	</TD>
  	</tr>
    <TR>
      <TD style="border-bottom-color: white;"><textarea rows="4" cols="45" name="content"></textarea></TD>
    </TR>
    <TR>
      <TD style="text-align: right; border-bottom-color: white;">
      	<input class="w3-button w3-border w3-padding-small w3-hover-teal" style="width:60pt;height:20pt;" type='submit' value='등록하기'>
      <input class="w3-button w3-border w3-padding-small w3-hover-teal" style="width:60pt;height:20pt;" type='reset' value='다시쓰기'>
      </TD>
    </TR>
  </TABLE>
</div>
</FORM>

<%} else{ %>

	<div class="w3-center">
	방명록 작성은 로그인 후 이용해주세요.<br>
	<input type='button' onclick="location.href='../member/loginForm.jsp'" value='로그인'>
	</div>
  	<%} %>

<hr>
<!-- list -->
<hr>
	<%
  	for(int i=0; i<list.size();i++){
  		dto=list.get(i);
  		
	%>
 <div style="width:100%; max-width:500px; margin: 0 auto; "> 
  <TABLE style=" width:100%; " class="w3-table w3-white w3-bordered">
    <tr>
      <TD style="border-right-color: white;" rowspan="3" width="30%">
      	<div style="width: 180px; height: 150px; overflow: hidden">
      		<img src="../member/storage/<%=dto.getFname()%>"  style=" display:block; width:180px; height: auto;">
      	</div>
      </TD>
      <TD style="border-bottom-color: white;" width="70%">
      <%=dto.getMname() %>(<%=dto.getWdate() %>)
      </TD>
  	</tr>
    <TR>
      <%	
		String content=dto.getContent();
		content=content.replaceAll("\r\n", "<br>");
	  %> 
      <TD style="border-bottom-color: white;" ><br>
      <%=content %>
      </TD>
    </TR>
    <TR>
      <TD style="text-align: right;">
      	<!-- 수정 -->
      	<%
      	if(id!=null){
      		if(!dto.getMname().equals(mdto.getMname())){
      	%>
      		<a href="javascript:gupdate3()">수정</a>/
      	<%		}else{%>
      				<a href="javascript:gupdate(<%=dto.getGbno()%>)">수정</a>/
      	<%	
      		}
      		
      		}else{ %>
     		<a href="javascript:gupdate2()">수정</a>/
      <%} %>
      
      	<!-- 삭제 -->
      	<%
      	if(id!=null){
      		if(!dto.getMname().equals(mdto.getMname())){		
      	%>
      		<a href="javascript:gdelete3()">삭제</a>
      	<%}else{ %>
      		<a href="javascript:gdelete(<%=dto.getGbno()%>)">삭제</a>
      <%}
      		}else{ %>
      <a href="javascript:gdelete2()">삭제</a>
      <%} %>
      </TD>
    </TR>

  </TABLE>
</div>

  <br>
  <%} %>
  
  <DIV class='w3-center'>
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='홈' onclick="location.href='../index.jsp'">
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='돌아가기' onclick="history.back()">
  <br><%=Utility.paging3(totalRecord, nowPage, recordPerPage) %>
  </DIV>
  
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 