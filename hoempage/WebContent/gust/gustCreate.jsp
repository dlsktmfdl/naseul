<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style>
<script type="text/javascript">
function incheck(f){
	if(f.title.value==""){
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요");
		f.content.focus();
		return false;
	}
}
</script>

<!-- <link href="../css/style.css" rel="stylesheet"/> -->
</head>

<body>
<jsp:include page="../main/top.jsp"></jsp:include>
<div class="container">
<h2><span class="glyphicon glyphicon-pencil"></span>등록</h2>

<form action="createProc.jsp" 
	  method="POST"
	  onsubmit="return incheck(this)"
	  enctype="multipart/form-data">
<table class="table table-bordered">
	<TR>
      <TH>사진</TH>
      <TD><input type="file" name="fname" accept=".jpg,.png,.gif"></TD>
     
    </TR>

	<tr>
	<th>제목</th>
	<td><input type="text" name="title" size="55">
	</td>
	</tr>
	
	<tr>
	<th>내용</th>
	<td><textarea rows="15" cols="50" name="content"></textarea>
	</td>
	</tr>
	
</table>


<div class="bottom">
<button>전송</button>
</form>
</div>
</div>
</body>
</html>