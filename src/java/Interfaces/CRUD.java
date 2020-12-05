
package Interfaces;

import Modelo.Usuario;
import java.util.List;

public interface CRUD {
    public List Listar();
    public Usuario list(int id);
    public boolean add(Usuario usu);
    public boolean edit(Usuario usu);
    
    
    
}
