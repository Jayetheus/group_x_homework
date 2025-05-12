package jayethian.thanix.bean;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.util.List;
import jayethian.thanix.entity.Residence;

/**
 *
 * @author Jayetheus
 */
@Stateless
public class ResidenceFacade extends AbstractFacade<Residence> implements ResidenceFacadeLocal {

    @PersistenceContext(unitName = "ResProviderModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ResidenceFacade() {
        super(Residence.class);
    }


    
    
}
