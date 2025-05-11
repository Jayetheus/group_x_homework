package jayethian.thanix.bean;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jayethian.thanix.entity.ResProvider;

/**
 *
 * @author Jayetheus
 */
@Stateless
public class ResProviderFacade extends AbstractFacade<ResProvider> implements ResProviderFacadeLocal {

    @PersistenceContext(unitName = "ResProviderModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ResProviderFacade() {
        super(ResProvider.class);
    }
    
}
