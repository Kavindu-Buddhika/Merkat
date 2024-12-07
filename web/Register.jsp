<%-- 
    Document   : Register
    Created on : Aug 2, 2023, 1:16:26 AM
    Author     : Kavindu
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.DBConnector"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String number = request.getParameter("number");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/merkat", "root", "");
        
            String checkQuery = "SELECT COUNT(*) FROM seller WHERE username=?";
            PreparedStatement checkStmt = con.prepareStatement(checkQuery);
            checkStmt.setString(1, username);
            ResultSet sellerResult = checkStmt.executeQuery();

            if (sellerResult.next() && sellerResult.getInt(1) > 0) {
                out.println("Username already exists for sellers. Choose a different username.");
                con.close();
                return;
            }

            checkQuery = "SELECT COUNT(*) FROM buyer WHERE username=?";
            checkStmt = con.prepareStatement(checkQuery);
            checkStmt.setString(1, username);
            ResultSet buyerResult = checkStmt.executeQuery();

            if (buyerResult.next() && buyerResult.getInt(1) > 0) {
                out.println("Username already exists for buyers. Choose a different username.");
                con.close();
                return;
            }
        
        
        

        if (request.getParameter("button1") != null) {
            if (!fname.isEmpty() && !lname.isEmpty() && !number.isEmpty() && !address.isEmpty() &&
                !email.isEmpty() && !username.isEmpty() && !password.isEmpty()) {

                String query = "INSERT INTO seller (fname,lname,number,address,email,username,password) VALUES(?,?,?,?,?,?,?)";
                PreparedStatement pstmt = con.prepareStatement(query);

                pstmt.setString(1, fname);
                pstmt.setString(2, lname);
                pstmt.setString(3, number);
                pstmt.setString(4, address);
                pstmt.setString(5, email);
                pstmt.setString(6, username);
                pstmt.setString(7, password);
                pstmt.executeUpdate();

                out.println("Data saved successfully!");
            } else {
                out.println("All the Field are required");
            }
        } else if (request.getParameter("button2") != null) {
            if (!fname.isEmpty() && !lname.isEmpty() && !number.isEmpty() && !address.isEmpty() &&
                !email.isEmpty() && !username.isEmpty() && !password.isEmpty()) {

                String query = "INSERT INTO buyer (fname,lname,number,address,email,username,password) VALUES(?,?,?,?,?,?,?)";
                PreparedStatement pstmt = con.prepareStatement(query);

                pstmt.setString(1, fname);
                pstmt.setString(2, lname);
                pstmt.setString(3, number);
                pstmt.setString(4, address);
                pstmt.setString(5, email);
                pstmt.setString(6, username);
                pstmt.setString(7, password);
                pstmt.executeUpdate();

                out.println("Data saved successfully!");
            } else {
                out.println("All the Field are required");
            }
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>


<%

    
//    Class.forName("com.mysql.jdbc.Driver");
//    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/merkat", "root", "");
//
//    String enteredUsername = request.getParameter("username");
//    String sellerquery = "SELECT COUNT(*) FROM seller WHERE username = ?";
//    String customerquery = "SELECT COUNT(*) FROM buyer WHERE username = ?";
//
//    // Check in the seller table
//    PreparedStatement sellerStatement = con.prepareStatement(sellerquery);
//    sellerStatement.setString(1, enteredUsername);
//    ResultSet sellerResultSet = sellerStatement.executeQuery();
//    sellerResultSet.next();
//    int sellerCount = sellerResultSet.getInt(1);
//
//// Check in the customer table
//    PreparedStatement customerStatement = con.prepareStatement(customerquery);
//    customerStatement.setString(1, enteredUsername);
//    ResultSet customerResultSet = customerStatement.executeQuery();
//    customerResultSet.next();
//    int customerCount = customerResultSet.getInt(1);
    
%>


<!DOCTYPE html>
<html data-bs-theme="light" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            />
        <title>register</title>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Abyssinica+SIL&amp;display=swap"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link rel="stylesheet" href="styles/register.css" />
    </head>
    <body>

        <!-- Start: Navbar Right Links -->
        <nav class="navbar navbar-expand-md bg-body py-3">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="#"
                   ><span
                        ><img src="img/logo.png" style="width: 100px" /></span></a
                ><button
                    data-bs-toggle="collapse"
                    class="navbar-toggler"
                    data-bs-target="#navcol-2"
                    >
                    <span class="visually-hidden">Toggle navigation</span
                    ><span class="navbar-toggler-icon"></span>
                </button>
                <div
                    class="collapse navbar-collapse"
                    id="navcol-2"
                    style="width: 564px"
                    >
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a
                                class="nav-link"
                                href="index.jsp"
                                style="font-weight: bold; padding: 8px"
                                >Home</a
                            >
                        </li>
<!--                        <li class="nav-item">
                            <a
                                class="nav-link nav-item"
                                href="#"
                                style="
                                font-weight: bold; /color: var(--bs-navbar-color);/
                                padding-left: 8px;
                                "
                                >About Us</a
                            >
                        </li>-->
<!--                        <li class="nav-item">
                            <div
                                class="nav-item dropdown"
                                style="height: 40px; padding: 7px; padding-left: 0px"
                                >
                                <a
                                    class="dropdown-toggle"
                                    aria-expanded="false"
                                    data-bs-toggle="dropdown"
                                    href="#"
                                    style="
                                    height: 40px;
                                    width: 109.45px;
                                    color: var(--bs-navbar-color);
                                    font-weight: bold;
                                    padding: 8px;
                                    padding-left: 8px;
                                    margin-left: 0px;
                                    "
                                    >Categories&nbsp;</a
                                >
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Electronics&nbsp;</a
                                    ><a class="dropdown-item" href="#">Sports &amp; Outdoor</a
                                    ><a class="dropdown-item" href="#">Babies &amp; Toys</a>
                                </div>
                            </div>
                        </li>-->
                        <li class="nav-item">
                            <a class="nav-link" href="buyerlogin.jsp" style="padding: 0px"
                               ><svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="1em"
                                    height="1em"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    style="
                                    font-size: 24px;
                                    height: 40px;
                                    width: 40px;
                                    padding: 6px;
                                    color: var(--bs-red);
                                    padding-left: 0px;
                                    margin-left: 0px;
                                    "
                                    >
                                <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M5.79166 2H1V4H4.2184L6.9872 16.6776H7V17H20V16.7519L22.1932 7.09095L22.5308 6H6.6552L6.08485 3.38852L5.79166 2ZM19.9869 8H7.092L8.62081 15H18.3978L19.9869 8Z"
                                    fill="currentColor"
                                    ></path>
                                <path
                                    d="M10 22C11.1046 22 12 21.1046 12 20C12 18.8954 11.1046 18 10 18C8.89543 18 8 18.8954 8 20C8 21.1046 8.89543 22 10 22Z"
                                    fill="currentColor"
                                    ></path>
                                <path
                                    d="M19 20C19 21.1046 18.1046 22 17 22C15.8954 22 15 21.1046 15 20C15 18.8954 15.8954 18 17 18C18.1046 18 19 18.8954 19 20Z"
                                    fill="currentColor"
                                    ></path></svg
                                ></a>
                        </li>
                        <li
                            class="nav-item"
                            style="
                            padding: 0px;
                            padding-right: 0px;
                            width: 40px;
                            margin-right: 6px;
                            "
                            >
                            <a class="nav-link" href="buyerlogin.jsp" style="padding: 0px"
                               ><svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="1em"
                                    height="1em"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    style="
                                    width: 40px;
                                    height: 40px;
                                    padding: 6px;
                                    color: var(--bs-pink);
                                    margin-right: 0px;
                                    padding-left: 0px;
                                    padding-right: 6px;
                                    margin-left: 0px;
                                    padding-top: 6px;
                                    padding-bottom: 6px;
                                    "
                                    >
                                <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M12.0122 5.57169L10.9252 4.48469C8.77734 2.33681 5.29493 2.33681 3.14705 4.48469C0.999162 6.63258 0.999162 10.115 3.14705 12.2629L11.9859 21.1017L11.9877 21.0999L12.014 21.1262L20.8528 12.2874C23.0007 10.1395 23.0007 6.65711 20.8528 4.50923C18.705 2.36134 15.2226 2.36134 13.0747 4.50923L12.0122 5.57169ZM11.9877 18.2715L16.9239 13.3352L18.3747 11.9342L18.3762 11.9356L19.4386 10.8732C20.8055 9.50635 20.8055 7.29028 19.4386 5.92344C18.0718 4.55661 15.8557 4.55661 14.4889 5.92344L12.0133 8.39904L12.006 8.3918L12.005 8.39287L9.51101 5.89891C8.14417 4.53207 5.92809 4.53207 4.56126 5.89891C3.19442 7.26574 3.19442 9.48182 4.56126 10.8487L7.10068 13.3881L7.10248 13.3863L11.9877 18.2715Z"
                                    fill="currentColor"
                                    ></path></svg
                                ></a>
                        </li>
                        <li class="nav-item"></li>
                        <li class="nav-item">
                            <a
                                class="nav-link active"
                                href="Register.jsp"
                                style="
                                color: var(--bs-navbar-color);
                                font-weight: bold;
                                width: 70px;
                                text-decoration: underline;
                                padding: 8px;
                                margin: 0px;
                                margin-right: 0px;
                                margin-left: 0px;
                                padding-right: 8px;
                                padding-left: 8px;
                                "
                                >Register</a
                            >
                        </li>
                        <li class="nav-item">
                            <p
                                style="
                                height: 40px;
                                width: 30px;
                                padding: 8px;
                                margin-bottom: 0px;
                                padding-left: 8px;
                                "
                                >
                                or
                            </p>
                        </li>
                        <li class="nav-item">
                            <a href="index.jsp">
                            <button
                                class="btn btn-primary"
                                type="button"
                                style="
                                width: 70px;
                                height: 40px;
                                padding: 8px;
                                padding-right: 8px;
                                padding-top: 8px;
                                padding-bottom: 8px;
                                padding-left: 8px;
                                background: rgb(91, 97, 105);
                                color: rgb(255, 255, 255);
                                border-color: rgb(5, 9, 12);
                                "
                                >
                                Login
                            </button>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End: Navbar Right Links -->
        <form
            class="rg-form"
            style="
            text-align: center;
            width: 350px;
            margin-bottom: 12px;
            margin-top: 12px;
            "
            >
            <h2
                style="
                text-align: center;
                color: rgb(15, 95, 120);
                font-weight: bold;
                font-family: 'Abyssinica SIL', serif;
                font-size: 30px;
                margin-bottom: 12px;
                "
                >
                Registration form
            </h2>
            <div class="rf-input-container" style="text-align: center; width: 350px">
                <i
                    class="fa fa-user fa fa-user rf-icon"
                    style="
                    --bs-body-bg: var(--bs-secondary-bg);
                    color: rgb(15, 95, 120);
                    background: var(--bs-body-bg);
                    border-top-color: var(--bs-gray-300);
                    text-align: center;
                    "
                    ></i
                ><input
                    class="form-control rf-input-field"
                    type="text"
                    placeholder="Firstname"
                    name="fname"
                    style="width: 300px; text-align: left"
                    />
            </div>
            <div class="rf-input-container" style="text-align: center; width: 350px">
                <i
                    class="fa fa-user fa fa-user rf-icon"
                    style="
                    --bs-body-bg: var(--bs-secondary-bg);
                    color: rgb(15, 95, 120);
                    background: var(--bs-body-bg);
                    border-top-color: var(--bs-gray-300);
                    text-align: center;
                    "
                    ></i
                ><input
                    class="form-control rf-input-field"
                    type="text"
                    placeholder="Lastname"
                    name="lname"
                    style="width: 300px; text-align: left"
                    />
            </div>
            <div class="rf-input-container" style="width: 350px">
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="1em"
                    height="1em"
                    fill="currentColor"
                    viewBox="0 0 16 16"
                    class="bi bi-telephone-fill fa fa-envelope rf-icon"
                    style="
                    color: rgb(15, 95, 120);
                    background: var(--bs-gray-300);
                    border-top-color: var(--bs-gray-300);
                    height: 46px;
                    padding: 14px;
                    "
                    >
                <path
                    fill-rule="evenodd"
                    d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"
                    ></path></svg
                ><input
                    class="form-control rf-input-field"
                    type="text"
                    placeholder="Mobile number"
                    name="number"
                    style="width: 300px"
                    />
            </div>
            <div class="rf-input-container" style="width: 350px">
                <i
                    class="fa fa-envelope fa fa-envelope rf-icon"
                    style="
                    color: rgb(15, 95, 120);
                    background: var(--bs-gray-300);
                    border-top-color: var(--bs-gray-300);
                    "
                    ></i
                ><input
                    class="form-control rf-input-field"
                    type="text"
                    placeholder="email"
                    name="email"
                    style="width: 300px"
                    />
            </div>
            <div class="rf-input-container" style="width: 350px">
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="1em"
                    height="1em"
                    viewBox="0 0 24 24"
                    fill="none"
                    class="fa fa-envelope rf-icon"
                    style="
                    color: rgb(15, 95, 120);
                    background: var(--bs-gray-300);
                    border-top-color: var(--bs-gray-300);
                    height: 46px;
                    padding: 14px;
                    "
                    >
                <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M21 8.77217L14.0208 1.79299C12.8492 0.621414 10.9497 0.621413 9.77817 1.79299L3 8.57116V23.0858H10V17.0858C10 15.9812 10.8954 15.0858 12 15.0858C13.1046 15.0858 14 15.9812 14 17.0858V23.0858H21V8.77217ZM11.1924 3.2072L5 9.39959V21.0858H8V17.0858C8 14.8767 9.79086 13.0858 12 13.0858C14.2091 13.0858 16 14.8767 16 17.0858V21.0858H19V9.6006L12.6066 3.2072C12.2161 2.81668 11.5829 2.81668 11.1924 3.2072Z"
                    fill="currentColor"
                    ></path></svg
                ><input
                    class="form-control rf-input-field"
                    type="text"
                    placeholder="Address"
                    name="address"
                    style="width: 300px"
                    />
            </div>
            <div class="rf-input-container" style="text-align: center; width: 350px">
                <i
                    class="fa fa-user fa fa-user rf-icon"
                    style="
                    --bs-body-bg: var(--bs-secondary-bg);
                    color: rgb(15, 95, 120);
                    background: var(--bs-body-bg);
                    border-top-color: var(--bs-gray-300);
                    text-align: center;
                    "
                    ></i
                ><input
                    
                    class="form-control rf-input-field"
                    type="text"
                    placeholder="Username"
                    name="username"
                    style="width: 300px; text-align: left"
                    />
            </div>
                
            <div class="rf-input-container" style="width: 350px">
                <i
                    class="fa fa-key fa fa-key rf-icon"
                    style="color: rgb(15, 95, 120); background: var(--bs-gray-300)"
                    ></i
                ><input
                    class="form-control rf-input-field"
                    type="password"
                    placeholder="Password"
                    name="password"
                    style="width: 300px"
                    />
            </div>
<!--            <div class="rf-input-container" style="width: 350px">
                <i
                    class="fa fa-key fa fa-key rf-icon"
                    style="color: rgb(15, 95, 120); background: var(--bs-gray-300)"
                    ></i
                ><input
                    class="form-control rf-input-field"
                    type="password"
                    placeholder="Re-enter Password"
                    name="repassword"
                    style="width: 300px"
                    />
            </div>-->
            <div>
                <button
                    class="btn btn-primary"
                    type="Register"
                    name="button1"
                    style="
                    text-align: center;
                    background: rgb(15, 95, 120);
                    border-top-color: var(--bs-btn-disabled-color);
                    margin: 6px;
                    "
                    >
                    Register as a seller</button
                ><button
                    class="btn btn-primary"
                    type="Register"
                    name="button2"
                    style="
                    text-align: center;
                    background: rgb(15, 95, 120);
                    border-top-color: var(--bs-btn-disabled-color);
                    margin: 6px;
                    "
                    >
                    Register as a buyer
                </button>
            </div>
        </form>
        <div>
            <!-- Start: Footer Basic -->
            <footer class="text-center">
                <div class="container text-muted py-4 py-lg-5">
                    <ul class="list-inline">
                        <li class="list-inline-item me-4">
                            <a class="link-secondary" href="#">Home</a>
                        </li>
                        <li class="list-inline-item me-4">
                            <a class="link-secondary" href="#">About Us</a>
                        </li>
                        <li class="list-inline-item">
                            <a class="link-secondary" href="#">Contact Us</a>
                        </li>
                    </ul>
                    <ul class="list-inline">
                        <li class="list-inline-item me-4">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="1em"
                                height="1em"
                                fill="currentColor"
                                viewBox="0 0 16 16"
                                class="bi bi-facebook"
                                >
                            <path
                                d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"
                                ></path>
                            </svg>
                        </li>
                        <li class="list-inline-item me-4">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="1em"
                                height="1em"
                                fill="currentColor"
                                viewBox="0 0 16 16"
                                class="bi bi-twitter"
                                >
                            <path
                                d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"
                                ></path>
                            </svg>
                        </li>
                        <li class="list-inline-item">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="1em"
                                height="1em"
                                fill="currentColor"
                                viewBox="0 0 16 16"
                                class="bi bi-instagram"
                                >
                            <path
                                d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"
                                ></path>
                            </svg>
                        </li>
                    </ul>
                    <p class="mb-0">Copyright © 2023 Mercat</p>
                </div>
            </footer>
            <!-- End: Footer Basic -->
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>