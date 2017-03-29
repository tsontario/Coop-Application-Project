package connection;

import java.sql.*;

public class DataAccess
{

    private static Connection connection;



    public static Connection getConnection()
    {
        return connection;
    }

    public static void openConnection() {
        try
        {
            Class.forName("org.postgresql.Driver");
            //connection = DriverManager.getConnection("jdbc:postgresql://web0.site.uottawa.ca:15432/wausr027","wausr027",Password.getPass());
            //System.out.println(connection);
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres",Password.getPass());
        }catch(Exception e){
            System.out.println("No connection established: "+e.toString());
        }
    }


    public static void closeConnection() {
        try {
            connection.close();
        } catch (Exception e){}
    }
}