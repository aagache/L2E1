<%-- 
    Document   : index
    Created on : Oct 23, 2016, 7:21:13 PM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List" %>
<%@page import="user.Login"%>
<%@page import="java.io.*" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:useBean id="theUser" class="user.Login" scope="session"></jsp:useBean>

<%
	String username = "";
	String password = "";
	
	Cookie cookie = null;
  	Cookie[] cookies = null;
  
  	cookies = request.getCookies();
  	if( cookies != null ){
	    for (int i = 0; i < cookies.length; i++){
	    	cookie = cookies[i];
	        
	        if(cookie.getName().equals("user"))
	        	username = cookie.getValue();
	        if(cookie.getName().equals("pass"))
	        	password = cookie.getValue();
	     }
 	}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>L2E1 JSP | Login</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>        
        <%         
        int pageCode = 0;
        
        switch(pageCode) {
            case 1: response.sendRedirect("error.jsp");
                break;
            case 2: response.sendRedirect("index.jsp");
                break;
            case 3: response.sendRedirect("input.jsp");
                break;
            case 4: response.sendRedirect("login.jsp");    
                break;
            case 5: response.sendRedirect("register.jsp");
                break;
            case 6: response.sendRedirect("result.jsp");
                break;
//            default: response.sendRedirect("error.jsp");    
//                break;
        }
        %>
        
        <div id="login" class="box center">
            <h3>Login</h3>
            <form action="login.jsp">
                <table>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="user" value="<%=username %>" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="pass" value="<%=password %>" /></td>
                    </tr>
                    <tr><td colspan="2"><input type="checkbox" name="check"/>Remember me</td></tr>
                </table>
                    <br /> <input type="submit" value="login" name="but" />
            </form>
            <a href="#" onclick="showRegister()">Utilizator nou?</a>
	</div>


	<div id="newUser" class="box">
            <form action="register.jsp">
                <h3>Creati un nou cont</h3>
                <table>
                    <tr>
                            <td>Username:</td>
                            <td><input type="text" name="user" /></td>
                    </tr>
                    <tr>
                            <td>Password:</td>
                            <td><input type="password" name="pass" /></td>
                    </tr>
                </table>
                <br /> <input type="submit" value="create user" name="but" />
            </form>
	</div>
		
	<script>
            function showRegister(){
                document.getElementById("newUser").style.display="block";
            }
	</script>
    </body>
</html>
