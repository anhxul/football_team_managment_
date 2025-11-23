
<%@ page import="java.sql.*" %>

<%
String mob,pass;
mob=request.getParameter("t1");
pass=request.getParameter("t2");
String url = "jdbc:mysql://localhost:3306/aimlb";      // Database name
        String user = "root";                           // MySQL username
        String password = "admin";                      // MySQL password
        try {
            // Load the MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Connection
            Connection conn = DriverManager.getConnection(url, user, password);

            // Execute a query
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM student");

            int c=0;
            while (rs.next())
            {
                if(rs.getString("mobile").equals(mob) && rs.getString("password").equals(pass))
                   {
                   response.sendRedirect("dashboard.jsp");
                   session.setAttribute("smob",mob);
                   session.setAttribute("spass",pass);
                   c++;
                   }

            }
            if(c==0)
                out.println("Invalid Username or Password");
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }




%>