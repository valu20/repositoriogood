import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/EnvioCorreo"})
public class EnvioCorreo extends HttpServlet {

    private String host;
    private String puerto;
    private String usuario;
    private String clave;

    public void init() {

        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        puerto = context.getInitParameter("puerto");
        usuario = context.getInitParameter("usuario");
        clave = context.getInitParameter("clave");

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

        String receptor = request.getParameter("receptor");
        String asunto = request.getParameter("asunto");
        String contenido = request.getParameter("contenido");

        String resultadoMensaje = "";

        try {
            PropiedadesCorreo.envioCorreo(host, puerto, usuario, clave, receptor, asunto, contenido);
            resultadoMensaje = "El mensaje se envió correctamente";
        } catch (Exception e) {
            e.printStackTrace();
            resultadoMensaje = "Error al enviar el correo" + e.getMessage();
            System.out.println("Error" + e.toString());
        }finally{
            request.setAttribute("Mensaje", resultadoMensaje);
            getServletContext().getRequestDispatcher("/resultado.jsp").forward(request, response);
        }

    }

}