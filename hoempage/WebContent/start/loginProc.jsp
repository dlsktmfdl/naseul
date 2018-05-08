<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="start.StartDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	Map map = new HashMap();
	map.put("id",id);
	map.put("passwd",passwd);
	
	
	boolean flag = dao.passCheck(map); //회원인지 아닌지 확인
	String grade = null; //
	
	if(flag){
		grade = dao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		out.print("로그인이 되었습니다.");
		Cookie cookie = null; 
	       
	    String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 
	       
	    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
	      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
	      cookie.setMaxAge(120);               // 2 분 유지 
	      response.addCookie(cookie);          // 쿠키 기록 
	   
	      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
	      cookie.setMaxAge(120);               // 2 분 유지 
	      response.addCookie(cookie);          // 쿠키 기록  
	         
	    }else{ 
	      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
	      cookie.setMaxAge(0); 
	      response.addCookie(cookie); 
	         
	      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
	      cookie.setMaxAge(0); 
	      response.addCookie(cookie); 
	    } 
	    // --------------------------------------------- 
// 		grade = dao.getGrade(id);	
	}
// 	회원인것이 확인되었다면 회원등급을 띄워라
%> 
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="../main/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원정보 확인</DIV>
<div class="content">
<% 
	if(flag==false){
		out.print("회원정보가 일치하지 않습니다");
	}else if(flag){
		out.print("일치합니다");
	}else
		out.print("에러나 잡으세요");	
%>
</div>
  
  <DIV class='bottom'>
    <input type='submit' value='홈' onclick="location.href='../start/index.jsp'">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
