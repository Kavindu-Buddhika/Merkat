<%-- 
    Document   : updateproduct
    Created on : Aug 2, 2023, 7:17:20 PM
    Author     : Kavindu
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String product_id = request.getParameter("product_id");
    String pname = "";
    String price = "";
    String quantity = "";

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/merkat", "root", "");

    if (product_id != null) {
        String query = "SELECT product_id, pname,price,quantity FROM product WHERE product_id = ?";
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setString(1, product_id.toString());

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            // Successful login
            //int buyer_id = resultSet.getInt("buyer_id");
            product_id = resultSet.getString("product_id");
            pname = resultSet.getString("pname");
            price = resultSet.getString("price");
            quantity = resultSet.getString("quantity");

        }

        request.setAttribute("new_id", product_id);
        preparedStatement.close();
    }

    String pname1 = request.getParameter("pname");
    String price1 = request.getParameter("price");
    String quantity1 = request.getParameter("quantity");
    String product_id1 = request.getParameter("product_id");

    if (pname1 != null && price1 != null && quantity1 != null) {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/merkat", "root", "");

            String query = "UPDATE product SET pname=?, price=?, quantity=? WHERE product_id=?";


            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, pname1);
            preparedStatement.setString(2, price1);
            preparedStatement.setString(3, quantity1);

            preparedStatement.setString(4, product_id1);
            int rowsUpdated = preparedStatement.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<p>Update successful!</p>");
            } else {
                out.println("<p>Update failed!</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

%>

<!DOCTYPE html>
<html data-bs-theme="light" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            />
        <title>Update product</title>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Akaya+Kanadaka&amp;display=swap"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Alata&amp;display=swap"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Amethysta&amp;display=swap"
            />
        <link rel="stylesheet" href="styles/updateproduct.css" />
    </head>
    <body style="background: rgb(255, 255, 255)">
        <!-- Start: Navbar Right Links -->
        <nav class="navbar navbar-expand-md bg-body py-3">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="#"
                   ><span
                        ><img src="img/logo.png" style="width: 100px" /></span></a
                ><button
                    data-bs-toggle="collapse"
                    class="navbar-toggler"
                    data-bs-target="#navcol-1"
                    >
                    <span class="visually-hidden">Toggle navigation</span
                    ><span class="navbar-toggler-icon"></span>
                </button>
                <div
                    class="collapse navbar-collapse"
                    id="navcol-1"
                    style="width: 564px"
                    >
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a
                                class="nav-link"
                                href="Sellerdashboard.jsp"
                                style="font-weight: bold; padding: 8px"
                                >Home</a
                            >
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="editsellerprofile.jsp" style="width: 40px; padding: 0px"
                               ><svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="1em"
                                    height="1em"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    style="
                                    font-size: 30px;
                                    width: 40px;
                                    height: 40px;
                                    padding: 6px;
                                    color: var(--bs-navbar-color);
                                    padding-left: 0px;
                                    padding-top: 6px;
                                    padding-right: 6px;
                                    padding-bottom: 6px;
                                    "
                                    >
                                <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M16 9C16 11.2091 14.2091 13 12 13C9.79086 13 8 11.2091 8 9C8 6.79086 9.79086 5 12 5C14.2091 5 16 6.79086 16 9ZM14 9C14 10.1046 13.1046 11 12 11C10.8954 11 10 10.1046 10 9C10 7.89543 10.8954 7 12 7C13.1046 7 14 7.89543 14 9Z"
                                    fill="currentColor"
                                    ></path>
                                <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M12 1C5.92487 1 1 5.92487 1 12C1 18.0751 5.92487 23 12 23C18.0751 23 23 18.0751 23 12C23 5.92487 18.0751 1 12 1ZM3 12C3 14.0902 3.71255 16.014 4.90798 17.5417C6.55245 15.3889 9.14627 14 12.0645 14C14.9448 14 17.5092 15.3531 19.1565 17.4583C20.313 15.9443 21 14.0524 21 12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12ZM12 21C9.84977 21 7.87565 20.2459 6.32767 18.9878C7.59352 17.1812 9.69106 16 12.0645 16C14.4084 16 16.4833 17.1521 17.7538 18.9209C16.1939 20.2191 14.1881 21 12 21Z"
                                    fill="currentColor"
                                    ></path></svg
                                ></a>
                        </li>
                        <li class="nav-item" style="height: 40px">
                            <a href="index.jsp"><button
                                class="btn btn-primary"
                                type="button"
                                style="
                                width: 70px;
                                height: 40px;
                                padding-right: 8px;
                                padding-top: 8px;
                                padding-bottom: 8px;
                                padding-left: 8px;
                                background: rgb(91, 97, 105);
                                border-color: rgb(5, 9, 12);
                                color: rgb(255, 255, 255);
                                "
                                >
                                Logout
                            </button>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End: Navbar Right Links -->
        <div
            style="
            background: rgb(149, 125, 64);
            margin-top: 6px;
            margin-bottom: 6px;
            padding-top: 0px;
            "
            >
            <h1
                style="
                padding-bottom: 10px;
                margin-bottom: 0px;
                text-align: center;
                font-family: 'Akaya Kanadaka', serif;
                padding-top: 10px;
                font-size: 42px;
                "
                >
                Add your own products here...
            </h1>
        </div>
        <div
            style="
            height: 440px;
            background: url('img/5567.jpg') center / cover no-repeat;
            "
            ></div>
        <div
            style="
            margin-top: 12px;
            margin-bottom: 12px;
            text-align: center;
            background: #ffffff;
            "
            >
            <h1 style="font-family: Alata, sans-serif; color: rgb(91, 88, 69)">
                Update your product details
            </h1>
        </div>
        <div
            style="
            background: #a8b8bc;
            margin-right: 6px;
            margin-left: 6px;
            margin-bottom: 6px;
            height: auto;
            margin-top: 6px;
            "
            >
            <!-- Start: Pretty Registration Form -->
            <div
                class="row register-form"
                style="margin-right: 0px; margin-left: 0px; height: auto"
                >
                <div
                    class="col-md-8 offset-md-2"
                    style="padding-top: 12px; padding-bottom: 12px; height: auto"
                    >
                    <form
                        action="updateproduct.jsp" method="POST"
                        class="custom-form"
                        style="
                        padding: 12px;
                        margin: 40px;
                        margin-top: 40px;
                        margin-right: 40px;
                        margin-bottom: 40px;
                        margin-left: 40px;
                        padding-top: 60px;
                        padding-bottom: 60px;
                        height: auto;
                        "
                        >

                        <div
                            class="row form-group"
                            style="margin-right: 0px; margin-left: 0px"
                            >
                            <div class="col-sm-4 label-column" style="height: 42px">
                                <label
                                    class="col-form-label"
                                    for="name-input-field"
                                    style="
                                    text-align: justify;
                                    padding-top: 6px;
                                    padding-bottom: 6px;
                                    "
                                    >Product Id</label
                                >
                            </div>
                            <div class="col-sm-6 input-column">

                                <input class="form-control" type="text" name="product_id" value="<%= product_id%>" id="product_id" readonly/>
                            </div>
                        </div>

                        <div
                            class="row form-group"
                            style="margin-right: 0px; margin-left: 0px"
                            >
                            <div class="col-sm-4 label-column" style="height: 42px">
                                <label
                                    class="col-form-label"
                                    for="name-input-field"
                                    style="
                                    text-align: justify;
                                    padding-top: 6px;
                                    padding-bottom: 6px;
                                    "
                                    >Product name</label
                                >
                            </div>
                            <div class="col-sm-6 input-column">
                                <input class="form-control" type="text" name="pname" value="<%= pname%>" id="pname"/>
                            </div>
                        </div>
                        <div
                            class="row form-group"
                            style="margin-right: 0px; margin-left: 0px"
                            >
                            <div class="col-sm-4 label-column">
                                <label
                                    class="col-form-label"
                                    for="email-input-field"
                                    style="
                                    padding-top: 6px;
                                    padding-bottom: 6px;
                                    text-align: justify;
                                    "
                                    >Price</label
                                >
                            </div>
                            <div class="col-sm-6 input-column">
                                <input class="form-control" name="price" value="<%= price%>" type="number" id="price" />
                            </div>
                        </div>
                        <div
                            class="row form-group"
                            style="margin-right: 0px; margin-left: 0px"
                            >
                            <div class="col-sm-4 label-column">
                                <label
                                    class="col-form-label"
                                    for="email-input-field"
                                    style="
                                    padding-top: 6px;
                                    padding-bottom: 6px;
                                    text-align: justify;
                                    "
                                    >Quantity</label
                                >
                            </div>
                            <div class="col-sm-6 input-column">
                                <input class="form-control" type="number" name="quantity" value="<%= quantity%>" id="quantity"/>
                            </div>
                        </div>

                        <div style="height: 42px">
                            <button
                                class="btn btn-primary"
                                type="submit"
                                name = "Update"
                                value="Update"

                                style="
                                text-align: center;
                                background: rgb(15, 95, 120);
                                border-top-color: var(--bs-btn-disabled-color);
                                width: 140px;
                                margin-right: 0px;
                                margin-left: 12px;
                                "
                                >
                                Update product
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- End: Pretty Registration Form -->
        </div>
        <div style="background: #ffffff">
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