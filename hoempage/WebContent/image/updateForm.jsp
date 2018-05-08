<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi3.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"></jsp:useBean>
<%
	int ino = Integer.parseInt(request.getParameter("ino"));
	String oldfile = request.getParameter("oldfile");
	ImageDTO dto = dao.read(ino); 
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
/*   font-family: gulim;  */
/*   font-size: 20px;  */
} 
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function inCheck(f){
	if(f.title.value==""){
		alert("제목 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용 입력 ㄱ");
		f.content.focus();
		return false;
	}
	
}
</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="<%=root %>/main/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">글 등록</DIV>
 
<FORM
	name='frm' 
	method='POST' 
	action='./updateProc.jsp'
	enctype="multipart/form-data"
	onsubmit="return inCheck(this)">
	<input type ="hidden" name = "nowPage" value ="<%=request.getParameter("nowPage") %>">
	<input type ="hidden" name = "col"     value ="<%=request.getParameter("col") %>">
	<input type ="hidden" name = "word"    value ="<%=request.getParameter("word")%>">
    <input type ="hidden" name = "oldfile" value ="<%=oldfile %>">
    <input type ="hidden" name = "ino"     value ="<%=ino %>">
  <TABLE>
    <TR>
      <TH>원본파일</TH>
      <TD>
      <img src="./storage/<%=oldfile %>">
          원본파일명:<%=oldfile %>
      </TD>
    </TR>
    <TR>
      <TH>변경파일</TH>
      <TD>
      <input type="file" name="fname" accept=".jpg,.gif,.png">
      </TD>
    </TR>
  
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size="15" value="<%=dto.getTitle()%>">
      </TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD><input type="text" name="content" size="15" value="<%=dto.getContent()%>">
      </TD>
    </TR>
    
    
    <tr>
     <th>작성자</th>
     <td>
     <input type="text" name="mname" size="15" value="<%=dto.getMname()%>">
      </TD> 
    </TR>
    
    <tr>
    <th>비밀번호를 입력하세요</th>
    <td>
    <input type="password" name="passwd" value="">
    </TD>
    </tr>
    
  </TABLE>
 
  <DIV class='bottom'>
    <center>
    <input type='submit' value='글 수정' >  
    <input type='reset' value='취소'>
    </center>
  </DIV>
 
</FORM>
 
<jsp:include page="../main/bottom.jsp" flush="false"/> 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
