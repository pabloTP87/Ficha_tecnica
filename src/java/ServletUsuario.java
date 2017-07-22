import Negocio.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ServletUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Usuario usuario=new Usuario();
            HttpSession sesion=request.getSession();
            if(request.getParameter("accion").equals("ingresar")){
                String username=request.getParameter("username");
                String clave=request.getParameter("clave");
                usuario.setUsername(username);
                usuario.setClave(clave);
                if(usuario.validar()==1){
                    sesion.setAttribute("conectado", "true-admin");
                    response.sendRedirect("administrador/inicio.jsp");
                }
                else if(usuario.validar()==2){
                    sesion.setAttribute("conectado", "true-invitado");
                    response.sendRedirect("invitado/invitado_inicio.jsp");
                }
                else{
                    sesion.setAttribute("conectado", "false");
                    response.sendRedirect("index.jsp");
                }
            }
            else if(request.getParameter("accion").equals("registrar")){
                String nombre_usuario=request.getParameter("nombre_usuario");
                String ap_paterno=request.getParameter("ap_paterno");
                String ap_materno=request.getParameter("ap_materno");
                String rut=request.getParameter("rut");
                String username=request.getParameter("username");
                String clave=request.getParameter("clave");
                String empresa_id=request.getParameter("empresa_id");
                String privilegio_id=request.getParameter("privilegio_id");
                usuario.setNombre_usuario(nombre_usuario);
                usuario.setAp_paterno(ap_paterno);
                usuario.setAp_materno(ap_materno);
                usuario.setRut(rut);
                usuario.setUsername(username);
                usuario.setClave(clave);
                usuario.setEmpresa_id(empresa_id);
                usuario.setPrivilegio_id(privilegio_id);
                usuario.save();
                response.sendRedirect("administrador/usuario/usuario_editar.jsp");
            }
            else if(request.getParameter("accion").equals("cerrar")){
                sesion.invalidate();
                response.sendRedirect("index.jsp");
            }
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
        processRequest(request, response);
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
