import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Negocio.Chofer;
import javax.servlet.http.HttpSession;

public class ServletChofer extends HttpServlet {
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Chofer chofer=new Chofer();
            HttpSession sesion=request.getSession();
            
                if (request.getParameter("accion").equals("registrar")) {
                    String nombre_chofer=request.getParameter("nombre_chofer");
                    String ap_paterno=request.getParameter("ap_paterno");
                    String ap_materno=request.getParameter("ap_materno");
                    String rut=request.getParameter("rut");
                    String empresa_id=request.getParameter("empresa_id");
                    String vehiculo_id=request.getParameter("vehiculo_id");
                    String obra_id=request.getParameter("obra_id");
                    chofer.setNombre_chofer(nombre_chofer);
                    chofer.setAp_paterno(ap_paterno);
                    chofer.setAp_materno(ap_materno);
                    chofer.setRut(rut);
                    chofer.setEmpresa_id(empresa_id);
                    chofer.setVehiculo_id(vehiculo_id);
                    chofer.setObra_id(obra_id);
                    chofer.save();
                    response.sendRedirect("administrador/chofer/chofer_editar.jsp");
            } else if(request.getParameter("accion").equals("cerrar")){
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
