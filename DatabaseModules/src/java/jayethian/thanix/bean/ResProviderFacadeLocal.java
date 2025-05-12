package jayethian.thanix.bean;

import jakarta.ejb.Local;
import java.util.List;
import jayethian.thanix.entity.ResProvider;

/**
 *
 * @author Jayetheus
 */
@Local
public interface ResProviderFacadeLocal {

    void create(ResProvider resProvider);

    void edit(ResProvider resProvider);

    void remove(ResProvider resProvider);

    ResProvider find(Object id);

    List<ResProvider> findAll();

    List<ResProvider> findRange(int[] range);

    int count();
    
}
