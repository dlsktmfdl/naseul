<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="member.*" %>
<%@ page import="img.*" %>
<%@ page import="memo.*" %>
<%@ page import="bbs.*" %> 
<%@ page import="gb.*" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>  
<%@ page import="org.apache.commons.fileupload.*" %> 
<%    
	request.setCharacterEncoding("utf-8");
    String root = request.getContextPath();
    
    String tempDir="/member/temp";
    String upDir="/member/storage";
    
    tempDir = application.getRealPath(tempDir);
    upDir = application.getRealPath(upDir);
    
    String tempDir2="/bbs/temp";
    String upDir2="/bbs/storage";
    
    tempDir2 = application.getRealPath(tempDir2);
    upDir2 = application.getRealPath(upDir2);
    
    String tempDir3="/img/temp";
    String upDir3="/img/storage";
    
    tempDir3 = application.getRealPath(tempDir3);
    upDir3 = application.getRealPath(upDir3);
%>