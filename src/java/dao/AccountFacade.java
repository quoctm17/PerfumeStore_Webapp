package dao;

import entity.Account;
import entity.Category;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AccountFacade {

    public List<Account> selectCustomerAccounts() throws SQLException {
        List<Account> list = null;
        Connection con = DBContext.getConnection();

        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery("select * from account where role like 'ROLE_CUSTOMER'");
        list = new ArrayList<>();
        while (rs.next()) {
            Account a = new Account();
            a.setId(rs.getInt("id"));
            a.setUser(rs.getString("username"));
            a.setAddress(rs.getString("address"));
            a.setPhone(rs.getString("phone"));
            a.setEmail(rs.getString("email"));
            a.setPass(rs.getString("password"));
            a.setIsEnabled(rs.getInt("enabled"));
            a.setRole(rs.getString("role"));
            list.add(a);
        }
        con.close();
        return list;
    }

    public int getCustomerId(String email) throws SQLException {
        Connection con = DBContext.getConnection();

        PreparedStatement stm = con.prepareStatement("select id from account where [email]=?");
        stm.setString(1, email);
        //Thực thi lệnh sql
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt("id");
        }
        return -1;
    }

    public Account getAnAccount(String id) throws SQLException {
        Connection con = DBContext.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select * from account where id=?");
        stm.setString(1, id);
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

    public void createCustomerAccount(String name, String phone, String email, String address) throws SQLException {

        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("insert Account (username, address, phone, email) values (?, ?, ?, ?)");
        pstm.setString(1, name);
        pstm.setString(2, address);
        pstm.setString(3, phone);
        pstm.setString(4, email);
        int count = pstm.executeUpdate();

        con.close();
    }

    public void updateNonSecurityInfo(String id, String name, String phone, String email, String address) throws SQLException {

        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("update account set [username] = ?, phone = ?, email = ?, address = ?  where id = ?");
        pstm.setString(1, name);
        pstm.setString(2, phone);
        pstm.setString(3, email);
        pstm.setString(4, address);
        pstm.setString(5, id);
        int count = pstm.executeUpdate();

        con.close();
    }
    
    public int updateSecurityInfo(String password, String id) throws SQLException, NoSuchAlgorithmException {

        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("update account set password = ?  where id = ?");
        pstm.setString(1, hash(password));
        pstm.setString(2, id);
        int count = pstm.executeUpdate();

        con.close();
        return count;
    }

    public void delete(String id) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("delete from account where id= ?");
        pstm.setString(1, id);
        int count = pstm.executeUpdate();
        con.close();
    }

    public Account login(String email, String pass) throws SQLException, NoSuchAlgorithmException {
        Connection con = DBContext.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select * from account where [email]=? and password=?");
        stm.setString(1, email);
        stm.setString(2, hash(pass));
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

    public void signup(Account account) throws SQLException, NoSuchAlgorithmException {
        Connection con = DBContext.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("Insert account ([username], [address], [phone], [email], [password]) values (?, ?, ?, ?, ? )");
        stm.setString(1, account.getUser());
        stm.setString(2, account.getAddress());
        stm.setString(3, account.getPhone());
        stm.setString(4, account.getEmail());
        stm.setString(5, hash(account.getPass()));
        //Thực thi lệnh sql
        int count = stm.executeUpdate();
        //Đóng kết nối
        con.close();
    }

    public static int isLogin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("acc") != null) {
            Account a = (Account) session.getAttribute("acc");
            if (a.getRole().equals("ROLE_ADMIN")) {
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

    public static String hash(String password) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hashedPassword = digest.digest(password.getBytes(StandardCharsets.UTF_8));
        StringBuilder sb = new StringBuilder();
        for (byte b : hashedPassword) {
            sb.append(String.format("%02X", b));
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        AccountFacade af = new AccountFacade();
        try {
            System.out.println(af.updateSecurityInfo("c11", "5"));
        } catch (Exception ex) {
            Logger.getLogger(AccountFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
