<%-- 
    Document   : input
    Created on : Oct 28, 2016, 6:47:51 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <h2>Welcome</h2>
        <form action="${pageContext.request.contextPath}/logout" method="post">
            <input type="submit" value="Logout" />
        </form>
        
        <div class="box">
            <form action="http://localhost:8080/L2E1/WordFinderServlet" class="finder" method="get">
                <label>Letters:</label>
                <input name="letters"/>
                <button type="submit">Submit</button>
            </form>
        </div>
    </body>
</html>
