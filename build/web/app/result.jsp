<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*" %>
<%@page import="wf.WordFinderBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="style.css" rel="stylesheet" type="text/css" />
        <title>Result</title>
    </head>
    <body>
        <%
            WordFinderBean wfb = (WordFinderBean)session.getAttribute("wf");
        %>
        <form action="${pageContext.request.contextPath}/logout" method="post">
            <input type="submit" value="Logout" />
        </form>

        <h2>Result</h2>  
        <%= wfb.getWords() %>
    </body>
</html>