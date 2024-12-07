/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Kavindu
 */
@MultipartConfig
public class additem extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        

        if (request.getParameter("add") != null) {
            String pname = request.getParameter("pname");
            String price = request.getParameter("price");
            String quantity = request.getParameter("quantity");
            String category = request.getParameter("category");
            String description = request.getParameter("description");
            Part file = request.getPart("image");
            String imageFileName = file.getSubmittedFileName();
            String uploadPath = "C:\\Users\\Kavindu\\Documents\\NetBeansProjects\\merkat\\web\\img\\items\\" + imageFileName;

            try {
                FileOutputStream fos = new FileOutputStream(uploadPath);
                InputStream is = file.getInputStream();

                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();

            } catch (IOException e) {
                e.getMessage();
            }

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/merkat", "root", "");
                String query = "INSERT INTO product (pname,category,quantity,price,description,image) VALUES(?,?,?,?,?,?)";
                PreparedStatement pstmt = con.prepareStatement(query);

                pstmt.setString(1, pname);
                pstmt.setString(2, category);
                pstmt.setString(3, quantity);
                pstmt.setString(4, price);
                pstmt.setString(5, description);
                pstmt.setString(6, imageFileName);
                pstmt.executeUpdate();

                response.sendRedirect("Sellerdashboard.jsp");

            } catch (ClassNotFoundException | SQLException e) {
                e.getMessage();
            }
            
            
        } 
            
            
            
            
            
//            String pname = request.getParameter("pname");
//            String price = request.getParameter("price");
//            String quantity = request.getParameter("quantity");
//            String category = request.getParameter("category");
//            String description = request.getParameter("description");
//            String product_id = request.getParameter("product_Id");
//            Part file = request.getPart("image");
//            String imageFileName = file.getSubmittedFileName();
//            String uploadPath = "C:\\Users\\Kavindu\\Documents\\NetBeansProjects\\merkat\\web\\img\\items\\" + imageFileName;
//
//            try {
//                FileOutputStream fos = new FileOutputStream(uploadPath);
//                InputStream is = file.getInputStream();
//
//                byte[] data = new byte[is.available()];
//                is.read(data);
//                fos.write(data);
//                fos.close();
//
//            } catch (IOException e) {
//                e.getMessage();
//            }
//
//            try {
//                Class.forName("com.mysql.jdbc.Driver");
//                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/merkat", "root", "");
//                String query = "UPDATE product SET pname = ? AND category = ? AND quantity = ? AND price = ? AND description = ? AND image = ? WHERE product_id = ?";
//                PreparedStatement pstmt = con.prepareStatement(query);
//
//                pstmt.setString(1, pname);
//                pstmt.setString(2, category);
//                pstmt.setString(3, quantity);
//                pstmt.setString(4, price);
//                pstmt.setString(5, description);
//                pstmt.setString(6, imageFileName);
//                pstmt.setString(7, product_id);
//                pstmt.executeUpdate();
//
//                response.sendRedirect("additem.jsp");
//
//            } catch (ClassNotFoundException | SQLException e) {
//                e.getMessage();
//            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
