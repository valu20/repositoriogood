package Controlador;

import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Validar extends HttpServlet {

    UsuarioDAO udao = new UsuarioDAO();
    Usuario us = new Usuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Valida</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Valida at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        processRequest(request, response);
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
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("Ingresar")) {
            String user = request.getParameter("email");
            String pass = request.getParameter("password");
            us = udao.Validar(user, pass);
            String nomingr = us.getIng();
            String status = us.getEst();
            ResultSet resul = udao.buscarlo(1, us.getRol());
            String nomrol = "";
            try {
                if (resul.next()) {
                    nomrol = resul.getString(2);
                }
            } catch (SQLException ex) {
                Logger.getLogger(Validar.class.getName()).log(Level.SEVERE, null, ex);
            }
            String correoUsuario = us.getCor();
            if (correoUsuario != null) {
                request.setAttribute("usuario", us);
                request.setAttribute("rol", nomrol);
                request.setAttribute("ingresos", nomingr);
                boolean isInactivo = status.equals("Inactivo") ?true:false;
                if (isInactivo) {
                    request.setAttribute("error", "<script> alert('Señor usuario su estado en el sistema es inactivo, contactese con el administrador') </script>");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                request.getRequestDispatcher("Controlador?accion=''&&menu=index&&").forward(request, response);
                
                
            } else {
                request.setAttribute("error", "<script> alert('Usuario y/o contraseña incorrectos') </script>");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
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
