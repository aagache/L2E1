<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List" %>
<%@page import="java.io.*" %>
<%@page import="user.Login"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:useBean  id="user" class="user.Login" scope="session"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="style.css"  rel="stylesheet" type="text/css"/>
        <title>Register</title>
    </head>

    <body>
    <%
     String username = request.getParameter("user");
     String password = request.getParameter("pass");

     List<Login> login = new ArrayList<Login>();

     try {
        // first, read existing users
        File file = new File("D:\\Facultate\\master Anul I\\Semestrul I\\Tehnologii Java\\2016\\L2E1\\src\\java\\user\\database.txt");
        InputStream is = new FileInputStream(file);
        ObjectInputStream in = new ObjectInputStream(is);
        
        // add the new user to the existing list
        login = (List<Login>) in.readObject();
        in.close();
        is.close();
        
        login.add(new Login(username, password));
        
        // then, write to file
        OutputStream os = new FileOutputStream(file);
        ObjectOutputStream objOut = new ObjectOutputStream(os);
        objOut.writeObject(login);
        objOut.close();
        os.close();

     } catch(IOException i) {
         i.printStackTrace();
     }

    response.sendRedirect("index.jsp");
    %>
    </body>
</html>