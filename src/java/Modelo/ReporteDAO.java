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
import java.util.ArrayList;
import java.util.List;


public class ReporteDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    
    public Reporte buscar(String usu){
        Reporte c=new Reporte();
        String sql="Select * from reportes where id_Usuario_fk="+usu;
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                c.setId(rs.getInt(1));
                c.setUsu(rs.getString(2));
                c.setCur(rs.getString(3));
                c.setEnt(rs.getString(4));                
                c.setRef(rs.getString(5));                
            }
        } catch (Exception e) {
        }
        return c;
    }
    
    //*******Operaciones CRUD***************//
    
    public List listar(){
        String sql="select * from reportes,usuario,curso,entregas,refrigerio where reportes.id_Usuario_fk=usuario.id_Usuario && reportes.id_Curso_fk= curso.id_Curso  && reportes.id_Entrega_fk=entregas.id_Entrega && reportes.id_Refrigerio_fk=refrigerio.id_Refrigerio" ;
        List<Reporte>lista=new ArrayList<>();
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                Reporte re=new Reporte();
                re.setId(rs.getInt(1));
                re.setUsu(rs.getString("nombre"));
                re.setCur(rs.getString("nombre_Curso"));
                re.setEnt(rs.getString("cantidad_Entrega"));
                re.setRef(rs.getString("jornada_Refrigerio"));                 
                lista.add(re);
            }
        } catch (Exception e) {
        }
        return lista;
   
}
    public String IdReporte(){
        String id="";
        String sql="select max(IdReporte) from reportes";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                id=rs.getString(1);
            }
        } catch (Exception e) {
        }
        return id;
    }
    public int guardarReporte(Reporte ve){
        String sql="insert into reportes(id_Usuario_fk, id_Curso_fk, id_Entrega_fk, id_Refrigerio_fk)values(?,?,?,?)";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, ve.getUsu());
            ps.setString(2, ve.getCur());
            ps.setString(3, ve.getEnt());
            ps.setString(4, ve.getRef());
            
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    public int guardarDetalleventas(Reporte reporte){
        String sql="insert into reportes(id_Usuario_fk, id_Curso_fk, id_Entrega_fk, id_Refrigerio_fk)values(?,?,?,?)";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, reporte.getUsu());
            ps.setString(2, reporte.getCur());
            ps.setString(3, reporte.getEnt());
            ps.setString(4, reporte.getRef());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    
    
}

