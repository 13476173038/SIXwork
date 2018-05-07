<%@page import="com.dt59.entity.NewsInfo"%>
<%@page import="com.dt59.entity.Page"%>
<%@page import="com.dt59.service.impl.BizServiceImpl"%>
<%@page import="com.dt59.dao.impl.BizDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tpage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    	BizDaoImpl bdi=new BizDaoImpl();
  		BizServiceImpl bsi=new BizServiceImpl();
  		bsi.setBizDao(bdi);
  		
		int totalInfo=bsi.getInfoCount();
  		int lastPageNo=(totalInfo%3==0?totalInfo/3:totalInfo/3+1);  
  				
    	Page pg2=new Page();
    	pg2.setLastPageNo(lastPageNo);
    	
    	String pageNo=request.getParameter("pageNo");
    	int pn=Integer.valueOf(pageNo);
    	if(pn==0){
			pn=1;
			};
    	if(pn>lastPageNo){
    		pn=lastPageNo;
    	};
    	pg2.setPageNo(pn);
    	
    	
  		List<NewsInfo> news=bsi.getNewsByPage(pg2);
  		
  		request.setAttribute("pg", pg2);
  		request.setAttribute("newsInfo", news);
    	request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
     %>
  </body>
</html>
