<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi3.jsp" %>
 
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
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function inCheck(f){
	if(f.title.value==""){
		alert("제목 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
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
<jsp:include page="../main/top2.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">글 등록</DIV>
 
<FORM 
	name='frm' 
	method='POST' 
	action='./createProc.jsp'
	enctype="multipart/form-data"
	onsubmit="return inCheck(this)">
  <TABLE>
    <TR>
      <TH>사진</TH>
      <TD><input type="file" name="fname" accept=".jpg,.png,.gif"></TD>
  
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size="15">
      </TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD><input type="text" name="content" size="15">
      </TD>
    </TR>
    
    
    <TR>
      <TH>패스워드</TH>
      <TD>
      <input type="password" name="passwd" size="15">
      </TD> 
    </TR>
    
    <tr>
     <th>작성자</th>
     <td>
     <input type="text" name="mname" size="15">
      </TD> 
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='글 등록'>
    <input type='reset' value='취소'>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="../main/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
