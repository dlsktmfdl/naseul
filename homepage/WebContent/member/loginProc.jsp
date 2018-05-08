<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<% 
	String id=request.getParameter("id");
	String passwd=request.getParameter("passwd");

	Map map=new HashMap();
	map.put("id", id);
	map.put("passwd", passwd);
	
	boolean flag=dao.loginCheck(map);
	
	String grade= null;
	
	if(flag){
		grade=dao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		
		 // ---------------------------------------------- 
	    // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
	    // ---------------------------------------------- 
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
	}

%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
 
</style> 
<script type="text/javascript">
function join(){
	var url="./agreement.jsp";
	location.href=url;
}
function home(){
	var url='../index.jsp';
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- 내용 시작 -->
<div style="width: 100%; background-color: #f7fdfc;">
<br><br>
<!-- *********************************************** -->

<div class='w3-center'  style="margin:auto; width:80%; max-width:400px;">
<%if(flag){%>
<div class="w3-panel w3-green w3-display-container" >
  <span onclick="this.parentElement.style.display='none'"
  class="w3-button w3-green w3-large w3-display-topright">&times;</span>
  <h3>Success!</h3><br>
  <p>로그인 되었습니다.</p>
</div>
<br>
<div class='w3-center'>
  <button class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' onclick='home()'>홈</button> 
</div>
<%}else{%>
<div class="w3-panel w3-red w3-display-container" >
  <span onclick="this.parentElement.style.display='none'"
  class="w3-button w3-red w3-large w3-display-topright">&times;</span>
  <h3>Warning!</h3><br>
  <p>ID나 P/W를 잘못 입력하셨거나 회원이 아닙니다.<br>회원가입을 해주세요.</p>
</div>
<br>
<div class='w3-center'>
  <button class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' onclick='home()'>홈</button> 
  <button class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button' onclick='join()'>회원가입</button>
  <button class="w3-btn w3-white w3-border w3-border-teal w3-padding-small" type='button'  onclick='history.back()'>돌아가기</button>
</div>
	<%}%>
</div> 
 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 