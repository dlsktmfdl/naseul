<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>
<%

	String fname=request.getParameter("fname");
	String nowPage=request.getParameter("nowPage");
	int inum=Integer.parseInt(request.getParameter("inum"));
	ImgDTO dto=dao.read(inum);
	
	
	String content=dto.getContent();
	content=content.replaceAll("<br>", "\r\n");
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
.curImg{
	margin-right:0;
	border-style:solid;
	border-width: 3px;
	border-color: red;
}

</style> 
<script type="text/javascript">

function inCheck(f){
	if(f.fname.value==""){
		if(confirm("사진 변경이 되지 않았습니다.\n사진을 변경하시려면 '확인'을 \n그대로 사용하시려면 '취소'를 눌러주세요.")==true){
		f.fname.click();
		return false;
		}
	}
	if(f.mname.value==""){
		alert("이름을 입력하세요.");
		f.mname.focus();
		return false;
	}
	if(f.title.value==""){
		alert("제목을 입력하세요.");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요.");
		f.content.focus();
		return false;
	}
	if(f.pw.value==""){
		alert("비밀번호를 입력하세요.");
		f.pw.focus();
		return false;
	}
}
function imgfile(){
	document.frm.fname.click();
	document.frm.text1.value=document.frm.fname.value;
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

<br>
<FORM class="w3-container" name='frm' method='POST' enctype="multipart/form-data" onsubmit="return inCheck(this)" action='./updateProc.jsp'>
<input type="hidden" name="inum" value="<%=inum %>">
<input type="hidden" name="oldfile" value="<%=dto.getFname() %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">

<!-- <div style=" width:70%; max-width:500px; margin: 0 auto;">  -->
  <DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green w3-wide" style="width:60%; max-width:500px; margin:0 auto; font-size: x-large; text-align: center;">
	<%=dto.getMname() %>님의 글 수정
</DIV>

<br><br>

<div class="w3-card-4" style="width:40%; max-width:400px; margin: 0 auto;">
			
	<p style="text-align: right"></p>
	<input type="file" name="fname" style="display:none;">
	<input type="hidden" name=text1" size="10" >
	<a href="javascript:imgfile();">
	<img src="<%=root %>/img/storage/<%=dto.getFname()%>" style="width:100%; display:block;  height: auto;" ></a>
	
    <div class="w3-container">
      <h4><b>제목 : <input class="w3-input w3-border" type="text" name='title' value='<%=dto.getTitle() %>' style="width:100%;"></b></h4>
      <span class="glyphicon glyphicon-pencil"></span><p><textarea name="content" style="width:100%; height:100px;"><%=content %></textarea></p>
    </div>
<p></p>
</div>
<br><br>
  
  <DIV class='w3-center'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='submit' value='수정'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='reset' value='다시쓰기'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='취소' onclick="history.back()">
  </DIV>

<br><br>
<div style=" margin: 0 auto;">
  <TABLE style="width:90%; max-width:700px; margin: 0 auto;">
	<TR >
	  <%
	  	List list = dao.imgRead(inum);
	    String[] files = (String[])list.get(0);
	    int[] noArr = (int[])list.get(1);
	    for(int i=0;i<5;i++){
	    	if(files[i]==null){  
	  %>
	  <td>
	  <div style="width:100px; height:100px; overflow: hidden">
		  	<img src="./storage/default.jpg" style="width:100%; height:100%; display:block; ">
	  </div>
	  </td>
	  <%
	    	}else{
	    		if(noArr[i]==inum){
	  %> 	
	  <td>
	  	 <div style="width:120px; height:120px; overflow: hidden; background-color:red; padding-left:6px; padding-top:5px; ">
	  	 <a href="javascript:readGo('<%=noArr[i]%>')">
	  	 <img src="./storage/<%=files[i] %>" style=" width:95%; height:95%; display:block;">
	 	 </a>
	   	 </div>
	  </td>
	  <%		
	    		}else{
	  %>
	  <td>
	  <div style="width:100px; height:100px; overflow: hidden">
	  <a href="javascript:readGo('<%=noArr[i]%>')">
	  	<img src="./storage/<%=files[i] %>" style="width:100%; height:100%; display:block; border:0;">
	  </a>
	  </div>
	  </td>	  			
	  <%
	    		}
	    	 }   		
	      }
	  %>
    </TR>
  </TABLE>
</div>
<br>
</FORM>

<br>

 
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 