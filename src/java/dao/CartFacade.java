/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class CartFacade {

    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

    public void addCartToOrderHeader(int customerId, String note) throws SQLException, ParseException {
//        public void createCustomerAccount(String name, String phone, String email, String address) throws SQLException {
//
//        Connection con = DBContext.getConnection();
//        PreparedStatement pstm = con.prepareStatement("insert Account (username, address, phone, email) values (?, ?, ?, ?)");
//        pstm.setString(1, name);
//        pstm.setString(2, address);
//        pstm.setString(3, phone);
//        pstm.setString(4, email);
//        int count = pstm.executeUpdate();
//
//        con.close();
//    }
        Connection con = DBContext.getConnection();
        PreparedStatement ps = con.prepareStatement("insert OrderHeader (date,customerId,note) values (?,?,?)");
        Date currentDate = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String dateString = sdf.format(currentDate);



// chuyển đổi chuỗi ngày thành kiểu java.util.Date
        java.util.Date utilDate = sdf.parse(dateString);

// chuyển đổi java.util.Date thành java.sql.Timestamp
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(utilDate.getTime());

        ps.setTimestamp(1, sqlTimestamp); // truyền tham số kiểu java.sql.Timestamp
        ps.setInt(2, customerId);
        ps.setString(3, note);

        int count = ps.executeUpdate();
        con.close();
    }
}
