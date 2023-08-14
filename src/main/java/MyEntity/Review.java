
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
public class Review {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int review_id;
    private String user_name;
    private int rating;
    private String review_text;
    private Date review_date;
    private int product_id;

    public Review() {
    }

    public Review(String user_name, int rating, String review_text, Date review_date, int product_id) {
        this.user_name = user_name;
        this.rating = rating;
        this.review_text = review_text;
        this.review_date = review_date;
        this.product_id = product_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
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

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    @Override
    public String toString() {
        return "Review{" + "user_name=" + user_name + ", rating=" + rating + ", review_text=" + review_text + ", review_date=" + review_date + ", product_id=" + product_id + '}';
    }
}
