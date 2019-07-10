package Conexiones;

import static Conexiones.Conexion.contacto;
import java.sql.CallableStatement;
import java.sql.SQLException;
import static java.time.Clock.system;
import javax.swing.JOptionPane;
import java.sql.Connection;
import java.sql.PreparedStatement;


public class Procedimientos {
    
    
        
    
    
   public static void EntradaCliente ( String a, String b, String c, String d )throws SQLException{
       
      
       CallableStatement entrada = Conexion.getConexion().prepareCall("{call EntradaCliente(?,?,?,?)}");
       
       entrada.setString(1, a);
       entrada.setString(2, b);
       entrada.setString(3, c);
       entrada.setString(4, d);
       entrada.execute();
      

   }
    public static void GenerarReserva(String a, String b, String c, String d, String e)throws SQLException{
           CallableStatement entrada = Conexion.getConexion().prepareCall("{call GenReser(?,?,?,?,?)}");
           entrada.setString(1, a);
           entrada.setString(2, b);
           entrada.setString(3, c);
           entrada.setString(4, d);
           entrada.setString(5, e);
           entrada.execute();
          
    }
    public static void EliminarCliente ( int a)throws SQLException{
       
      
           CallableStatement entrada = Conexion.getConexion().prepareCall("{call EliminarCliente(?)}");
           entrada.setInt(1, a);
           entrada.execute();
      

   }
   public static void Ganancias_Ventas(String a, String b)throws SQLException{
        CallableStatement entrada = Conexion.getConexion().prepareCall("{call Ganancias_Ventas(?,?)}");
        entrada.setString(1, a);
        entrada.setString(2, b);
        entrada.execute();
   }
}
      
   
  



