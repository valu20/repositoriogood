/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class RefrigerioDAO {
    
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    
    
    
    public List listar(){
        String sql="select * from refrigerio,usuario,curso where refrigerio.id_Usuario_fk= usuario.id_Usuario";
        List<Refrigerio>lista=new ArrayList<>();
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                Refrigerio re=new Refrigerio();
                re.setId(rs.getInt(1));
                re.setJor(rs.getString(2));
                re.setCan(rs.getString(3));
                re.setFec(rs.getString(4));
                re.setEst(rs.getString(5)); 
                re.setUsu(rs.getString("nombre")); 
                re.setCur(rs.getString(7)); 
                lista.add(re);
            }
        } catch (Exception e) {
        }
        return lista;
   
}
    
    
     public int agregar(Refrigerio re){ 
        String sql="insert into refrigerio(jornada_Refrigerio, cantidad_Refrigerio, fecha_Hora_Llegada, estado_Refrigerio, id_Usuario_fk)values(?,?,?,?,?)";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, re.getJor());
            ps.setString(2, re.getCan());
            ps.setString(3, re.getFec());
            ps.setString(4, re.getEst());
            ps.setString(5, re.getUsu());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
        
    }
     
     
     
    public Refrigerio listarId(int id){
        Refrigerio ref=new Refrigerio();
        String sql="select * from refrigerio where id_Refrigerio="+id;
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                ref.setJor(rs.getString(2));
                ref.setCan(rs.getString(3));
                ref.setFec(rs.getString(4));
                ref.setEst(rs.getString(5)); 
                ref.setUsu(rs.getString(6));
            }
        } catch (Exception e) {
        }
        return ref;
    }
    public int actualizar(Refrigerio cu){
        String sql="update refrigerio set jornada_Refrigerio=?, cantidad_Refrigerio=?,fecha_Hora_Llegada=?,estado_Refrigerio=?,id_Usuario_fk=? where id_Refrigerio=?";
        
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, cu.getJor());
            ps.setString(2, cu.getCan());
            ps.setString(3, cu.getFec());
            ps.setString(4, cu.getEst());
            ps.setString(5, cu.getUsu());
            ps.setInt(6, cu.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    //estado
    public int changeEstado(Refrigerio em) {
        String sql = "update refrigerio set estado_Refrigerio=? where id_Refrigerio=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            String estado = em.getEst();
            if (estado.equalsIgnoreCase("Inactivo")) {
                ps.setString(1, "Activo");
            } else {
                ps.setString(1, "Inactivo");
            }
            ps.setInt(2, em.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
        // TRAER FORANEAS
        public ResultSet buscarlo(int op, String refrigerio) {
        String ref = "";
        if (op == 1) {
            ref = "where  id_Refrigerio=?";

        }
        String sql = "select id_Usuario, nombre from usuario " + ref;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            if (op == 1) {
                ps.setString(1, refrigerio);
            }
            rs = ps.executeQuery();
        } catch (SQLException e) {
            System.out.println("error" + e.getMessage());
        }

        return rs;

    }
        public ResultSet buscarla(int op, String refrigerio) {
        String ref = "";
        if (op == 1) {
            ref = "where  id_Refrigerio=?";

        }
        String sql = "select id_Curso, nombre_Curso from curso " + ref;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            if (op == 1) {
                ps.setString(1, refrigerio);
            }
            rs = ps.executeQuery();
        } catch (SQLException e) {
            System.out.println("error" + e.getMessage());
        }

        return rs;

    }
}


