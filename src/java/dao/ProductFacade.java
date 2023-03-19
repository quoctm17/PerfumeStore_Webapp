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

    public List<Product> selectRelated(String id) throws SQLException {
        List<Product> list = null;
        Connection con = DBContext.getConnection();

        PreparedStatement stm = con.prepareStatement("select top(4) * from product where id != ? and categoryid = (select categoryid from product where id = ?)");
        stm.setString(1, id);
        stm.setString(2, id);
        ResultSet rs = stm.executeQuery();
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
        String sql = "select p.* from product p where 1=1 ";

        if (search != null) {
            sql += "and p.[name] like N'%" + search + "%' ";
        }

        if (categoryId != null) {
            sql += "and p.categoryId = " + categoryId + " ";
        }

        if (sortOptions != null) {
            switch ((String) sortOptions) {
                case "newest":
                    sql += "order by p.id desc";
                    break;
                case "popular":
                    int pos = sql.indexOf("where");
                    sql = sql.substring(0, pos) + ", orderdetail o " + sql.substring(pos);
                    sql += "and p.id = o.productId group by p.categoryId, p.description, p.discount, p.id, p.[name], p.price order by sum (o.quantity) desc";
                    break;
                case "low_price":
                    sql += "order by p.price asc";
                    break;
                case "high_price":
                    sql += "order by p.price desc";
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
    
    public int getLatestId() throws SQLException {
        int id = 0;
        Connection con = DBContext.getConnection();

        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery("select top(1) id from product order by id desc");
        
        if (rs.next()) {
            id = rs.getInt("id");
        }
        con.close();
        return id;
    }

    public void create(Product product) throws SQLException {

        Connection con = DBContext.getConnection();
        Statement stm = con.createStatement();
        PreparedStatement pstm = con.prepareStatement("insert product values(?, ?, ?, ?, ?)");
        pstm.setString(1, product.getName());
        pstm.setString(2, product.getDescription());
        pstm.setDouble(3, product.getPrice());
        pstm.setDouble(4, product.getDiscount());
        pstm.setInt(5, product.getCategoryId());
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
        PreparedStatement pstm = con.prepareStatement("update product set name = ?, description = ?, price = ?, discount = ?, categoryId = ? where id = ?");
        try {
            pstm.setString(1, Product.getName());
            pstm.setString(2, Product.getDescription());
            pstm.setDouble(3, Product.getPrice());
            pstm.setDouble(4, Product.getDiscount());
            pstm.setInt(5, Product.getCategoryId());
            pstm.setInt(6, Product.getId());
            int count = pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
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
            System.out.println(pf.selectRelated("1"));
        } catch (SQLException ex) {
            Logger.getLogger(ProductFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
