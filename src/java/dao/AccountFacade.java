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
            a.setEnabled(rs.getBoolean("enabled"));
            a.setRole(rs.getString("role"));
            list.add(a);
        }
        con.close();
        return list;
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
                    rs.getBoolean("enabled"),
                    rs.getString("role"));
        }
        return null;
    }

    public int createCustomerAccount(String name, String phone, String email, String address) throws SQLException {
        int insertedId = -1;

        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("insert Account (username, address, phone, email) values (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
        pstm.setString(1, name);
        pstm.setString(2, address);
        pstm.setString(3, phone);
        pstm.setString(4, email);
        int count = pstm.executeUpdate();

        if (count == 0) {
            throw new SQLException("Creating account failed, no rows affected.");
        }

        try (ResultSet generatedKeys = pstm.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                insertedId = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Creating user failed, no ID obtained.");
            }
        }

        con.close();
        return insertedId;
    }

    public void updateNonSecurityInfo(String id, String name, String phone, String email, String address, boolean enabled) throws SQLException {

        Connection con = DBContext.getConnection();
        PreparedStatement pstm = con.prepareStatement("update account set [username] = ?, phone = ?, email = ?, address = ?, enabled = 1  where id = ?");
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
        PreparedStatement pstm = con.prepareStatement("update account set enabled = 0 where id= ?");
        pstm.setString(1, id);
        int count = pstm.executeUpdate();
        con.close();
    }

    public Account login(String email, String pass) throws SQLException, NoSuchAlgorithmException {
        Connection con = DBContext.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select * from account where [email]=? and password=? and enabled = 1");
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
                    rs.getBoolean("enabled"),
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
                    rs.getBoolean("enabled"),
                    rs.getString("role"));
        }
        return null;
    }

    public int signup(Account account) throws SQLException, NoSuchAlgorithmException {
        int id = -1;
        Connection con = DBContext.getConnection();
        try {
            con.setAutoCommit(false);
            //Tạo đối tượng PreparedStatement
            PreparedStatement stm = con.prepareStatement("Insert account ([username], [address], [phone], [email], [password]) values (?, ?, ?, ?, ? )", Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, account.getUser());
            stm.setString(2, account.getAddress());
            stm.setString(3, account.getPhone());
            stm.setString(4, account.getEmail());
            stm.setString(5, hash(account.getPass()));
            //Thực thi lệnh sql
            int count = stm.executeUpdate();

            try (ResultSet rs = stm.getGeneratedKeys()) {
                while (rs.next()) {
                    id = rs.getInt(1);
                }
            }

            stm = con.prepareStatement("Insert customer ([id], [category], [deliveryAddress]) values (?, ?, ?)");
            stm.setInt(1, id);
            stm.setString(2, "Copper");
            stm.setString(3, account.getAddress());
            count = stm.executeUpdate();

            con.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            con.rollback();
            throw new SQLException(ex.getMessage());
        } finally {
            con.close();
            return id;
        }
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
