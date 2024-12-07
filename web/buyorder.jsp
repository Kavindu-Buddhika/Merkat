<%-- 
    Document   : buyorder
    Created on : Aug 11, 2023, 2:50:53 PM
    Author     : Kavindu
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    
    
     // Retrieve parameters from the URL
    double subtotal = Double.parseDouble(request.getParameter("total"));
    double total = Double.parseDouble(request.getParameter("total"));

    // Establish database connection
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/merkat", "root", "");

    // Prepare and execute the insert statement
    String Query = "INSERT INTO orders (subtotalprice, totalprice) VALUES (?, ?)";
    PreparedStatement Stmt = con.prepareStatement(Query);
    Stmt.setDouble(1, subtotal);
    Stmt.setDouble(2, total);
    int rowsInserted = Stmt.executeUpdate();
    response.sendRedirect("Customerhome.jsp");

    // Close resources
    Stmt.close();
    con.close();

%>