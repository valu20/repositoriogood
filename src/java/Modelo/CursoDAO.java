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


public class CursoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    
    public Curso buscar(String nume){
        Curso c=new Curso();
        String sql="Select * from curso where nombre_Curso="+nume;
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                c.setId(rs.getInt(1));
                c.setNum(rs.getString(2));
                c.setJor(rs.getString(3));
                c.setCan(rs.getString(4));                
                c.setEst(rs.getString(5));   
                c.setAul(rs.getString(6));
            }
        } catch (Exception e) {
        }
        return c;
    }

    
    
    //*******Operaciones CRUD***************//
    
    public List listar() {
        String sql = "select * from curso,aula where curso.id_Aula_fk= aula.id_Aula  order by id_Curso asc";
        List<Curso> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Curso cu = new Curso();
                cu.setId(rs.getInt("id_Curso"));
                cu.setNum(rs.getString("nombre_Curso"));
                cu.setJor(rs.getString("jornada_Curso"));
                cu.setCan(rs.getString("cantidad_Estudiantes"));
                cu.setEst(rs.getString("estado_Curso"));
                cu.setAul(rs.getString("numero_Aula"));
                lista.add(cu);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public int agregar(Curso cu) {
        String sql = "insert into curso(nombre_Curso, jornada_Curso, cantidad_Estudiantes, estado_Curso, id_Aula_fk)values(?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cu.getNum());
            ps.setString(2, cu.getJor());
            ps.setString(3, cu.getCan());
            ps.setString(4, cu.getEst());
            ps.setString(5, cu.getAul());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;

    }

    /**
     * public int existeCurso(String Curso){
     *
     * String sql=" select count(id_Curso) from curso where numero_Curso =?";
     * try { con=cn.Conexion(); ps=con.prepareStatement(sql); ps.setString(1,
     * Curso); ResultSet rs = null; rs =ps.executeQuery(); if(rs.next()) {
     * return rs.getInt(1); } } catch (Exception e) { } return 1;
     *
     * }
     *
     */
    public Curso listarId(int id) {
        Curso cur = new Curso();
        String sql = "select * from curso where id_Curso=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cur.setNum(rs.getString(2));
                cur.setJor(rs.getString(3));
                cur.setCan(rs.getString(4));
                cur.setEst(rs.getString(5));
                cur.setAul(rs.getString(6));
            }
        } catch (Exception e) {
        }
        return cur;
    }

    public int actualizar(Curso em) {
        String sql = "update curso set nombre_Curso=?, jornada_Curso=?,cantidad_Estudiantes=?,estado_Curso=?,id_Aula_fk=? where id_Curso=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getNum());
            ps.setString(2, em.getJor());
            ps.setString(3, em.getCan());
            ps.setString(4, em.getEst());
            ps.setString(5, em.getAul());
            ps.setInt(6, em.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    //estado
    public int changeEstado(Curso em) {
        String sql = "update curso set estado_Curso=? where id_Curso=?";

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
    public ResultSet buscarlo(int op, String aula) {
        String aul = "";
        if (op == 1) {
            aul = "where  id_Aula=?";

        }
        String sql = "select id_Aula, numero_Aula from aula " + aul;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            if (op == 1) {
                ps.setString(1, aula);
            }
            rs = ps.executeQuery();
        } catch (SQLException e) {
            System.out.println("error" + e.getMessage());
        }

        return rs;

    }
}

