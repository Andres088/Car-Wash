
package Connection;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Link {
    
    public static Connection getConnection() throws SQLException
    {
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Link.class.getName()).log(Level.SEVERE, null, ex);
        }
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/carwash","root", "");
        return conn;
    }
}
