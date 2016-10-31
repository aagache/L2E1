<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List" %>
<%@page import="java.io.*" %>
<%@page import="user.Login"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:useBean  id="user" class="user.Login" scope="session"></jsp:useBean>

<%@ page import="user.*" %>
<jsp:useBean id="userul" scope="session" class="user.Login" />
<jsp:setProperty name="userul" property="*" />
<% 
    String username = request.getParameter("user");
    String password = request.getParameter("pass");

    session.setAttribute("user", new Login(username, password)); 
    List<Login> login = new ArrayList<Login>();

     try{
        File file = new File("D:\\Facultate\\master Anul I\\Semestrul I\\Tehnologii Java\\2016\\L2E1\\src\\java\\user\\database.txt");
        InputStream is = new FileInputStream(file);
        ObjectInputStream in = new ObjectInputStream(is);
        
        login = (List<Login>) in.readObject();
        System.out.println(login);
        in.close();
        is.close();
     }
     catch(IOException i){
        i.printStackTrace();
        return;
     }
     catch(ClassNotFoundException c){
        c.printStackTrace();
        return;
     }

     boolean oke = false;

     for(int i = 0; i < login.size(); i++) {
        System.out.println(login.get(i).getUser());
        if(username.equals(login.get(i).getUser()) && password.equals(login.get(i).getPass())) {
            oke = true;
        }   
     }

     if(!oke){
        out.println("Null input");
        response.sendRedirect("error.jsp");
     } else response.sendRedirect("app/input.jsp");
%>
