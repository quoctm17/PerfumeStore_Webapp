/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Beyond Nguyen
 */
public class CustomerFacade {

    public List<Customer> selectAll() throws SQLException {
        List<Customer> list = null;
        Connection con = DBContext.getConnection();

        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery("select * from customer");
        list = new ArrayList<>();
        while (rs.next()) {
            Customer c = new Customer();
            c.setId(rs.getInt("id"));
            c.setCategory(rs.getString("category"));
            c.setDeliveryAddress(rs.getString("deliveryAddress"));
            list.add(c);
        }
        con.close();
        return list;
    }

    public void create(int id, String category, String deliveryAddress) throws SQLException {

        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("insert customer values(?, ?, ?)");
        pstm.setInt(1, id);
        pstm.setString(2, category);
        pstm.setString(3, deliveryAddress);
        int count = pstm.executeUpdate();

        con.close();
    }

    public Customer read(String id) throws SQLException {
        Customer customer = new Customer();

        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("select * from customer where id= ?");
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            customer.setId(rs.getInt("id"));
            customer.setCategory(rs.getString("category"));
            customer.setDeliveryAddress(rs.getString("deliveryAddress"));
        }
        con.close();
        return customer;
    }

    public void update(String id, String category, String deliveryAddress) throws SQLException {

        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("update customer set category = ?, deliveryAddress = ? where id = ?");
        pstm.setString(1, category);
        pstm.setString(2, deliveryAddress);
        pstm.setString(3, id);
        int count = pstm.executeUpdate();

        con.close();
    }

    public void delete(String id) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("delete from customer where id= ?");
        pstm.setString(1, id);
        int count = pstm.executeUpdate();
        con.close();
    }

    public static void main(String[] args) {
        CustomerFacade cf = new CustomerFacade();
        try {
            cf.create(3, "copper", "dasds");
            System.out.println(cf.selectAll());
        } catch (SQLException ex) {
            Logger.getLogger(CustomerFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}