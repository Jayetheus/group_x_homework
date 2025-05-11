package jayethian.thanix.bean;

import jakarta.ejb.Local;
import java.util.List;
import jayethian.thanix.entity.Residence;

/**
 *
 * @author Jayetheus
 */
@Local
public interface ResidenceFacadeLocal {

    void create(Residence residence);

    void edit(Residence residence);

    void remove(Residence residence);

    Residence find(Object id);

    List<Residence> findAll();

    List<Residence> findRange(int[] range);

    int count();

    
    
}
