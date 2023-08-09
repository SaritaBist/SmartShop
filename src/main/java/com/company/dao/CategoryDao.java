/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.company.dao;

import MyEntity.Category;
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
       int id=(int) session.save(c);
       tx.commit();
       session.close();
       return id;
       
   }
   public List<Category> getCategoryDetails()
   {
       Session s=factory.openSession();
       String query="from Category";
       Query q=s.createQuery(query);
       List<Category> list=q.list();
       return list;
   }
   public Category getCatogeryById(int cid)
   {
       Session s=factory.openSession();
        Category cat=s.get(Category.class, cid);
        
        s.close();
        return cat;
   }
   
    
}
