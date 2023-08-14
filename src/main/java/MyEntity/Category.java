/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MyEntity;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author Sarita
 */
@Entity
public class Category {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="catogery_id")
    private int catogeryId;
    @Column(name="catogery_title")
    private String catogeryTitle;
    @Column(name="catogery_description")
    private String catogeryDescription;
    
    @OneToMany(mappedBy="category")
    private List<Product> productList;

    public Category() {
    }

    public Category(int catogeryId, String catogeryTitle, String catogeryDescription, List<Product> productList) {
        this.catogeryId = catogeryId;
        this.catogeryTitle = catogeryTitle;
        this.catogeryDescription = catogeryDescription;
        this.productList = productList;
    }
    

    
    

    public int getCatogeryId() {
        return catogeryId;
    }

    public void setCatogeryId(int catogeryId) {
        this.catogeryId = catogeryId;
    }

    public String getCatogeryTitle() {
        return catogeryTitle;
    }

    public void setCatogeryTitle(String catogeryTitle) {
        this.catogeryTitle = catogeryTitle;
    }

    public String getCatogeryDescription() {
        return catogeryDescription;
    }

    public void setCatogeryDescription(String catogeryDescription) {
        this.catogeryDescription = catogeryDescription;
    }

    
    
    
}
