/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.company.dao;

import MyEntity.Product;
import MyEntity.Review;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Sarita
 */
public class ReviewDao {
    private SessionFactory factory;

    public ReviewDao(SessionFactory factory) {
        this.factory = factory;
    }
    public boolean AddReview(Review r) {
        boolean result = false;
        try {
            System.out.println("Review dao: " + r);
            Session s = factory.openSession();
            Transaction tx = s.beginTransaction();
            s.save(r);
            tx.commit();
            s.close();
            result = true;
        } catch (Exception ex) {
            ex.printStackTrace();
            result = false;
        }
        return result;
    }
    
    public List<Review> getReviewByProductId(int product_id)
    {
        Session s=factory.openSession();
        String query="from Review r where  r.product_id = :x ORDER BY review_id DESC";
        Query q=s.createQuery(query);  
        q.setParameter("x", product_id);
        List<Review> reviews=q.list();
        return reviews;     
    }
}
