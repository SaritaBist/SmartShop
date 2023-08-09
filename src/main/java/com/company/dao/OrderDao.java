
package com.company.dao;

import MyEntity.Order;
import MyEntity.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class OrderDao {
    private SessionFactory factory;

    public OrderDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean generateOrder(Order o) {
        boolean result = false;
        try {
            System.out.println("order dao: " + o);
            Session s = factory.openSession();
            Transaction tx = s.beginTransaction();
            s.save(o);
            tx.commit();
            s.close();
            result = true;
        } catch (Exception ex) {
            ex.printStackTrace();
            result = false;
        }
        return result;
    }
    
   
}
