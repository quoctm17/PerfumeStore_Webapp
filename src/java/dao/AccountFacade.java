package dao;

import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AccountFacade {

    public Account login(String email, String pass) throws SQLException {
        Connection con = DBContext.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select * from account where [email]=? and password=?");
        stm.setString(1, email);
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

    public Account checkAccountExist(String email) throws SQLException {
        Connection con = DBContext.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select * from account where [email]=?");
        stm.setString(1, email);
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

    public void signup(Account account) throws SQLException {
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

    public static int isLogin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("acc") != null) {
            Account a = (Account) session.getAttribute("acc");
            if (a.getRole().equals("ROLE_ADMIN") ) {
                return 1;
            } else if (a.getRole().equals("ROLE_EMPLOYEE")) {
                return 2;
            } else {
                return 3;
            }
        } else {
            return 0;
        }
    }
}
