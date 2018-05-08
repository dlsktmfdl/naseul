<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
table{
	margin:auto;	
}
table,th{
	border-spacing: 5px;
	padding:20px;
}
</style> 
</head> 
<body> 
<table>
<tr>
	<th></th>
	<th></th>
	<th></th>
	<th></th>
	<th></th>
	<th rowspan='5' bgcolor='#ffaacc'>6%</th>
</tr>
<tr>
	<th></th>
	<th></th>
	<th></th>
	<th></th>
	<th rowspan='4' bgcolor='#ffaacc'>5%</th>
</tr>
<tr>
	<th> </th>
	<th> </th>
	<th rowspan='3' bgcolor='#ffaacc'>3%</th>
</tr><!--  -->
<tr>
	<th> </th>
	<th rowspan='2' bgcolor='#ffaacc'>2%</th>
	<th rowspan='2' bgcolor='#ffaacc'>4%</th>
</tr>
<tr>
	<th rowspan='1' bgcolor='#ffaacc'>1%</th>
</tr>
</table>
</body> 
</html>