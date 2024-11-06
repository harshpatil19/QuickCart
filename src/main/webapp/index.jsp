<%@page import="com.helper.FactoryProvider"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QuickCart - Home</title>
<%@include file="Components/Common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="Components/Navbar.jsp"%>
	<h1>Hello world</h1>
	<h1>Creating session factory object</h1>
	<%
	out.println(FactoryProvider.getFactory());
	%>
</body>
</html>