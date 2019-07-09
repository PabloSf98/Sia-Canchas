package Conexiones;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import java.sql.Statement;
public class Conexion {
    static Connection contacto=null;
    public static String usuario;
    public static String password;
    public static boolean status=false;
    public static Connection getConexion(){
        status=false;
        String url="jdbc:sqlserver://localhost:1433;databaseName=MonumentalSoccer";
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        }catch(ClassNotFoundException e){
                JOptionPane.showMessageDialog(null,"No se pudo establecer la conexion... revisar Driver" + e.getMessage(),
                "Error de conexion",JOptionPane.ERROR_MESSAGE);
        }
        try{
            contacto = DriverManager.getConnection(url,Conexion.usuario,Conexion.password);
            status=true;
        }catch (SQLException e){
            JOptionPane.showMessageDialog(null,"Error" + e.getMessage(),
            "Error de conexion, intentar nuevamente",JOptionPane.ERROR_MESSAGE);
        }
        return contacto;
    }
    public static void setCuenta(String usuario, String password){
        Conexion.usuario=usuario;
        Conexion.password=password;
    }
    public static boolean getstatus(){
        return status;
    }
}
