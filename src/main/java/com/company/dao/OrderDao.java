
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
    
    public void generateOrder(List<Order> o){
         try {
            Session session = factory.openSession();
            Transaction transaction = session.beginTransaction();

            int batchSize = 50; // Number of entities to be persisted in a batch

            for (int i = 0; i < o.size(); i++) {
                session.persist(o.get(i));

                if (i % batchSize == 0 && i > 0) {
                    session.flush();
                    session.clear();
                }
            }
            transaction.commit();
            session.close();
             } catch (Exception ex) {
                ex.printStackTrace();
            }
    }
    
   
}
