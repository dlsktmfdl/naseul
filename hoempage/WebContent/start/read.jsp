<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="start.StartDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");//list.jsp를통해 들어온것

	if(id==null) id = (String)session.getAttribute("id");//메뉴를 통해 들어옴
	StartDTO dto = dao.read(id);
	
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function mdelete(){
	var url = "../start/deleteForm.jsp";
	url += "?id=<%=id%>";
	
	location.href=url;
}

function mlist(){
	var url = "../gust/list.jsp"
	url += "?id=<%=id%>";
	
	location.href=url;
}


function mupdate(){
	var url = "../start/updateForm.jsp";
	url += "?id=<%=id%>";
	
	location.href=url;
}

function updateFile(){
	var url ="../start/updateFileForm.jsp";
	url += "?id=<%=id%>";
	url += "&oldfile=<%=dto.getFname()%>";
	
	location.href=url;
}

function updatePasswd(){
	var url ="./updatePasswd.jsp";
	url += "?id=<%=id%>";
	
	location.href=url;
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="../main/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"></DIV>
 
  <TABLE>
    
    <TR>
   
      <TD colspan="2">
      <img src="./storage/<%=dto.getFname() %>">
      </TD>
    </TR>
    
    <TR>
      <TH>아이디</TH>
      <TD>
      <%=dto.getId() %>
      </TD>
    </TR>
    <TR>
      <TH>성명</TH>
      <TD>
      <%=dto.getMname() %>
      </TD>
    </TR>
    <TR>
      <TH>전화번호</TH>
      <TD>
      <%=dto.getTel() %>
      </TD>
    </TR>
    <TR>
      <TH>이멜</TH>
      <TD>
      <%=dto.getEmail() %>
      </TD>
    </TR>
    <TR>
      <TH>우편번호</TH>
      <TD>
      <%=Utility.checkNull(dto.getZipcode()) %>
      </TD>
    </TR>
    <TR>
      <TH>주소</TH>
      <TD>
      <%=Utility.checkNull(dto.getAddress1()) %>
      <%=Utility.checkNull(dto.getAddress2()) %>
      </TD>
    </TR>
    <TR>
      <TH>직업</TH>
      <TD>
      직업코드:<%=dto.getJob() %>
<%--       <%=Utility.checkNull(dto.getJob()) %> --%>
      (<%=Utility.getCodeValue(dto.getJob())%>)
      </TD>
    </TR>
    <TR>
      <TH>가입날짜</TH>
      <TD>
    	<%=dto.getMdate() %>
      </TD>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
	
	<input type='button' value='탈퇴' onclick="mdelete()">
    <input type='button' value='정보수정' onclick="mupdate()">
   
     
 
     
  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
