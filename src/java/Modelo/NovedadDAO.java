package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Maria Fernanda
 */
public class NovedadDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    public List listar() {
        String sql = "select * from entregas, curso where entregas.id_Curso_fk= curso.id_Curso";
        List<Novedad> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Novedad no = new Novedad();
                no.setId(rs.getInt("id_Entrega"));
                no.setFec(rs.getString("fecha_Hora"));
                no.setJor(rs.getString("Jornada"));                
                no.setUsu(rs.getString("Persona"));
                no.setNoe(rs.getString("Estudiantes"));
                no.setDes(rs.getString("Novedad"));
                no.setCanr(rs.getString("cantidad_Entrega"));
                no.setCur(rs.getString("nombre_Curso"));
                no.setRef(rs.getString("id_Refrigerio_fk"));


                lista.add(no);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    
    
    
    
    
    
    
    public int agregar(Novedad no) {
        String sql = "insert into entregas (fecha_Hora, Jornada, Persona, Estudiantes,Novedad, cantidad_Entrega, id_Curso_fk,id_Refrigerio_fk)values(?,?,?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, no.getFec());
            ps.setString(1, no.getJor());
            ps.setString(4, no.getUsu()); 
            ps.setString(4, no.getNoe());
            ps.setString(4, no.getDes());  
            ps.setString(2, no.getCanr());
            ps.setString(5, no.getCur()); 
            ps.setString(4, no.getRef());  

            ps.executeUpdate();
		
        } catch (Exception e) {
        }
        return r;
  
    }
      public Novedad listarId(int id) {
        Novedad nov = new Novedad();
        String sql = "select * from novedades where id_Novedad=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nov.setFec(rs.getString(2));
                nov.setCanr(rs.getString(3));
//                nov.setCand(rs.getString(4));
//                nov.setEst(rs.getString(5));
                nov.setUsu(rs.getString(6));
                nov.setCur(rs.getString(7));

            }
        } catch (Exception e) {
        }
        return nov;
    }
      public int actualizar(Novedad em) {
        String sql = "update novedades set fecha_Novedad=?, cantidad_Refrigerios_Recibidos=?,cantidad_Refrigerios_Devueltos=?,estado_Novedad=?,id_Usuario_fk=?, id_Curso_fk=?  where id_Novedad=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getFec());
            ps.setString(2, em.getCanr());
//            ps.setString(3, em.getCand());
//            ps.setString(4, em.getEst());
            ps.setString(5, em.getUsu());
            ps.setString(6, em.getCur());

            ps.setInt(7, em.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    public ResultSet buscarlo(int op, String novedades) {
        String ref = "";
        if (op == 1) {
            ref = "where  id_Entrega=?";
        }
        String sql = "select id_Refrigerio,id_Refrigerio from refrigerio " + ref;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            if (op == 1) {
                ps.setString(1, novedades);
            }
            rs = ps.executeQuery();
        } catch (SQLException e) {
            System.out.println("error" + e.getMessage());
        }

        return rs;

    }
    public ResultSet buscarla(int op, String novedades) {
        String ref = "";
        if (op == 1) {
            ref = "where  id_Novedad=?";

        }
        String sql = "select id_Curso, nombre_Curso from curso " + ref;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            if (op == 1) {
                ps.setString(1, novedades);
            }
            rs = ps.executeQuery();
        } catch (SQLException e) {
            System.out.println("error" + e.getMessage());
        }

        return rs;

    }
    
}

