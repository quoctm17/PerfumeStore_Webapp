/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Category;
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
public class CategoryFacade {

    public List<Category> selectAll() throws SQLException {
        List<Category> list = null;
        Connection con = DBContext.getConnection();

        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery("select * from category");
        list = new ArrayList<>();
        while (rs.next()) {
            Category c = new Category();
            c.setId(rs.getInt("id"));
            c.setName(rs.getString("name"));
            c.setDescription(rs.getString("description"));
            list.add(c);
        }
        con.close();
        return list;
    }

    public void create(String name, String description) throws SQLException {

        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("insert category values(?, ?)");
        pstm.setString(1, name);
        pstm.setString(2, description);
        int count = pstm.executeUpdate();

        con.close();
    }

    public Category read(String id) throws SQLException {
        Category category = new Category();

        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("select * from category where id= ?");
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            category.setId(rs.getInt("id"));
            category.setName(rs.getString("name"));
            category.setDescription(rs.getString("description"));
        }
        con.close();
        return category;
    }

    public void update(String id, String name, String description) throws SQLException {

        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("update category set name = ?, description = ? where id = ?");
        pstm.setString(1, name);
        pstm.setString(2, description);
        pstm.setString(3, id);
        int count = pstm.executeUpdate();

        con.close();
    }

    public void delete(String id) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("delete from category where id= ?");
        pstm.setString(1, id);
        int count = pstm.executeUpdate();
        con.close();
    }

    public static void main(String[] args) {
        CategoryFacade cf = new CategoryFacade();
        try {
            System.out.println(cf.selectAll());
        } catch (SQLException ex) {
            Logger.getLogger(CategoryFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
