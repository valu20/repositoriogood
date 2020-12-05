package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Usuario buscar(String nomb) {
        Usuario u = new Usuario();
        String sql = "select * from usuario where Nombre=" + nomb;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                u.setId(rs.getInt(1));
                u.setNom(rs.getString(2));
                u.setApe(rs.getString(3));
            }

        } catch (Exception e) {
        }
        return u;

    }

    public Usuario Validar(String correo, String contraseña) {
        Usuario us = new Usuario();
        String sql = "select * from usuario where correo=? and contraseña_Usuario=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contraseña);
            rs = ps.executeQuery();
            while (rs.next()) {
                us.setId(rs.getInt("id_Usuario"));
                us.setCor(rs.getString("correo"));
                us.setCon(rs.getString("contraseña_Usuario"));
                us.setNom(rs.getString("Nombre"));
                us.setRol(rs.getString("id_Role"));
                us.setEst(rs.getString("estado_Usuario"));
                us.setIng(rs.getString("Ingresos"));
            }

        } catch (Exception e) {
        }
        return us;
    }

    //operaciones crud
    public List Listar()
    {
        String sql = "select * from usuario, roles where usuario.id_Role=roles.id_Role order by usuario.id_usuario ";
        
        List<Usuario> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario us = new Usuario();
                us.setId(rs.getInt(1));
                us.setNom(rs.getString(2));
                us.setApe(rs.getString(3));
                us.setCor(rs.getString(4));
                us.setEst(rs.getString(6));
                us.setIng(rs.getString(7));
                us.setRol(rs.getString("nombre_rol"));
                lista.add(us);
            }
        } catch (Exception e) {
        }
        return lista;

    }

    public boolean agregar(Usuario us) throws Exception {
        String sql = "INSERT INTO usuario( Nombre, Apellido, correo, contraseña_Usuario, estado_Usuario, Ingresos, id_Role)values(?,?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, us.getNom());
            ps.setString(2, us.getApe());
            ps.setString(3, us.getCor());
            ps.setString(4, us.getCon());
            ps.setString(5, us.getEst());
            ps.setString(6, "1");
            ps.setString(7, us.getRol());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }

    }

    public Usuario listarId(int id) {
        Usuario usu = new Usuario();
        String sql = "select * from usuario where id_Usuario=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                usu.setNom(rs.getString(2));
                usu.setCor(rs.getString(3));
                usu.setCon(rs.getString(4));
                usu.setEst(rs.getString(5));
                usu.setRol(rs.getString(6));
            }
        } catch (Exception e) {
        }
        return usu;
    }
    public int actualizar(Usuario us){
        String sql="update usuario set Nombre=?, Apellido=?,correo=?,estado_Usuario=?, id_Role=? where id_Usuario=?";
        
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, us.getNom());
            ps.setString(2, us.getApe());
            ps.setString(3, us.getCor());
            ps.setString(4, us.getEst());
            ps.setString(5, us.getRol());
            ps.setInt(6, us.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return r;
    }
    public int changeEstado(Usuario us) {
        String sql = "update usuario set estado_Usuario=? where id_Usuario=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            String estado = us.getEst();
            if (estado.equalsIgnoreCase("Inactivo")) {
                ps.setString(1, "Activo");
            } else {
                ps.setString(1, "Inactivo");
            }  ps.setInt(2, us.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    public ResultSet buscarlo(int op, String rol){
        String role="";
        if(op==1){
            role="where id_Role=?";
            
        }
       String sql= "select id_Role, nombre_rol from roles "+role;
       try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            if(op==1){
                ps.setString(1, rol);
            }
            rs=ps.executeQuery();
        } catch (SQLException e) {
            System.out.println("error"+e.getMessage());
        }
        return rs;
        
    }
    
}
