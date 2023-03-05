/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Order;
import entity.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    private static final String FIND_ORDER_ID = "SELECT  id FROM [PerfumeStore].[dbo].[OrderHeader] WHERE OrderHeader.date = ?";
    private static final String FIND_ORDER_ID_BY_MONTH = "SELECT OrderHeader.id , OrderDetail.price FROM [PerfumeStore].[dbo].[OrderHeader],[PerfumeStore].[dbo].[OrderDetail] WHERE MONTH(date) =? AND YEAR(date) =? AND OrderHeader.id = OrderDetail.orderHeaderId ";
    private static final String FIND_ORDER_ID_BY_WEEK = "SELECT OrderHeader.id , OrderDetail.price FROM [PerfumeStore].[dbo].[OrderHeader],[PerfumeStore].[dbo].[OrderDetail] WHERE DATEPART(WEEK, date) = ? AND YEAR(date) = ? AND OrderHeader.id = OrderDetail.orderHeaderId";

    private static final String FIND_PRICE = "SELECT price FROM [PerfumeStore].[dbo].[OrderDetail] WHERE orderHeaderId = ?";
    private static final String FIND_PRICE_BY_YEAR = "SELECT OrderHeader.id , OrderDetail.price FROM [PerfumeStore].[dbo].[OrderHeader],[PerfumeStore].[dbo].[OrderDetail] WHERE OrderHeader.date like ? AND OrderHeader.id = OrderDetail.orderHeaderId";

    public List<OrderDetail> findOrderIdByWeek(int week, int year) throws SQLException, ClassNotFoundException {
        List<OrderDetail> _list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FIND_ORDER_ID_BY_WEEK);
                ptm.setInt(1, week);
                ptm.setInt(2, year);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    float price = rs.getFloat("price");
                    _list.add(new OrderDetail(id, price));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return _list;
    }

    public List<OrderDetail> findOrderIdByMonth(int month, int year) throws SQLException, ClassNotFoundException {
        List<OrderDetail> _list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FIND_ORDER_ID_BY_MONTH);
                ptm.setInt(1, month);
                ptm.setInt(2, year);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    float price = rs.getFloat("price");
                    _list.add(new OrderDetail(id, price));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return _list;
    }

    public List<OrderDetail> findOrderId(String search) throws SQLException, ClassNotFoundException {
        List<OrderDetail> _list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FIND_PRICE_BY_YEAR);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    float price = rs.getFloat("price");
                    _list.add(new OrderDetail(id, price));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return _list;
    }

    public List<Order> findOrderIdBDate(String date) throws SQLException, ClassNotFoundException {
        List<Order> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FIND_ORDER_ID);
                ptm.setString(1, date);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    list.add(new Order(id));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<OrderDetail> getPrice(int id) throws SQLException, ClassNotFoundException {
        List<OrderDetail> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FIND_ORDER_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    float price = rs.getFloat("price");
                    list.add(new OrderDetail(id, price));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<OrderDetail> getPriceByDate(int id) throws SQLException, ClassNotFoundException {
        List<OrderDetail> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FIND_PRICE);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    float price = rs.getFloat("price");
                    list.add(new OrderDetail(id, price));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

}
