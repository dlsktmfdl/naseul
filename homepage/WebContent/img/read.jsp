<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>
<jsp:useBean id="dto" class="img.ImgDTO"></jsp:useBean>
<%
	int inum=Integer.parseInt(request.getParameter("inum"));
	dao.upViewcnt(inum);
	dto=dao.read(inum);
	String str=(String)session.getAttribute("Update");
	if(str==null){
		str="";
	}else if(str.equals("S")){
		str="글이 수정되었습니다.";
	};
	
	String content=dto.getContent();
	content=content.replaceAll("\r\n", "<br>");
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

function readGo(inum){
	var url = "./read.jsp";
	url = url +"?inum="+inum;
	
	location.href=url;
}
//Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}
function idelete(){
	if(confirm("글을 삭제하시겠습니까?")){
	var url="pwCheck.jsp";
	url+="?inum=<%=inum%>";
	url+= "&col=<%=request.getParameter("col")%>";
	url+= "&word=<%=request.getParameter("word")%>";
	url+= "&nowPage=<%=request.getParameter("nowPage")%>";
	url+= "&fname=<%=dto.getFname()%>";
	
	wr=window.open(url,"글 삭제","width=500,height=350");
	wr.moveTo((window.screen.width-500)/2,(window.screen.height-350)/2);
	document.focus();
	}
}
function iupdate(){
	var url="pwCheck2.jsp";
	
	url+="?inum=<%=inum%>";
	url+= "&col=<%=request.getParameter("col")%>";
	url+= "&word=<%=request.getParameter("word")%>";
	url+= "&nowPage=<%=request.getParameter("nowPage")%>";
	url+= "&fname=<%=dto.getFname()%>";
	
	wr=window.open(url,"글 수정","width=500,height=350");
	wr.moveTo((window.screen.width-500)/2,(window.screen.height-350)/2);
	document.focus();
}
function ilist(){
	var url="list.jsp";
	url+="?inum=<%=inum%>";
	url+= "&col=<%=request.getParameter("col")%>";
	url+= "&word=<%=request.getParameter("word")%>";
	url+= "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}

</script> 
</head> 

<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- 내용 시작 -->
<div style="width: 100%; background-color: #f7fdfc;">
<br><br><br>
<!-- *********************************************** -->
<DIV class="w3-panel w3-border-top w3-border-bottom w3-border-green w3-wide" style="width:60%; max-width:500px; margin:0 auto; font-size: x-large; text-align: center;">
	<%=dto.getMname() %>님의 글 조회
</DIV>

<br><br>

<div class="w3-card-4" style="width:40%; max-width:400px; margin: 0 auto;">
			
	<p style="text-align: right">조회수 : <%=dto.getViewcnt() %></p>
	<img src="./storage/<%=dto.getFname()%>" style="width:100%; display:block;  height: auto;" onclick="onClick(this)" class="w3-hover-opacity" 
	      		 alt="<%
	      		 String a=dto.getFname();
	      		 out.print(a.substring(0,a.length()-4));
	      		 %>">
    <div class="w3-container">
      <h4><b>제목 : <%=dto.getTitle() %></b></h4>
      <span class="glyphicon glyphicon-pencil"></span> <p><%=content %></p>
    </div>
<p><%=dto.getWdate() %></p>
</div>
<br><br>
  
  <DIV class='w3-center'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='등록' onclick="location.href='createForm.jsp'">
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='수정' onclick="iupdate()">
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='삭제' onclick="idelete()">
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='목록' onclick="ilist()">
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
		  	<img src="<%=root %>/img/storage/default.jpg" style="width:100%; height:100%; display:block; ">
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


<!-- Modal for full size images on click-->
<div id="modal01" class="w3-modal w3-black" onclick="this.style.display='none'">
  <span class="w3-button w3-large w3-black w3-display-topright" title="Close Modal Image"><i class="fa fa-remove"></i></span>
  <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
    <img id="img01" class="w3-image">
    <p id="caption" class="w3-opacity w3-large"></p>
  </div>
</div> 
  
<!-- *********************************************** -->
<br>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
<script type="text/javascript">
<%if(!str.equals("")){%>
alert('<%=str%>');
<%session.removeAttribute("Update");
}%>
</script>
