package daw.club.controller;

import daw.club.model.Cliente;
import daw.club.Util;
import daw.club.model.dao.ClienteDAO;
import daw.club.model.dao.ClienteDAOList;
import daw.club.model.dao.ClienteDAOJDBC;


import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/clientes/*")
public class ClientesController extends HttpServlet {
    
    /**View files path*/
    private final String srvViewPath="/WEB-INF/clientes";
    private ClienteDAO clienteDAO;
    private String srvUrl;
    private String imgUrl;
    private String action;

    
    @Override
    public void init(ServletConfig servletConfig ) throws ServletException {
        
        super.init(servletConfig);
        
        //Servlet and image dir URLs for views' use
        srvUrl=servletConfig.getServletContext().getContextPath()+"/clientes";
        imgUrl=servletConfig.getServletContext().getContextPath()+"/images";
        
        //Select DAO Implementation
        //clienteDAO=new ClienteDAOJDBC();
        clienteDAO=new ClienteDAOList();

    }
    
/**Common Request processing*/
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Expires","0"); //Avoid browser caching response

        request.setAttribute("imgUrl",imgUrl);
        request.setAttribute("srvUrl", srvUrl);
        
        //Detect current servlet action
        action=(request.getPathInfo()!=null?request.getPathInfo():"");
        
    }
    
    /**
     * Handles the HTTP
     * <code>GET</code> method. Select Controller Views
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
     
        RequestDispatcher rd;
        
        switch (action) {
            case "/visualiza": {    //VISUALIZA UN CLIENTE
                int id=Integer.parseInt(request.getParameter("id"));
                Cliente c = clienteDAO.buscaId(id);
                request.setAttribute("cliente", c);
                rd=request.getRequestDispatcher(srvViewPath+"/visualiza.jsp");
                break;
            }
            case "/borra":  {       //BORRAR CLIENTE
                int id=Integer.parseInt(Util.getParam(request.getParameter("id"),"0"));
                if (id>0) clienteDAO.borra(id);
                response.sendRedirect(srvUrl);
                return;
            }
            case "/crea":  {        //FORMULARIO ALTA DE  CLIENTE
                Cliente c=new Cliente();
                request.setAttribute("cliente", c);
                rd=request.getRequestDispatcher(srvViewPath+"/crea.jsp");
                break;
            }
            case "/edita": {        //FORMULARIO EDICION DE CLIENTE
                Cliente c;
                //Cargar Cliente seleccionado
                int id=Integer.parseInt(Util.getParam(request.getParameter("id"),"0"));
                c=clienteDAO.buscaId(id);
                //Formulario de edición
                request.setAttribute("cliente", c);
                rd=request.getRequestDispatcher(srvViewPath+"/edita.jsp");
                break;
            }
            default: {          //LISTAR TODOS LOS CLIENTES
                List<Cliente> lc = clienteDAO.buscaTodos();
                request.setAttribute("clientes", lc);
                rd=request.getRequestDispatcher(srvViewPath+"/listado_jstl.jsp");
                break;
            }

        }
        rd.forward(request, response);
    }
    
    /**
     * Handles the HTTP
     * <code>POST</code> method for Creating and Saving Customers
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

        switch (action) {
            case "/crea": {     //ALTA DE UN CLIENTE
                Cliente c=new Cliente();
                if (validarCliente(request,c)) {
                    clienteDAO.crea(c); //Create new client
                    //Post-sent-redirect
                    response.sendRedirect(srvUrl+"/visualiza?id="+c.getId());
                } else { //Show form with validation errores
                    request.setAttribute("cliente", c);
                    RequestDispatcher rd = request.getRequestDispatcher(srvViewPath+"/crea.jsp");
                    rd.forward(request, response);
                }
                break;
            }
            case "/edita": {    //ACTUALIZAR UN CLIENTE
                Cliente c=new Cliente();
                if (validarCliente(request,c)) {
                    //Aactualizar datos Cliente
                    clienteDAO.guarda(c);
                    response.sendRedirect(srvUrl);
                } else { //Show form with validation errores
                    request.setAttribute("cliente", c);
                    RequestDispatcher rd = request.getRequestDispatcher(srvViewPath+"/edita.jsp");
                    rd.forward(request, response);
                }
                break;
            }
            default:{ // Default POST
                response.sendRedirect(srvUrl);        
                break;
            }
        }
    }


/**Recopilar datos de un formulario de cliente y generar mensajes de error en contexto de petición*/
    private boolean validarCliente(HttpServletRequest request, Cliente c) {
        boolean valido=true;
        //Capturamos y convertimos datos
        int id=Integer.parseInt(Util.getParam(request.getParameter("id"),"0"));
        String nombre=Util.getParam(request.getParameter("nombre"),"");
        String dni=Util.getParam(request.getParameter("dni"),"");
        boolean socio=Util.getParamBool(request.getParameter("socio"));
        //Asignamos datos al bean
        c.setId(id);
        c.setNombre(nombre);
        c.setDni(dni);
        c.setSocio(socio);
        //Validamos Datos
        if (nombre.length()<3 || nombre.length()>50) {
            request.setAttribute("errNombre", "Nombre no válido");
            valido=false;
        }
        if (!dni.matches("^\\d{7,8}-?[a-zA-Z]{1}$")) {
            request.setAttribute("errDni", "DNI no válido (12345678A)");
            valido=false;
        }
        return valido;
    }

/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
    @Override
    public String getServletInfo() {
        return "Customer Controller";
    }// </editor-fold>

}
