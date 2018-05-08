<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<% 

	String id=request.getParameter("id");
	MemberDTO dto=dao.read(id);

%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function inCheck(f){
	if(f.id.value==""){
		alert("ID를 입력하세요.");
		f.id.focus();
		return false;
	}
	if(f.password.value==""){
		alert("비밀번호를 입력하세요.");
		f.password.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("비밀번호 확인을 입력하세요.");
		f.repasswd.focus();
		return false;
	}
	if(f.password.value!=f.repasswd.value){
		alert("비밀번호가 일치하지 않습니다. \n다시 입력하세요.");
		f.repasswd.focus();
		return false;
	}
	if(f.mname.value==""){
		alert("이름을 입력하세요.");
		f.mname.focus();
		return false;
	}
	if(f.email.value==""){
		alert("E-mail을 입력하세요.");
		f.email.focus();
		return false;
	}
	if(f.zipcode.value==""){
		alert("주소검색을 눌러 우편번호와 주소를 입력하세요.");
		f.zipcode.focus();
		return false;
	}
	if(f.job.value=="0"){
		alert("직업을 선택하세요.");
		f.job.focus();
		return false;
	}
}
function idCheck(id){
	if(id==""){
		alert("아이디를 입력하세요.");
		document.frm.id.focus();
	}else{
		var url="id_proc.jsp";
		url+="?id="+id;
		
		wr=window.open(url,"아이디검색","width=500,height=500");
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
		
	}
}
function emailCheck(email){
	if(email==""){
		alert("이메일을 입력하세요.");
		document.frm.id.focus();
	}else{
		var url="email_form.jsp";
		url+="?email="+email;
		
		wr=window.open(url,"이메일검색","width=500,height=500");
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
		document.focus();
	}
}
function emailCheck2(i){
	i.blur();
	alert("이메일을 변경하시려면,\nE-mail 중복확인 버튼을 사용하세요.");
}
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
</script>
<style type="text/css">
td{
	width:60%;
}
th{
	width:40%;
}
</style>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<div style="width: 100%; background-color: #f7fdfc;">
<br><br><br>
<!-- *********************************************** -->
 
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green w3-wide" style="width:40%; max-width:200px; margin:0 auto; font-size: x-large; text-align: center;">
정보 수정</DIV>
 <br><br>
 
<div style=" width:70%; max-width:550px; margin: 0 auto;"> 
<FORM name='frm' method='POST' action='./updateProc.jsp' onsubmit="return inCheck(this)">
<input type="hidden" name="id" value="<%=dto.getId()%>">
  <TABLE class="w3-table w3-white w3-bordered">
    <TR>
      	<TD style="text-align: center;" colspan="3"><img src="./storage/<%=dto.getFname()%>" style="width: 190px; height: 170px; align-text: center;"></TD>
    </TR>
    
    <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">ID</TH>
      	<TD>
      		<%=dto.getId() %>
      	</TD>
    </TR>
    
    <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">이름</TH>
      	<TD><%=dto.getMname() %></TD>
    </TR>
    
    <TR>
      <TH class="w3-teal w3-text-white w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">(*필수)전화번호</TH>
      	<TD><input type="text" name="tel" size="20" value="<%=dto.getTel()%>"></TD>
    </TR>
    
    <TR>
      <TH class="w3-teal w3-text-white w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">(*필수)E-mail</TH>
      	<TD>
      	<input type="email" name="email" size="20" value="<%=dto.getEmail()%>" onkeydown="emailCheck2(this)">
      	<button type="button" onclick="emailCheck(document.frm.email.value)">E-mail 중복확인</button>
      	</TD>
    </TR>
    
     <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">우편번호</TH>
      	<TD>
      	<input type="text" name="zipcode" size="7" id="sample6_postcode" placeholder="우편번호" value="<%=Utility.checkNull(dto.getZipcode())%>">
      	<button type="button" onclick="sample6_execDaumPostcode()">주소 검색</button>
      	</TD>
    </TR>
    
     <TR>
      <TH class="w3-teal w3-text-white w3-wide w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">주소</TH>
      	<TD>
      	<input type="text" name="address1" size="50" id="sample6_address" placeholder="주소" value="<%=Utility.checkNull(dto.getAddress1())%>"><br>
      	<input type="text" name="address2" size="50" id="sample6_address2" placeholder="상세주소" value="<%=Utility.checkNull(dto.getAddress2())%>">
      	</TD>
    </TR>
    
     <TR>
      <TH class="w3-teal w3-text-white w3-center" style="font-size:15px; text-shadow:1px 1px 0 #444;">(*필수)직업</TH>
      	<TD>
      	<select name="job">
      		<option value="0">-----선택-----</option>
      		<option value="A01">회사원</option>
      		<option value="A02" selected>전산관련직</option>
      		<option value="A03">연구전문직</option>
      		<option value="A04">학생</option>
      		<option value="A05">일반자영업</option>
      		<option value="A06">공무원</option>
      		<option value="A07">의료인</option>
      		<option value="A08">법조인</option>
      		<option value="A09">종교/언론/예술인</option>
      		<option value="A10">기타</option>
      	</select>
      	<script type="text/javascript">
      		document.frm.job.value='<%=dto.getJob() %>';
      	</script>
      	</TD>
    </TR>
    
  </TABLE>
 <br> 
  <DIV class='w3-center'>
    <input type='submit' value='수정하기'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
</div>

<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 