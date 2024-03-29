package com.daw.club.model.dao;

import com.daw.club.model.Cliente;
import com.daw.club.model.dao.qualifiers.DAOList;
import java.util.ArrayList;
import java.util.List;
import jakarta.enterprise.context.ApplicationScoped;

/*Sample DAO implementation using an ArrayList of Objects in memory*/
@DAOList
@ApplicationScoped
public class ClienteDAOList implements ClienteDAO{

    private ArrayList<Cliente> clientes=null;
    private int idCliente = 1;

    public ClienteDAOList() {
            clientes = new ArrayList<>();

            clientes.add(new Cliente(idCliente++, "Paco López", "11111111A", false,0));
            clientes.add(new Cliente(idCliente++, "María Jiménez", "22222222B", true,1));
            clientes.add(new Cliente(idCliente++, "Carlos García", "33333333C", true,2));
    }
    
    @Override
    public Cliente buscaId(Integer id) {
        Cliente encontrado=null;
        for (Cliente c: clientes) {
               if (c.getId()==id) encontrado=c;
        }
        return encontrado;
    }
    @Override
    public List<Cliente> buscaTodos() {
        return clientes;
    }

    @Override
    public boolean crea(Cliente c) {
        Cliente nc=new Cliente(c);
        nc.setId(idCliente);
        clientes.add(nc);
        c.setId(idCliente);
        idCliente++;
        return true;
    }
        
    @Override
    public boolean guarda(Cliente c) {
        boolean result=false;
        Cliente nc=new Cliente(c);
        for (int i=0; i<clientes.size();i++) {
            if (clientes.get(i).getId()==nc.getId()) {
                clientes.set(i, nc);
                result=true;
            }
        }       
        return result;
    }
    
    @Override
    public boolean borra(Integer id) {
        boolean result=false;
        for (int i=0; i<clientes.size();i++) {
            if (clientes.get(i).getId()==id) {
                clientes.remove(i);
                result=true;
            }
        }       
        return result;
    }
    
    public int numClientes() {
        return clientes.size();
    }

}
