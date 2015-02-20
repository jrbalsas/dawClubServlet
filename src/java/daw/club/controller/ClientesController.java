package daw.club.controller;

import daw.club.model.Cliente;
import daw.club.Util;
import daw.club.model.dao.ClienteDAO;
import daw.club.model.dao.ClienteDAOList;
import daw.club.model.dao.ClienteDAOJDBC;


import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
    
    @Override
    public void init() throws ServletException {
        super.init();
        //Select DAO
        clienteDAO=new ClienteDAOJDBC();
        //clienteDAO=new ClienteDAOList();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Expires","0"); //Avoid browser caching response

        String action=(request.getPathInfo()!=null?request.getPathInfo():"");
        String srvUrl=request.getContextPath()+request.getServletPath();
        RequestDispatcher rd;

        request.setAttribute("imgUrl",request.getContextPath()+"/images");
        request.setAttribute("srvUrl", srvUrl);
        if (action.equals("/visualiza")) {
            //VISUALIZA UN CLIENTE
            int id=Integer.parseInt(request.getParameter("id"));
            Cliente c = clienteDAO.buscaId(id);
            request.setAttribute("cliente", c);
            rd=request.getRequestDispatcher(srvViewPath+"/visualiza.jsp");
        } else if (action.equals("/borra")) {
            //BORRAR CLIENTE
            int id=Integer.parseInt(Util.getParam(request.getParameter("id"),"0"));
            if (id>0) clienteDAO.borra(id);
            response.sendRedirect(srvUrl);
            return;
        } else if (action.equals("/crea")) {
            //ALTA DE UN CLIENTE
            Cliente c=new Cliente();
            if (request.getParameter("enviar")!=null) {
                if (validarCliente(request,c)) {
                    clienteDAO.crea(c); //Create new client
                    //Post-sent-redirect
                    response.sendRedirect(srvUrl+"/visualiza?id="+c.getId());
                    return;
                } 
            }
            //Formulario de alta    
            request.setAttribute("cliente", c);
            rd=request.getRequestDispatcher(srvViewPath+"/crea.jsp");
        } else if (action.equals("/edita")) {
            //EDICION DE UN CLIENTE
            Cliente c;
            if (request.getParameter("enviar")!=null) {
                c=new Cliente();
                if (validarCliente(request,c)) {
                    //Guardar Cliente
                    clienteDAO.guarda(c);
                    response.sendRedirect(srvUrl);
                    return;
                }
            } else {
                //Cargar Cliente seleccionado
                int id=Integer.parseInt(Util.getParam(request.getParameter("id"),"0"));
                c=clienteDAO.buscaId(id);
            }
            //Formulario de edición
            request.setAttribute("cliente", c);
            rd=request.getRequestDispatcher(srvViewPath+"/edita.jsp");      
        }else {
            //LISTAR TODOS LOS CLIENTES
            List<Cliente> lc = clienteDAO.buscaTodos();
            request.setAttribute("clientes", lc);
            rd=request.getRequestDispatcher(srvViewPath+"/listado_jstl.jsp");
        }
        rd.forward(request, response);
    }

    /**Recopilar datos de un formulario de cliente y generar mensajes de error*/
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
            //request.setAttribute("errNombre", "errNombre");
            valido=false;
        }
        if (!dni.matches("^\\d{7,8}-?[a-zA-Z]{1}$")) {
            request.setAttribute("errDni", "DNI no válido (12345678A)");
            valido=false;
        }
        return valido;
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
        return "Customer Controller";
    }// </editor-fold>
}
