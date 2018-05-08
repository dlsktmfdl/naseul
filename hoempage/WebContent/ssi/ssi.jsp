<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="gust.*" %>
<%@ page import="start.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>

<%    request.setCharacterEncoding("utf-8");
      String root = request.getContextPath();
      
      String tempDir = "/start/temp";
//       임시폴더
      String upDir = "/start/storage";
//		실제폴더
      
//메타데이터에서 받아올것임 아니면 널값으로 나옴 
	  tempDir = application.getRealPath(tempDir);
	  upDir = application.getRealPath(upDir);
	  
	  String tempDir2 = "/bbs/temp";
//    임시폴더
      String upDir2 = "/bbs/storage";
//		실제폴더
   
//메타데이터에서 받아올것임 아니면 널값으로 나옴 
	  tempDir2 = application.getRealPath(tempDir2);
	  upDir2 = application.getRealPath(upDir2);
	  
	  
	  
%> 
