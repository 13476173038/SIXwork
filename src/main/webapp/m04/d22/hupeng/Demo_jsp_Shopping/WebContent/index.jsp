<%@ page language="java"  import="java.util.*"  pageEncoding="UTF-8"  isELIgnored="false"  %>
<%@  taglib  uri="http://java.sun.com/jsp/jstl/core"   prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login" method="post">
    <table  align="center"  border="1">
       <tr>
         <td>用户名：</td>
         <td>
           <%-- <input type="hidden"  value="${ server_token}" name="click_token"> --%>
           <input  type="text"   name="uname"/>
         </td>
       </tr>
       <tr>
         <td>密码：</td>
         <td>
           <input  type="password"  name="upwd"/>
         </td>
       </tr>  
        <tr>        
         <td colspan="2">
           <input  type="submit"  value="登录"/>
         </td>
       </tr>   
      </table>
</form>

<hr/>

    <table  align="center">
      <tr>
        <th>编号</th>
        <th>商品名称</th>
        <th>商品价格</th>
        <th>商品描述</th>         
        <th>操作</th>
      </tr>
      <c:forEach items="${listsp }"  var="lst">
      <tr>
        <td>${lst.spid }</td>
        <td>${lst.spname}</td>
        <td>${lst.spprice }</td>
        <td>${lst.spdesc }</td>   
        <td>
           <a  href="shopping?sid=${lst.spid }&client_token=${server_token}">放入购物车</a>
        </td>             
      </tr>
     </c:forEach>
    
    </table>

</body>
</html>