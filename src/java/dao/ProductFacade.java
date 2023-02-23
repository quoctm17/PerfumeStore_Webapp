/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Beyond Nguyen
 */
public class ProductFacade {
    public List<Product> selectAll() throws SQLException {
        List<Product> list = null;
        Connection con = DBContext.getConnection();

        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery("select * from product");
        list = new ArrayList<>();
        while (rs.next()) {
           Product p = new Product();
           p.setId(rs.getInt("id"));
           p.setName(rs.getString("name"));
           p.setDescription(rs.getString("description"));
           p.setPrice(rs.getDouble("price"));
           p.setDiscount(rs.getDouble("discount"));
           p.setCategoryId(rs.getInt("categoryId"));
           list.add(p);
        }
        con.close();
        return list;
    }

    public void create(Product product) throws SQLException {
        
        Connection con = DBContext.getConnection();
        Statement stm = con.createStatement();
        PreparedStatement pstm = con.prepareStatement("insert product values(?, ?, ?, ?, ?)");
        
        
        
        
        int count = pstm.executeUpdate();
        
        con.close();
    }

    public Product read(String id) throws SQLException {
        Product product = null;
        
        Connection con = DBContext.getConnection();
        Statement stm = con.createStatement();
        PreparedStatement pstm = con.prepareStatement("select * from product where id= ?");
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();
        
       
        
        con.close();
        
        return product;
    }
    
    public void update(Product Product) throws SQLException {
        
        Connection con = DBContext.getConnection();
        Statement stm = con.createStatement();
        PreparedStatement pstm = con.prepareStatement("update product...");
        
        
        
        
        
        int count = pstm.executeUpdate();
        
        con.close();
    }
    
        public void delete(String id) throws SQLException {
        Connection con = DBContext.getConnection();
        Statement stm = con.createStatement();
        PreparedStatement pstm = con.prepareStatement("delete from product where id= ?");
        pstm.setString(1, id);
        int count = pstm.executeUpdate();
        con.close();
    }

}
