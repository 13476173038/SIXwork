<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
   请在下面的颜色中选择一种你喜欢的颜色：<br/>
   <a href="page2.jsp?color=红色">红色</a><br/>
   <a href="page2.jsp?color=橙色">橙色</a><br/>
   <a href="page2.jsp?color=黄色">黄色</a><br/>
   <a href="page2.jsp?color=绿色">绿色</a><br/>
   <%
    String color=request.getParameter("color");
	color=new String(color.getBytes("ISO-8859-1"),"UTF-8");
	%>
	你还喜欢的颜色是：<%=color %>
</body>
</html>