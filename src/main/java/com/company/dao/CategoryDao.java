/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.company.dao;

import MyEntity.Category;
import MyEntity.Product;
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
   public Category getCatogeryByProductId(int pid) 
   {
       Category cat = null;
       
       Session s=factory.openSession();
       cat=s.get(Category.class, pid);
        
        s.close();
        
        return cat;
   }

//   public Category getcategoryByProductId(int pid)
//    {
//        Session s=factory.openSession();
//        String query="from Product p where  p.category.catogeryId = :x";
//        Query q=s.createQuery(query);
//        
//         q.setParameter("x", pid);
//         List<Product> product=q.list();
//       return Category;
//        
//    }
   
   
   public boolean UpdateCategory(Category c) {
        Session s = factory.openSession();
        Category category = s.get(Category.class, c.getCatogeryId());
        category.setCatogeryTitle(c.getCatogeryTitle());
        category.setCatogeryDescription(c.getCatogeryDescription());
        Transaction tx = s.beginTransaction();
        s.update(category);
        tx.commit();
        s.close();
        return true;

    }
   public boolean deleteCategoryById(int id) {
        Session s = factory.openSession();
        Transaction tx = s.beginTransaction();
        Category c = s.get(Category.class, id);
        s.delete(c);
        tx.commit();
        s.close();
        return true;

    }
    
}
