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
import java.util.logging.Level;
import java.util.logging.Logger;

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

    public List<Product> selectTop8Newest() throws SQLException {
        List<Product> list = null;
        Connection con = DBContext.getConnection();

        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery("select top (8) * from product order by id desc");
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

    public List<Product> selectWithConditions(Object search, Object categoryId, Object sortOptions) throws SQLException {
        String sql = "select * from product where 1=1 ";

        if (search != null) {
            sql += "and [name] like N'%" + search + "%' ";
        }

        if (categoryId != null) {
            sql += "and categoryId = " + categoryId + " ";
        }

        if (sortOptions != null) {
            switch ((String) sortOptions) {
                case "newest":
                    sql += "order by id desc";
                    break;
                case "popular":
                    sql += "";
                    break;
                case "low_price":
                    sql += "order by price asc";
                    break;
                case "high_price":
                    sql += "order by price desc";
                    break;

            }
        }

        System.out.println(sql);
        List<Product> list = null;
        Connection con = DBContext.getConnection();

        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery(sql);
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
        Product product = new Product();

        Connection con = DBContext.getConnection();
        Statement stm = con.createStatement();
        PreparedStatement pstm = con.prepareStatement("select * from product where id= ?");
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));
            product.setDiscount(rs.getDouble("discount"));
            product.setCategoryId(rs.getInt("categoryId"));
        }
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

    public static void main(String[] args) {
        ProductFacade pf = new ProductFacade();
        try {
            System.out.println(pf.selectTop8Newest());
        } catch (SQLException ex) {
            Logger.getLogger(ProductFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

