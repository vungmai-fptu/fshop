/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbeans;

import entities.Product;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author SE161714 Ha Anh Tu
 */
@Stateless
public class ProductFacade extends AbstractFacade<Product> {

    @PersistenceContext(unitName = "FShopPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductFacade() {
        super(Product.class);
    }

    public List<Product> findByCategory(int id) {
        String sql = String.format("SELECT * FROM Product p WHERE p.category_id like '%%%s%%' ", id);
        Query q = em.createNativeQuery(sql, Product.class);
        return q.getResultList();
    }
    public List<Product> findProductByName(String name) {
        String sql = String.format("SELECT * FROM Product p where p.description like '%%%s%%' ", name);
        Query q = em.createNativeQuery(sql, Product.class);
        return q.getResultList();
    }
}
