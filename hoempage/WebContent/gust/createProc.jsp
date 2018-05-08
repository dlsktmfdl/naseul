<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi2.jsp"%>
<jsp:useBean id="dao" class="gust.GustDAO" />
<jsp:useBean id="dto" class="gust.GustDTO" />
<%-- <jsp:setProperty name ="dto" property="*"/> --%>

<%
	UploadSave upload= new UploadSave(request,-1,-1,tempDir);
	
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	
	FileItem fileItem = upload.getFileItem("fname");
	String fname= "member.jpg";
	int size = (int)fileItem.getSize();
	
	
	if(size>0){
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	
	
	//
	dto.setFname(fname);

	boolean flag = dao.create(dto);
	
%>

<!-- createPROC는 직접 브라우저에서 호출하면 안된다. 폼에서 submit을 통해서 액션 값을 호출하고 있기 때문에 form action은 submit에 대해서 자연스럽게 호출되고 응답한다. -->

<!--  NAME 속성을 써야 넘어온다. 코딩 중 가끔 실수하는 것이 폼에서 텍스트에어리어 같은 경우에는 네임 속성이 자동으로 만들어지지 않는다. 그래서
name tag를 만들지 않으면 데이터가 넘어가지 않는다. 이름을 반드시 써 줘야한다. 그래야 파라메터 값으로 데이터를 받을 수 있다. -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	font-family: serif;
	font-size: 24px;
}

div {
	text-align: center;
}
</style>
</head>
<body>
	<!-- 스크립틀릿으로 if문을 써준다. -->
	<div>

		<%
 			if (flag) {
 				out.print("메모를 등록했습니다.");
 			} else {
				out.print("메모 등록을 실패했습니다.");

 			}
		%>

		<br>
		<br>
		<button type="button" onclick="location.href='./gustCreate.jsp'">
			계속 등록</button>
		<br> <br>
		<button type="button" onclick="location.href='./list.jsp'">
			목록</button>
		<br>
		<br>

	</div>
	<!-- on으로 시작하는 것 이벤트 설정 이벤트 설정은 자바스크립트가 해준다. -->
</body>
</html>