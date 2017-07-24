import Negocio.Vehiculo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class ServletVehiculo extends HttpServlet {
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Vehiculo vehiculo=new Vehiculo();
            HttpSession sesion=request.getSession();
            if (request.getParameter("eliminar") == null) {
            
                if (request.getParameter("accion").equals("registrar")) {
                    String codigo=request.getParameter("codigo");
                    String patente=request.getParameter("patente");
                    String marca=request.getParameter("marca");
                    String modelo=request.getParameter("modelo");
                    String imagen=request.getParameter("imagen");  
                    String tipo_vehiculo_id=request.getParameter("tipo_vehiculo_id");
                    String empresa_id=request.getParameter("empresa_id");
                    String estado_id=request.getParameter("estado_id");
                    String obra_id=request.getParameter("obra_id");
                    vehiculo.setCodigo(codigo);
                    vehiculo.setPatente(patente);
                    vehiculo.setMarca(marca);
                    vehiculo.setModelo(modelo);
                    vehiculo.setImagen(imagen);
                    vehiculo.setTipo_vehiculo_id(tipo_vehiculo_id);
                    vehiculo.setEmpresa_id(empresa_id);
                    vehiculo.setEstado_id(estado_id);
                    vehiculo.setObra_id(obra_id);
                    vehiculo.save();
                    response.sendRedirect("administrador/vehiculo/vehiculo_editar.jsp");
            
                } else if (request.getParameter("accion").equals("actualizar")) {
                    String vehiculo_id=request.getParameter("vehiculo_id");
                    String codigo=request.getParameter("codigo");
                    String patente=request.getParameter("patente");
                    String marca=request.getParameter("marca");
                    String modelo=request.getParameter("modelo");
                    String imagen=request.getParameter("imagen");  
                    String tipo_vehiculo_id=request.getParameter("tipo_vehiculo_id");
                    String empresa_id=request.getParameter("empresa_id");
                    String estado_id=request.getParameter("estado_id");
                    String obra_id=request.getParameter("obra_id");
                    vehiculo.setVehiculo_id(vehiculo_id);
                    vehiculo.setCodigo(codigo);
                    vehiculo.setPatente(patente);
                    vehiculo.setMarca(marca);
                    vehiculo.setModelo(modelo);
                    vehiculo.setImagen(imagen);
                    vehiculo.setTipo_vehiculo_id(tipo_vehiculo_id);
                    vehiculo.setEmpresa_id(empresa_id);
                    vehiculo.setEstado_id(estado_id);
                    vehiculo.setObra_id(obra_id);
                    vehiculo.update();
                    response.sendRedirect("administrador/vehiculo/vehiculo_editar.jsp");
            
            } else if(request.getParameter("accion").equals("cerrar")){
                sesion.invalidate();
                response.sendRedirect("index.jsp");
            }
        } else{
                String id=request.getParameter("eliminar");
                vehiculo.setVehiculo_id(id);
                vehiculo.delete();
                response.sendRedirect("administrador/vehiculo/vehiculo_editar.jsp");
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
