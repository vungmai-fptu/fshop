/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import entities.Product;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import sessionbeans.ProductFacade;

/**
 *
 * @author SE161740 Pham Nguyen Hung Anh
 */
public class Cart {

    ProductFacade pf = lookupProductFacadeBean();
    List<Item> list = null;

    public Cart() {
        list = new ArrayList();
    }

    public void add(int id, int quantity) {
        //Tim item trong cart
        Item item = find(id);
//        Neu item chua co trong cart thi tao moi va  them vao cart
        if (item == null) {
            Product product = pf.find(id);
            item = new Item(product.getId(),
                    product.getDescription(),
                    product.getPrice(),
                    product.getDiscount(),
                    quantity);
            list.add(item);
        } else {//Neu da co item trong cart thi chi cap nhat quantity
            item.setQuantity(item.getQuantity() + quantity);

        }

    }

    public Item find(int id) {
        for (Item item : list) {
            if (item.getId() == id) {
                return item;
            }

        }
        return null;
    }

    public void delete(int id) {
        Item item = find(id);
        list.remove(item);
    }

    public void update(int id, int quantity) {
        Item item = find(id);
        item.setQuantity(quantity);
    }

    public void empty() {
        list.clear();
    }

    public List<Item> getItems() {
        return list;
    }

    public double getTotal() {
        double total = 0;
        for (Item item : list) {
            total += item.getCost();
        }
        return total;
    }

    public int getNumOfProducts() {
        return list.size();
    }

    private ProductFacade lookupProductFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProductFacade) c.lookup("java:global/FShop/ProductFacade!sessionbeans.ProductFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

}
