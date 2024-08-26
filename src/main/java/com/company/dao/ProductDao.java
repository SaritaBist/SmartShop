package com.company.dao;

import MyEntity.Category;
import MyEntity.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean addproduct(Product p) {
        boolean result = false;
        try {
            System.out.println("product dao: " + p);
            Session s = factory.openSession();
            Transaction tx = s.beginTransaction();
            s.save(p);
            tx.commit();
            s.close();
            result = true;
        } catch (Exception ex) {
            ex.printStackTrace();
            result = false;
        }
        return result;
    }

    public List<Product> getProductDetails() {
        Session s = factory.openSession();
        String query = "from Product";
        Query q = s.createQuery(query);
//        q.setMaxResults(12);
        List<Product> list = q.list();
        return list;
    }

    public List<Product> getProductById(int cid) {
        Session s = factory.openSession();
        String query = "from Product p where  p.category.catogeryId = :x";
        Query q = s.createQuery(query);

        q.setParameter("x", cid);
        List<Product> product = q.list();
        return product;

    }

    public List<Product> getSearchProductByName(String productSearch) {
        Session s = factory.openSession();
        String query = "from Product p where  lower(p.category.catogeryTitle) like :pr or lower(p.product_name) like :pr";
        Query q = s.createQuery(query);
        String search = "%" + productSearch + "%";
        q.setParameter("pr", search);
        List<Product> product = q.list();
        return product;
    }

    public Product getProductByProductId(int pid) {
       Session s=factory.openSession();
       Product p=s.get(Product.class, pid);
        
        s.close();
        return p;
       
//     int id=Integer.parseInt(pid);
//        Session s = factory.openSession();
//        String query = "from Product where product_id = :productId"; // Replace 'productId' with the actual property name
//        Query q = s.createQuery(query);
//        q.setParameter("productId", id); // Set the value of the productId parameter
//
//        Product product = (Product) q.uniqueResult();
//        s.close(); // Close the session when done
//
//        return product;

    }

    public boolean UpdateProduct(Product p) {
        Session s = factory.openSession();
        Product product = s.get(Product.class, p.getProduct_id());
        product.setProduct_name(p.getProduct_name());
        product.setProduct_desc(p.getProduct_desc());
        product.setProduct_discount(p.getProduct_discount());
        product.setProduct_photo(p.getProduct_photo());
        product.setProduct_price(p.getProduct_price());
        product.setProduct_quantity(p.getProduct_quantity());
        product.setCategory(p.getCategory());
        Transaction tx = s.beginTransaction();
        s.update(product);
        tx.commit();
        s.close();
        return true;

    }

    public boolean deleteProductById(int id) {
        Session s = factory.openSession();
        Transaction tx = s.beginTransaction();
        Product p = s.get(Product.class, id);
        s.delete(p);
        tx.commit();
        s.close();
        return true;

    }
}
