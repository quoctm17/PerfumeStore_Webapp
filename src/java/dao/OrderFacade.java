/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.FullOrder;
import entity.OrderDetail;
import entity.OrderHeader;
import entity.Revenue;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Beyond Nguyen
 */
public class OrderFacade {

    public List<Revenue> getRevenue(String datePart, String[] timeSelect) throws SQLException {
        List<Revenue> list = null;
        Connection con = DBContext.getConnection();
        //Tạo đối tượng PreparedStatement

        String sql = "";
        switch (datePart) {
            case "day":
                sql = String.format("select datepart(day, h.[date]) as [label], sum(d.price) as total from OrderHeader h join OrderDetail d on h.id = d.orderHeaderId where datepart(month, h.[date]) = %s and datepart(year, h.[date]) = %s group by datepart(day, h.[date])",
                        timeSelect[0], timeSelect[1]);
                break;
            case "month":
                sql = String.format("select datepart(month, h.[date]) as [label], sum(d.price) as total from OrderHeader h join OrderDetail d on h.id = d.orderHeaderId where datepart(year, h.[date]) = %s group by datepart(month, h.[date])",
                        timeSelect[0]);
                break;
            case "year":
                sql = String.format("select datepart(year, h.[date]) as [label], sum(d.price) as total from OrderHeader h join OrderDetail d on h.id = d.orderHeaderId where datepart(year, h.[date]) between %s and %s group by datepart(year, h.[date])",
                        timeSelect[0], timeSelect[1]);
                break;
        }

        Statement stm = con.createStatement();        //Thực thi lệnh sql

        ResultSet rs = stm.executeQuery(sql);
        list = new ArrayList<>();
        while (rs.next()) {
            list.add(new Revenue(rs.getString("label"), rs.getDouble("total")));
        }
        return list;
    }

    public List<OrderHeader> selectAll() throws SQLException {
        List<OrderHeader> list = null;
        Connection con = DBContext.getConnection();

        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery("select * from OrderHeader order by id desc");
        list = new ArrayList<>();
        while (rs.next()) {
            OrderHeader oh = new OrderHeader();
            oh.setId(rs.getInt("id"));
            oh.setDate(rs.getDate("date"));
            oh.setCustomerId(rs.getInt("customerid"));
            oh.setEmployeeId(rs.getInt("employeeid"));
            oh.setStatus(rs.getString("status"));
            oh.setNote(rs.getString("note"));
            list.add(oh);
        }
        con.close();
        return list;
    }
    
    public List<FullOrder> selectFullOrders(int id) throws SQLException {
        List<FullOrder> list = null;
        Connection con = DBContext.getConnection();

        PreparedStatement stm = con.prepareStatement("select * from OrderHeader where customerid = ? order by id desc");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        list = new ArrayList<>();
        while (rs.next()) {
            OrderHeader oh = new OrderHeader();
            oh.setId(rs.getInt("id"));
            oh.setDate(rs.getDate("date"));
            oh.setCustomerId(rs.getInt("customerid"));
            oh.setEmployeeId(rs.getInt("employeeid"));
            oh.setStatus(rs.getString("status"));
            oh.setNote(rs.getString("note"));
            
            HashMap<OrderDetail, String> map = this.selectOrderDetailWithName(rs.getInt("id"));
            
            FullOrder fo = new FullOrder(oh, map);
            list.add(fo);
        }
        con.close();
        return list;
    }

    public List<OrderDetail> selectOrderDetail(int id) throws SQLException {
        List<OrderDetail> list = null;
        Connection con = DBContext.getConnection();

        PreparedStatement stm = con.prepareStatement("select * from OrderDetail where orderheaderid = ? ");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        list = new ArrayList<>();
        while (rs.next()) {
            OrderDetail od = new OrderDetail();
            od.setId(rs.getInt("id"));
            od.setOrderHeaderId(rs.getInt("orderheaderid"));
            od.setProductId(rs.getInt("productid"));
            od.setQuantity(rs.getInt("quantity"));
            od.setPrice(rs.getDouble("price"));
            od.setDiscount(rs.getDouble("discount"));
            list.add(od);
        }
        con.close();
        return list;
    }

    public HashMap<OrderDetail, String> selectOrderDetailWithName(int orderHeaderId) throws SQLException {
        HashMap<OrderDetail, String> list = null;
        Connection con = DBContext.getConnection();

        PreparedStatement stm = con.prepareStatement("select o.*, p.[name]\n"
                + "from orderdetail o, product p\n"
                + "where o.orderheaderid = ? and o.productId = p.id");
        stm.setInt(1, orderHeaderId);
        ResultSet rs = stm.executeQuery();
        list = new HashMap<>();
        while (rs.next()) {
            OrderDetail od = new OrderDetail();
            od.setId(rs.getInt("id"));
            od.setOrderHeaderId(rs.getInt("orderheaderid"));
            od.setProductId(rs.getInt("productid"));
            od.setQuantity(rs.getInt("quantity"));
            od.setPrice(rs.getDouble("price"));
            od.setDiscount(rs.getDouble("discount"));
            String name = rs.getString("name");
            list.put(od, name);
        }
        con.close();
        return list;
    }
    
    

    public void updateStatus(int oId, int eId, String status) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("update orderheader set employeeid = ?, status = ? where id = ?");
        pstm.setInt(1, eId);
        pstm.setString(2, status);
        pstm.setInt(3, oId);
        int count = pstm.executeUpdate();

        con.close();
    }

    public static void main(String[] args) {
        OrderFacade od = new OrderFacade();
        String[] array = {"2013", "2023"};
        try {
            System.out.println(od.selectOrderDetail(1));
        } catch (SQLException ex) {
            Logger.getLogger(OrderFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
