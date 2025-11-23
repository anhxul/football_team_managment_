<%@ page import="java.sql.*" %>
<%
String name,mob,addr,pass;
name=request.getParameter("t1");
mob=request.getParameter("t2");
addr=request.getParameter("t3");
pass=request.getParameter("t4");
 String url = "jdbc:mysql://localhost:3306/aimlb"; // Database name
 String user = "root";                           // MySQL username
 String password = "admin";                      // MySQL password
 String query = "INSERT INTO student (name, mobile, address,password) VALUES (?, ?, ?,?)";

         try{
             // 1 Load the MySQL Driver
             Class.forName("com.mysql.cj.jdbc.Driver");
              // 2 Establish Connection
             Connection conn = DriverManager.getConnection(url, user, password);
              PreparedStatement pstmt = conn.prepareStatement(query);
             pstmt.setString(1,name);
             pstmt.setString(2,mob);
             pstmt.setString(3,addr);
             pstmt.setString(4,pass);
             int row=pstmt.executeUpdate();
             if(row>0)
               response.sendRedirect("login.jsp");
             else
                 out.println("User Not Registered");
         }
         catch (Exception e)
         {
             out.println(e.getMessage());
         }
%>