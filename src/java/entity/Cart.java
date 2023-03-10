/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Collection;
import java.util.HashMap;

/**
 *
 * @author Admin
 */
public class Cart {

    private HashMap<Integer, Item> map;

    public Cart() {
        map = new HashMap<>();
    }
    //da them property items
    public Collection<Item> getItems() {
        return map.values();
    }
    public int getCount(){
        int count = 0;
        for (Item item : map.values()) {
            count = count + item.getQuantity();
        }
        return count;
    }
    public void add(Item item) {
        int id = item.getProduct().getId();
        if (map.containsKey(id)) {
            //Neu da co thi cap nhat Quantity
            Item oldItem = map.get(id);
            oldItem.setQuantity(oldItem.getQuantity() + item.getQuantity());
        } else {
            //chua co thi tao moi
            map.put(id, item);
        }
    }
    public double getTotalCart(){
        double total = 0;
        for (Item item : map.values()) {
            total += item.getCost();
        }
        return total;
    }

    public void update(int id, int quantity) {
        Item item = map.get(id);
        item.setQuantity(quantity);
    }

    public void delete(int id) {
        map.remove(id);
    }

    public void empty() {
        map.clear();
    }

}
