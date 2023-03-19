/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.HashMap;

/**
 *
 * @author Beyond Nguyen
 */
public class FullOrder {
    private OrderHeader oh;
    private HashMap<OrderDetail, String> od;

    public FullOrder() {
    }

    public FullOrder(OrderHeader oh, HashMap<OrderDetail, String> od) {
        this.oh = oh;
        this.od = od;
    }

    public OrderHeader getOh() {
        return oh;
    }

    public void setOh(OrderHeader oh) {
        this.oh = oh;
    }

    public HashMap<OrderDetail, String> getod() {
        return od;
    }

    public void setod(HashMap<OrderDetail, String> od) {
        this.od = od;
    }
    
    public double getTotal() {
        double total = 0;
        
        for (OrderDetail od : this.od.keySet()) {
            total += od.getTotal();
        }
        
        return total;
    } 
}
