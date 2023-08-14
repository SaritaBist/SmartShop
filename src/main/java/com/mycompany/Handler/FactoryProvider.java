
package com.mycompany.Handler;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


/**
 *
 * @author Sarita
 */
public class FactoryProvider {
    private static SessionFactory factory;
    public static SessionFactory getFactory()
    {
        try
        {
            if(factory==null)
            {
                factory = new Configuration().configure().buildSessionFactory();
                
           }
        
        }catch(HibernateException e)
        {
            e.printStackTrace();
        }
        return factory;
    }
    
}