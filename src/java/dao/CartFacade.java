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

    //todo
    public int getOrderHeaderIdByCustomerId(int customerId) throws SQLException {
        int orderHeaderId = 0;
        Connection connection = DBContext.getConnection();
        PreparedStatement ps = connection.prepareStatement("select id from orderheader where customerId = ?");
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            orderHeaderId = rs.getInt("id");
        }
        connection.close();
        return orderHeaderId;
    }

    public void addCartToOrderHeader(int customerId, String note) throws SQLException, ParseException {
        Connection con = DBContext.getConnection();
        PreparedStatement ps = con.prepareStatement("insert OrderHeader (date,customerId,note) values (?,?,?)");
        Date currentDate = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String dateString = sdf.format(currentDate);

        java.util.Date utilDate = sdf.parse(dateString);

        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(utilDate.getTime());

        ps.setTimestamp(1, sqlTimestamp);

        // truyền tham số kiểu java.sql.Timestamp
        ps.setInt(2, customerId);
        ps.setString(3, note);

        int count = ps.executeUpdate();
        con.close();
    }

    public void addCartDetail(int orderHeaderId, Item item) throws SQLException {
        Connection con = DBContext.getConnection();
        try {
            //con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement("insert OrderDetail (orderHeaderId,productId,quantity,price,discount) values (?,?,?,?,?)");
            ps.setInt(1, orderHeaderId);
            ps.setInt(2, item.getProduct().getId());
            ps.setInt(3, item.getQuantity());
            ps.setDouble(4, item.getCost());
            ps.setDouble(5, item.getProduct().getDiscount());
            int count = ps.executeUpdate();
            //con.commit();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            //con.rollback();
        }
    }

    public void addCartDetailToOrderDetail(int oderHeaderId, Cart cart) throws SQLException {
        Connection con = DBContext.getConnection();
        try {
            for (Item item : cart.getItems()) {
                addCartDetail(oderHeaderId, item);
            }
            con.commit();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            con.rollback();
        }
    }

    public void test(int customerId, String note, Cart cart) throws SQLException {
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
            ps.setTimestamp(1, sqlTimestamp);
            // truyền tham số kiểu java.sql.Timestamp
            ps.setInt(2, customerId);
            ps.setString(3, note);
            int count = ps.executeUpdate();
            //-------------------
            //Get order header id moi nhat
            PreparedStatement ps1 = con.prepareStatement("SELECT TOP 1 id\n"
                    + "FROM OrderHeader\n"
                    + "ORDER BY id DESC;");
            ResultSet rs = ps1.executeQuery();
            int idOfHeader = 0;
            while (rs.next()) {
                idOfHeader = rs.getInt("id");
            }
            //-------------------
            // Sau khi co orderheader id thi add no vao order detail
            if (idOfHeader != 0) {
                addCartDetailToOrderDetail(idOfHeader, cart);
            }
            con.commit();
            con.close();
        } catch (SQLException | ParseException ex) {
            System.out.println(ex.getMessage());
            con.rollback();
        }
    }
}
