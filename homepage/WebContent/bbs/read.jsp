<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="bbs.BbsDTO"></jsp:useBean>

 <%
 	int bbsno=Integer.parseInt(request.getParameter("bbsno"));	
 	dao.upViewcnt(bbsno);
 	dto=dao.read(bbsno);
 	
 	String content=dto.getContent();
 	content=content.replaceAll("\r\n", "<br>");
 %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 <script type="text/javascript">
function blist(){
	var url="list.jsp";
	url+= "?col=<%=request.getParameter("col")%>";
	url+= "&word=<%=request.getParameter("word")%>";
	url+= "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}
function bupdate(){
	var url="updateForm.jsp";
	url+="?bbsno=<%=bbsno%>";
	url+= "&col=<%=request.getParameter("col")%>";
	url+= "&word=<%=request.getParameter("word")%>";
	url+= "&nowPage=<%=request.getParameter("nowPage")%>";

	location.href=url;
}
function bdelete(){
	<%boolean flag=dao.checkRefnum(bbsno);
		if(flag){%>
			alert("메인글은 삭제할 수 없습니다.");
	<%	}else{
	%>
	var url="deleteForm.jsp";
	url+="?bbsno=<%=bbsno%>";
	url+="&oldfile=<%=dto.getFilename()%>";
	url+= "&col=<%=request.getParameter("col")%>";
	url+= "&word=<%=request.getParameter("word")%>";
	url+= "&nowPage=<%=request.getParameter("nowPage")%>";
	
	wr=window.open(url,"글 삭제","width=500,height=350");
	wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
	document.focus();
	<%}%>
}
function reply(bbsno){
	var url="replyForm.jsp";
	url+="?bbsno="+bbsno;
	url+= "&col=<%=request.getParameter("col")%>";
	url+= "&word=<%=request.getParameter("word")%>";
	url+= "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}
function fileDown(filename){
	var url="<%=root%>/download";
	url+="?filename="+filename;
	url+="&dir=/bbs/storage";
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
 
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green w3-wide" style="width:60%; max-width:500px; margin:0 auto; font-size: x-large; text-align: center;">
	<%=dto.getWname() %>님의 글 조회
</DIV>
<br><br>
<div style=" width:50%; max-width:300px; margin: 0 auto;"> 
  <TABLE class="w3-table w3-white w3-bordered">
    <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">이         름</TH>
      <TD><%=dto.getWname() %></TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">제         목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">내         용</TH>
      <TD><%=content %></TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">등록날짜</TH>
      <TD><%=dto.getWdate() %></TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">파   일   명 </TH>
      <TD><% if(dto.getFilename().equals("파일없음")){
	    				out.print("파일없음");
	    			}else{%>
	    				<a href="javascript:fileDown('<%=dto.getFilename() %>')">
	    				<%=dto.getFilename() %>(<%=dto.getFilesize() %>)</a>
	    		<%	} %></TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">조   회   수</TH>
      <TD><%=dto.getViewcnt() %></TD>
    </TR>
  </TABLE>
</div>
<br>  
  <DIV class='w3-center'>
    <button class="w3-button w3-border w3-padding-small w3-hover-teal" type="button" onclick="reply('<%=dto.getBbsno() %>')">답글</button>
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='수정' onclick="bupdate()">
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='삭제' onclick="bdelete()">
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='목록' onclick="blist()">
  </DIV>

<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 