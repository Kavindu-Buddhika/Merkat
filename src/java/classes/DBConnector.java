package classes;

import java.sql.*;

/**
 *
 * @author Kavindu
 */
public class DBConnector {
    final static String URL = "jdbc:mysql://localhost:3306/merkat";
    final static String DB_USER = "root";
    final static String DB_PW = "";
    final static String DRIVER = "com.mysql.jdbc.Driver";
    static Connection con;

    public static Connection getConnection() throws Exception {
        Class.forName(DRIVER);
        con = DriverManager.getConnection(URL, DB_USER, DB_PW);
        return con;
    }
    
}
