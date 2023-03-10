/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Cart;
import entity.Item;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class CartFacade {

    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

    public void addCartDetail(int orderHeaderId, Item item, Connection con) throws SQLException {
        PreparedStatement ps = con.prepareStatement("insert OrderDetail (orderHeaderId,productId,quantity,price,discount) values (?,?,?,?,?)");
        ps.setInt(1, orderHeaderId);
        ps.setInt(2, item.getProduct().getId());
        ps.setInt(3, item.getQuantity());
        ps.setDouble(4, item.getCost());
        ps.setDouble(5, item.getProduct().getDiscount());
        int count = ps.executeUpdate();
        ps.close();
    }

    public void addOrder(int customerId, String note, Cart cart) throws SQLException {
        Connection con = DBContext.getConnection();
        try {

            con.setAutoCommit(false);
            // Input order header
            PreparedStatement ps = con.prepareStatement("insert OrderHeader (date,customerId,note) values (?,?,?)");
            Date currentDate = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

            String dateString = sdf.format(currentDate);
            java.util.Date utilDate = sdf.parse(dateString);
            java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(utilDate.getTime());
            // truyền tham số kiểu java.sql.Timestamp
            ps.setTimestamp(1, sqlTimestamp);
            ps.setInt(2, customerId);
            ps.setString(3, note);
            int count = ps.executeUpdate();
            ps.close();

            //-------------------
            //Get order header id moi nhat
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("SELECT TOP(1) id\n"
                    + "FROM OrderHeader\n"
                    + "ORDER BY id DESC;");
            int idOfHeader = 0;
            while (rs.next()) {
                idOfHeader = rs.getInt("id");
            }
            rs.close();
            stm.close();
            //-------------------
            // Sau khi co orderheader id thi add no vao order detail
            if (idOfHeader != 0) {
                for (Item item : cart.getItems()) {
                    addCartDetail(idOfHeader, item, con);
                }
            }
            con.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            con.rollback();
            throw new SQLException(ex.getMessage());
        } finally {
            con.close();
        }
    }
}
