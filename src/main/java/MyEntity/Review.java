/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MyEntity;

import java.util.Date;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Sarita
 */
@Entity
@Table(name="Product_review")
public class Review {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
   private int review_id;
   private int rating;
   private String review_text;
   private Date review_date;
   
   @ManyToOne
   private Product product;
   
    @ManyToOne
    private Users user;

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReview_text() {
        return review_text;
    }

    public void setReview_text(String review_text) {
        this.review_text = review_text;
    }

    public Date getReview_date() {
        return review_date;
    }

    public void setReview_date(Date review_date) {
        this.review_date = review_date;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Review{");
        sb.append("review_id=").append(review_id);
        sb.append(", rating=").append(rating);
        sb.append(", review_text=").append(review_text);
        sb.append(", review_date=").append(review_date);
        sb.append(", product=").append(product);
        sb.append(", user=").append(user);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 41 * hash + this.review_id;
        hash = 41 * hash + this.rating;
        hash = 41 * hash + Objects.hashCode(this.review_text);
        hash = 41 * hash + Objects.hashCode(this.review_date);
        hash = 41 * hash + Objects.hashCode(this.product);
        hash = 41 * hash + Objects.hashCode(this.user);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Review other = (Review) obj;
        if (this.review_id != other.review_id) {
            return false;
        }
        if (this.rating != other.rating) {
            return false;
        }
        if (!Objects.equals(this.review_text, other.review_text)) {
            return false;
        }
        if (!Objects.equals(this.review_date, other.review_date)) {
            return false;
        }
        if (!Objects.equals(this.product, other.product)) {
            return false;
        }
        return Objects.equals(this.user, other.user);
    }
    
    
   
}
