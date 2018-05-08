<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<%
	String c_id="";//id 저장 여부를 저장하는 변수
	String c_id_val="";//id 값
	
	Cookie[] cookies = request.getCookies(); 
	Cookie cookie=null; 
	 
	if (cookies != null){ 
	 for (int i = 0; i < cookies.length; i++) { 
	   cookie = cookies[i]; 
	 
	   if (cookie.getName().equals("c_id")){ 
	     c_id = cookie.getValue();     // Y 
	   }else if(cookie.getName().equals("c_id_val")){ 
	     c_id_val = cookie.getValue(); // user1... 
	   } 
	 } 
	} 
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- 내용 시작 -->
<div style="width: 100%; background-color: #f7fdfc;">
<br><br>
<!-- *********************************************** -->
<br><br>
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green" style="margin:0 auto; width:25%; font-size: x-large; text-align: center;">로그인</DIV>
<br> 
<FORM class="w3-container" name='frm' method='POST' action='./loginProc.jsp'>
<div style=" width:100%; max-width:400px; margin: 0 auto;"> 
  <TABLE class="w3-table w3-white w3-bordered">
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="width:25%; font-size:15px; text-shadow:1px 1px 0 #444;">ID</TH>
      <TD style="width:50%;"> 
      <input class="w3-input w3-border-0" type="text" name="id" placeholder='id' value='<%=c_id_val %>' required>
      </TD>
      <TD style="width:25%;">  
      <% 
       if (c_id.equals("Y")){  // id 저장 상태라면 
       %>   
        <label> <input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장</label> 
       <% 
       }else{ %> 
        <label> <input type='checkbox' name='c_id' value='Y' > ID 저장 </label>
       <% 
       } 
       %>
       </TD>
    </TR>
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="width:25%; font-size:15px; text-shadow:1px 1px 0 #444;">P/W</TH>
      <TD><input class="w3-input w3-border-0" type="password" name="passwd" placeholder='password' required></TD>
      <td></td>
    </TR>
  </TABLE>
</div>
<br>  
  <DIV class='w3-center'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='submit' value='로그인'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='회원가입' onclick="location.href='agreement.jsp'">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 