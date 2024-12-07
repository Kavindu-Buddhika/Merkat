<%-- 
    Document   : wish
    Created on : Aug 10, 2023, 11:07:49 AM
    Author     : Kavindu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("pid") != null) {
        String product_id = request.getParameter("pid");

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/merkat", "root", "");
        // Execute the query
        String query1 = "SELECT * FROM product WHERE product_id=?";
        PreparedStatement pstmt1 = con.prepareStatement(query1);
        pstmt1.setString(1, product_id);
        ResultSet rs = pstmt1.executeQuery();
        
        rs.next();
        String wname = rs.getString("pname");
        String wprice =rs.getString("price");
        String wimage =rs.getString("image");
        
        String query2 = "INSERT INTO wishlist (wname,wprice,wimage) VALUES (?,?,?)";
        PreparedStatement pstmt2 = con.prepareStatement(query2);
        pstmt2.setString(1, wname);
        pstmt2.setString(2, wprice);
        pstmt2.setString(3, wimage);
        int a = pstmt2.executeUpdate();
        
        if(a > 0){
            response.sendRedirect("Customerhome.jsp");
        }
    }
%>