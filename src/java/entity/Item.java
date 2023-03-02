/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class Item {

    private Product product;
    private Integer quantity;

    public Item(Product product, Integer quantity) {
        this.product = product;
        if (quantity == null) {
            this.quantity = 1;
        } else {
            this.quantity = quantity;
        }
    }

    public Item() {
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    public double getCost(){
        return this.quantity*this.product.getPrice();
    }

}
