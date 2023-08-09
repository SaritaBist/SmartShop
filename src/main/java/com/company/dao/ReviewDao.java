/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.company.dao;

import MyEntity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Sarita
 */
public class ReviewDao {
    private SessionFactory factory;

    public ReviewDao(SessionFactory factory) {
        this.factory = factory;
    }
    public void AddReview() {
        
    }
}
