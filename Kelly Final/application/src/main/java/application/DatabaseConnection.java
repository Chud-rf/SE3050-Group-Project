package application;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    // Database connection credentials for MySQL schema
    private static final String URL = "jdbc:mysql://localhost:3306/group_project";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    // Shared connection instance
    private static Connection connection;

    // Prevent direct instantiation
    private DatabaseConnection() {
    }

    // Returns an open connection, creating or reopening it if needed
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        if (connection == null || connection.isClosed()) {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        }
        return connection;
    }

    // Closes the active connection and clears the reference
    public static void closeConnection() {
        if (connection != null) {
            try {
                if (!connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                connection = null;
            }
        }
    }
}