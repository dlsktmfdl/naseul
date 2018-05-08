<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<% 
	String id=request.getParameter("id");
	if(id==null) id=(String)session.getAttribute("id");
	
	String grade=(String)session.getAttribute("grade");

	
	MemberDTO dto=dao.read(id);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function updateFile(){
	var url="./updateFileForm.jsp";
	url+="?id=<%=id%>";
	url+="&oldfile=<%=dto.getFname()%>";
	
	location.href=url;
}
function updatePw(){
	if(confirm("비밀번호를 변경하시겠습니까?")){
		var url="updatePwCheck.jsp";
		url+="?id=<%=id%>";
		
		wr=window.open(url,"패스워드검색","width=500,height=350");
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
		document.focus();
	}
}
function mupdate(){
	var url="./updateForm.jsp";
	url+="?id=<%=id%>";
	location.href=url;
}
function mdelete(){
	var url="./deleteForm.jsp";
	url+="?id=<%=id%>";
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
<%=dto.getMname() %>님의 회원정보</DIV>
 <br><br>
<div style=" width:60%; max-width:450px; margin: 0 auto;"> 
  <TABLE class="w3-table w3-white w3-bordered">
	<tr>
		<td style="text-align: center;" colspan="2"><img src="./storage/<%=dto.getFname()%>" width="190px" height="170px">
		   <br> <input type='button' value='사진수정' onclick='updateFile()'>
		</td>
	</tr>
	<tr>
		<th class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">ID</th>
		<td><%=dto.getId()%></td>
	</tr>
	<tr>
		<th class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">성명</th>
		<td><%=dto.getMname()%></td>
	</tr>
	<tr>
		<th class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">전화번호</th>
		<td><%=dto.getTel()%></td>
	</tr>
	<tr>
		<th class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">E-mail</th>
		<td><%=dto.getEmail()%></td>
	</tr>
	<tr>
		<th class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">우편번호</th>
		<td><%=Utility.checkNull(dto.getZipcode())%></td>
	</tr>
	<tr>
		<th class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">주소</th>
		<td><%=Utility.checkNull(dto.getAddress1())%>
			<%=Utility.checkNull(dto.getAddress2())%>
		</td>
	</tr>
	<tr>
		<th class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">직업</th>
		<td>
		<%=Utility.getCodeValue(dto.getJob()) %>
			(직업코드 : <%=dto.getJob()%>) 
		</td>
	</tr>
	<tr>
		<th class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">가입날짜</th>
		<td><%=dto.getMdate()%></td>
	</tr>
	</table>
</div>
<br> 
  <DIV class='w3-center'>
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='홈' onclick="location.href='../index.jsp'">
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='정보수정' onclick="mupdate()">
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='패스워드변경' onclick='updatePw()'>
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='회원탈퇴' onclick="mdelete()">
    <input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='사진 다운로드' onclick="location.href='<%=root %>/download?dir=/member/storage&filename=<%=dto.getFname()%>'"> 
	<% if(grade.equals("A")){ %>
	<input class="w3-button w3-border w3-padding-small w3-hover-teal" type='button' value='목록' onclick="location.href='../admin/list.jsp'">
	<%} %>
  </DIV>
 
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 