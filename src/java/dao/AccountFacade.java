package dao;

import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AccountFacade {

    public Account login(String user, String pass) throws SQLException {
        Connection con = DBContext.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select * from account where [username]=? and password=?");
        stm.setString(1, user);
        stm.setString(2, pass);
        //Thực thi lệnh sql
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            return new Account(rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("address"),
                    rs.getString("phone"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getInt("enabled"),
                    rs.getString("role"));
        }
        return null;
    }
    
     public Account checkAccountExist(String user) throws SQLException {
        Connection con = DBContext.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select * from account where [username]=?");
        stm.setString(1, user);
        //Thực thi lệnh sql
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            return new Account(rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("address"),
                    rs.getString("phone"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getInt("enabled"),
                    rs.getString("role"));
        }
        return null;
    }
    
    public void signup(Account account) throws SQLException{
        Connection con = DBContext.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("Insert account ([username], [address], [phone], [email], [password]) values (?, ?, ?, ?, ? )");
        stm.setString(1, account.getUser());
        stm.setString(2, account.getAddress());
        stm.setString(3, account.getPhone());
        stm.setString(4, account.getEmail());
        stm.setString(5, account.getPass());
        //Thực thi lệnh sql
        int count = stm.executeUpdate();
        //Đóng kết nối
        con.close();
    }
}
