/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MyEntity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity
public class Product {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int product_id;
    private String product_name;
    private String product_desc;
    private String product_photo;
    private double product_price;
    private int product_discount;
     private int product_quantity;
     
    @ManyToOne
    private Category category;
    
   
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
    private Set<Review> reviews=new HashSet<>();

    public Product() {
    }

    public Product(String product_name, String product_desc, String product_photo, double product_price, int product_discount, int product_quantity, Category category) {
        this.product_name = product_name;
        this.product_desc = product_desc;
        this.product_photo = product_photo;
        this.product_price = product_price;
        this.product_discount = product_discount;
        this.product_quantity = product_quantity;
        this.category = category;
    }

   

    

    

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_desc() {
        return product_desc;
    }

    public void setProduct_desc(String product_desc) {
        this.product_desc = product_desc;
    }

    public String getProduct_photo() {
        return product_photo;
    }

    public void setProduct_photo(String product_photo) {
        this.product_photo = product_photo;
    }

    public double getProduct_price() {
        return product_price;
    }

    public void setProduct_price(double product_price) {
        this.product_price = product_price;
    }

    public int getProduct_discount() {
        return product_discount;
    }

    public void setProduct_discount(int product_discount) {
        this.product_discount = product_discount;
    }

    public int getProduct_quantity() {
        return product_quantity;
    }

    public void setProduct_quantity(int product_quantity) {
        this.product_quantity = product_quantity;
    }

   

   

    

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Product{");
        sb.append("product_id=").append(product_id);
        sb.append(", product_name=").append(product_name);
        sb.append(", product_desc=").append(product_desc);
        sb.append(", product_photo=").append(product_photo);
        sb.append(", product_price=").append(product_price);
        sb.append(", product_discount=").append(product_discount);
        sb.append(", product_quantity=").append(product_quantity);
        sb.append(", category=").append(category);
        sb.append(", reviews=").append(reviews);
        sb.append('}');
        return sb.toString();
    }

    
    
    
    public int getPriceAfterDiscount()
    {
        int d=(int)((this.getProduct_discount()/100.0)*this.getProduct_price());
        return (int) (this.getProduct_price()-d);
    }

    public Set<Review> getReviews() {
        return reviews;
    }

    public void setReviews(Set<Review> reviews) {
        this.reviews = reviews;
    }
    
    
    
    
}
