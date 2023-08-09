/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.company.dao;

import MyEntity.Product;
import MyEntity.Users;
import java.util.List;
import javax.persistence.TemporalType;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class UserDao {
   private  SessionFactory factory;
   public UserDao(SessionFactory factory)
   {
       this.factory=factory;
   }
   public Users getUserByEmailPassword(String email,String password)
   {
       Users user=null;
       
        try
        {
            String query="from Users where userEmail=: e and userPassword=: p";
            Session session=this.factory.openSession();
            Query q=session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user=(Users)q.uniqueResult();
        
            session.close();
        }catch(Exception ex)
        {
            ex.printStackTrace();
        }
        return user;
       
       
   }
   public List<Users> getUserDetails()
    {
      Session s=factory.openSession();
       String query="from Users";
       Query q=s.createQuery(query);
       List<Users> list=q.list();
       return list;
       
    }
}
