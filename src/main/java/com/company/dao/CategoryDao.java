/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.company.dao;

import MyEntity.Category;
import static java.rmi.server.LogStream.log;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Sarita
 */
public class CategoryDao {
   private SessionFactory factory;

    public CategoryDao() {
    }
   
   public CategoryDao(SessionFactory factory)
   {
       this.factory=factory;
   }
   public int addCategory(Category c) 
   {
       
      
       Session session=factory.openSession();
       Transaction tx=session.beginTransaction();
       log("in category dao");
       System.out.println("Category : " + c );
       int id=(int) session.save(c);
       tx.commit();
       session.close();
       
       return id;
       
   }
   public List<Category> getCategoryDetails() 
   {
       List<Category> list = null;
       
       Session s=factory.openSession();
       String query="from Category";
       Query q=s.createQuery(query);
       list=q.list();
       
       return list;
   }
   public Category getCatogeryById(int cid) 
   {
       Category cat = null;
       
       Session s=factory.openSession();
         cat=s.get(Category.class, cid);
        
        s.close();
        
        return cat;
   }
   
    
}
