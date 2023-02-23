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

        }
        con.close();
        return list;
    }

    public void create(Category category) throws SQLException {

        Connection con = DBContext.getConnection();
        Statement stm = con.createStatement();
        PreparedStatement pstm = con.prepareStatement("insert category values(?, ?, ?, ?, ?)");

        int count = pstm.executeUpdate();

        con.close();
    }

    public Category read(String id) throws SQLException {
        Category category = new Category();

        Connection con = DBContext.getConnection();
        Statement stm = con.createStatement();
        PreparedStatement pstm = con.prepareStatement("select * from category where id= ?");
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            category.setId(rs.getInt("id"));
            category.setName(rs.getString("name"));
        }
        con.close();
        return category;
    }

    public void update(Category category) throws SQLException {

        Connection con = DBContext.getConnection();
        Statement stm = con.createStatement();
        PreparedStatement pstm = con.prepareStatement("update category...");

        int count = pstm.executeUpdate();

        con.close();
    }

    public void delete(String id) throws SQLException {
        Connection con = DBContext.getConnection();
        Statement stm = con.createStatement();
        PreparedStatement pstm = con.prepareStatement("delete from category where id= ?");
        pstm.setString(1, id);
        int count = pstm.executeUpdate();
        con.close();
    }
}
