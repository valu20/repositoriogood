package Controlador;

import Modelo.Usuario;
import Modelo.UsuarioDAO;
import Modelo.Curso;
import Modelo.CursoDAO;
import Modelo.Refrigerio;
import Modelo.RefrigerioDAO;
import Modelo.Reporte;
import Modelo.ReporteDAO;
import Modelo.Novedad;
import Modelo.NovedadDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.security.auth.message.callback.PrivateKeyCallback;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;
import jdk.nashorn.internal.objects.NativeString;

public class Controlador extends HttpServlet {

    Usuario us = new Usuario();
    UsuarioDAO udao = new UsuarioDAO();
    Curso cu = new Curso();
    CursoDAO cdao = new CursoDAO();
    Refrigerio re = new Refrigerio();
    RefrigerioDAO rdao = new RefrigerioDAO();
    Reporte rep = new Reporte();
    ReporteDAO redao = new ReporteDAO();
    Novedad no = new Novedad();
    NovedadDAO nodao = new NovedadDAO();
    int idu;
    int idc;
    int idr;
    int idre;
    int idn;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        String menu = request.getParameter("menu");
        //String menu="index";
        String accion = request.getParameter("accion");
        System.out.println("menu " + menu);
        System.out.println("accion " + accion);
        if (menu.equals("index")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        if (menu.equals("usuario")) {
            List lista = udao.Listar();
            switch (accion) {
                case "Listar":

                    request.setAttribute("Usuario", lista);
                    break;

                case "Agregar":
                    System.out.println("ingrese agregar");
                    String nom = request.getParameter("txtno");
                    String ape = request.getParameter("txta");
                    String cor = request.getParameter("txtcor");
                    UUID uid = UUID.randomUUID();
                    String con = uid.toString().substring(0, 6);
                    String est = request.getParameter("txtesta");
                    String rol = request.getParameter("txtrol");
                    us.setNom(nom);
                    us.setApe(ape);
                    us.setCor(cor);
                    us.setCon(con);
                    us.setEst(est);
                    us.setRol(rol);
                    boolean result = udao.agregar(us);
                    List listar = udao.Listar();
                    if (result) {
                        request.setAttribute("Usuario", listar);
                        request.setAttribute("validar", "<script>alert('El usuario se ingreso correctamente')</script>");
                        request.getRequestDispatcher("list.jsp").forward(request, response);

                    } else {
                        request.setAttribute("Usuario", listar);
                        request.setAttribute("validar", "<script>alert('Correo duplicado')</script>");
                        request.getRequestDispatcher("list.jsp").forward(request, response);

                    }

                    request.getRequestDispatcher("Controlador?menu=usuario&accion=Listar").forward(request, response);

                    break;

                case "Editar":
                    idu = Integer.parseInt(request.getParameter("id"));
                    Usuario u = udao.listarId(idu);
                    request.setAttribute("Usuario", u);
                    request.getRequestDispatcher("Controlador?menu=usuario&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    try {

                        String nom1 = request.getParameter("txtno");
                        String ape1 = request.getParameter("txta");
                        String cor1 = request.getParameter("txtcor");
                        String est1 = request.getParameter("txtesta");
                        String rol1 = request.getParameter("txtrol");
                        int idusu = Integer.parseInt(request.getParameter("id"));
                        us.setNom(nom1);
                        us.setApe(ape1);
                        us.setCor(cor1);
                        us.setEst(est1);
                        us.setRol(rol1);
                        us.setId(idusu);
                        udao.actualizar(us);
                        request.getRequestDispatcher("Controlador?menu=usuario&accion=Listar").forward(request, response);
                    } catch (Exception e) {
                    }
                case "Activar":
                    try {
                        int idusu = Integer.parseInt(request.getParameter("id"));
                        String est1 = request.getParameter("estado");
                        us.setId(idusu);
                        us.setEst(est1);
                        udao.changeEstado(us);
                        request.getRequestDispatcher("Controlador?menu=usuario&accion=Listar").forward(request, response);
                    } catch (Exception e) {
                    }
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("list.jsp").forward(request, response);
        }
        //CURSO
        if (menu.equals("Curso")) {
            switch (accion) {

                case "BuscarCurso":
                    String nume = request.getParameter("numcurso");
                    cu.setNum(nume);
                    cu = cdao.buscar(nume);
                    request.setAttribute("c", cu);
                    break;

                case "Listar":
                    List lista = cdao.listar();
                    request.setAttribute("cursos", lista);
                    break;
                case "Agregar":
                    String num = request.getParameter("txtNum");
                    String jor = request.getParameter("txtJor");
                    String can = request.getParameter("txtCan");
                    String est = request.getParameter("txtEst");
                    String aul = request.getParameter("txtAul");
                    cu.setNum(num);
                    cu.setJor(jor);
                    cu.setCan(can);
                    cu.setEst(est);
                    cu.setAul(aul);
                    cdao.agregar(cu);
                    request.getRequestDispatcher("Controlador?menu=Curso&accion=Listar").forward(request, response);
                    break;

                case "Editar":
                    idc = Integer.parseInt(request.getParameter("id"));
                    Curso c = cdao.listarId(idc);
                    request.setAttribute("curso", c);
                    request.getRequestDispatcher("Controlador?menu=Curso&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    try {
                        String num1 = request.getParameter("txtNum");
                        String jor1 = request.getParameter("txtJor");
                        String can1 = request.getParameter("txtCan");
                        String est1 = request.getParameter("txtEst");
                        String aul1 = request.getParameter("txtAul");
                        int idcur = Integer.parseInt(request.getParameter("id"));
                        cu.setNum(num1);
                        cu.setJor(jor1);
                        cu.setCan(can1);
                        cu.setEst(est1);
                        cu.setAul(aul1);
                        cu.setId(idcur);
                        cdao.actualizar(cu);
                        request.getRequestDispatcher("Controlador?menu=Curso&accion=Listar").forward(request, response);
                    } catch (Exception e) {

                    }
                case "Activar":
                    try {
                        int idcur = Integer.parseInt(request.getParameter("id"));
                        String est1 = request.getParameter("estado");
                        cu.setId(idcur);
                        cu.setEst(est1);
                        cdao.changeEstado(cu);
                        request.getRequestDispatcher("Controlador?menu=Curso&accion=Listar").forward(request, response);
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                    break;
                default:
                    throw new AssertionError();

            }

            request.getRequestDispatcher("Curso.jsp").forward(request, response);
        }
        //Refrigerio
        if (menu.equals("Refrigerio")) {
            switch (accion) {
                case "Listar":
                    List lista = rdao.listar();
                    request.setAttribute("refrigerio", lista);

                    break;
                case "Agregar":
                    String jor = request.getParameter("txtJor");
                    String can = request.getParameter("txtCan");
                    String fec = request.getParameter("txtFec");
                    String est = request.getParameter("txtEst");
                    String usu = request.getParameter("txtUsu");
                    re.setJor(jor);
                    re.setCan(can);
                    re.setFec(fec);
                    re.setEst(est);
                    re.setUsu(usu);
                    rdao.agregar(re);
                    request.getRequestDispatcher("Controlador?menu=Refrigerio&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    idr = Integer.parseInt(request.getParameter("id"));
                    Refrigerio c = rdao.listarId(idr);
                    request.setAttribute("refri", c);
                    request.getRequestDispatcher("Controlador?menu=Refrigerio&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    try {
                        String jor1 = request.getParameter("txtJor");
                        String can1 = request.getParameter("txtCan");
                        String fec1 = request.getParameter("txtFec");
                        String est1 = request.getParameter("txtEst");
                        String usu1 = request.getParameter("txtUsu");
                        int idref = Integer.parseInt(request.getParameter("id"));
                        re.setJor(jor1);
                        re.setCan(can1);
                        re.setFec(fec1);
                        re.setEst(est1);
                        re.setUsu(usu1);
                        re.setId(idref);
                        rdao.actualizar(re);
                        request.getRequestDispatcher("Controlador?menu=Refrigerio&accion=Listar").forward(request, response);
                    } catch (Exception e) {

                    }
                case "Activar":
                    try {
                        int idref = Integer.parseInt(request.getParameter("id"));
                        String est1 = request.getParameter("estado");
                        re.setId(idref);
                        re.setEst(est1);
                        rdao.changeEstado(re);
                        request.getRequestDispatcher("Controlador?menu=Refrigerio&accion=Listar").forward(request, response);
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                    break;

                default:
                    throw new AssertionError();

            }
            request.getRequestDispatcher("Refrigerio.jsp").forward(request, response);
        }
        //reporte
        if (menu.equals("Reporte")) {
            switch (accion) {

                case "BuscarReporte":
                    String usu = request.getParameter("Usuario");
                    rep.setUsu(usu);
                    rep = redao.buscar(usu);
                    request.setAttribute("r", rep);
                    break;

                case "Listar":
                    List lista = redao.listar();
                    request.setAttribute("reportes", lista);
                    break;
                case "GenerarReporte":
                    rep.setUsu(rep.getUsu());
                    rep.setCur(rep.getCur());
                    rep.setEnt(rep.getEnt());
                    rep.setRef(rep.getRef());
                    redao.guardarReporte(rep);
                    request.getRequestDispatcher("Controlador?menu=Reporte&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();

            }
            request.getRequestDispatcher("Reporte.jsp").forward(request, response);
        }
              
        //Novedades        
        if (menu.equals("Novedad")) {
            switch (accion) {
                case "Listar":
                    List lista = nodao.listar();
                    request.setAttribute("novedades", lista);
                    break;
                    
                case "Agregar":
                    
                   
                   String fec = request.getParameter("txtFec");
                   String jor = request.getParameter("txtJor");
                   String usu = request.getParameter("txtUsu");
                   String noe = request.getParameter("txtCane");
                   String des = request.getParameter("txtDes");
                   String canr = request.getParameter("txtCanr");
                   String cur = request.getParameter("txtCur");
                   String ref = request.getParameter("txtCod");

                    
                    no.setFec(fec);
                    no.setJor(jor);
                    no.setUsu(usu);
                    no.setNoe(noe);
                    no.setDes(des);
                    no.setCanr(canr);                                       
                    no.setCur(cur);
                    no.setRef(ref);
                    nodao.agregar(no);
                    request.getRequestDispatcher("Controlador?menu=Novedad&accion=Listar").forward(request, response);
                    break; 
                    
                    
                 case "Editar":
                    idn = Integer.parseInt(request.getParameter("id"));
                    Novedad n = nodao.listarId(idn);
                    request.setAttribute("noved", n);
                    request.getRequestDispatcher("Controlador?menu=Novedad&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    try {
                    String fec1 = request.getParameter("txtFec");
                    String canr1 = request.getParameter("txtCanr");
                    
                    String est1 = request.getParameter("txtEst");
                    String usu1 = request.getParameter("txtUsu");
                    String cur1 = request.getParameter("txtCur");

                    int idnov = Integer.parseInt(request.getParameter("id"));
                    no.setFec(fec1);
                    no.setCanr(canr1);
                   
                    no.setUsu(usu1);
                    no.setCur(cur1);

                    no.setId(idnov);
                    nodao.actualizar(no);
                    request.getRequestDispatcher("Controlador?menu=Novedad&accion=Listar").forward(request, response);
                    } catch (Exception e){
                        
                    }  
                
                    
                default:
                    throw new AssertionError();

            }
            request.getRequestDispatcher("Novedad.jsp").forward(request, response);
        }
    }
        

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
