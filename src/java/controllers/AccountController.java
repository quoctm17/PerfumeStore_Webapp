/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.AccountFacade;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Beyond Nguyen
 */
@WebServlet(name = "AccountController", urlPatterns = {"/account"})
public class AccountController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String controller = (String) request.getAttribute("controller");
        String action = (String) request.getAttribute("action");

        switch (action) {
            case "login":
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "login_handler":
                try {
                    // Lấy dữ liệu từ client do người dùng nhập vào
                    String username = request.getParameter("user");
                    String password = request.getParameter("pass");
                    AccountFacade af = new AccountFacade();
                    // Kiểm tra trong DB
                    Account a = af.login(username, password);
                    if (a == null) {
                        request.setAttribute("message", "Wrong username or password");
                        request.setAttribute("controller", "account");
                        request.setAttribute("action", "login");
                        request.setAttribute("user", username);
                        request.setAttribute("pass", password);
                        request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("acc", a);
                        response.sendRedirect(request.getContextPath() + "/home/index.do");
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                    request.setAttribute("message", ex.getMessage());
                    request.setAttribute("controller", "error");
                    request.setAttribute("action", "error");
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                }
                break;
            case "signup": //Hiện form để nhập dữ liệu mới
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "signup_handler": // Xử lý signup form
                try {
                    // Đọc dữ liệu từ client gửi lên
                    String username = request.getParameter("user");
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String password = request.getParameter("pass");
                    String conpass = request.getParameter("conpass");
                    Account account = new Account(0, username, address, phone, email, password, 1, "");
                    if (!password.equals(conpass)) { // Confirm Password không giống với Password đã nhập

                        request.setAttribute("message", "Confirm Password must be the same as Password");
                        request.setAttribute("controller", "account");
                        request.setAttribute("action", "signup");
                        // Lưu account vào request để bảo tồn trạng thái của form
                        request.setAttribute("account", account);
                        request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                    } else {
                        AccountFacade af = new AccountFacade();
                        Account a = af.checkAccountExist(account.getUser());
                        if (a == null) {
                            // Được signup
                            af.signup(account);
                            response.sendRedirect(request.getContextPath() + "/home/index.do");
                        } else {
                            // Không được signup do đã tồn tại Username trong DB
                            request.setAttribute("message", "Username already exists. Please use a different!");
                            request.setAttribute("controller", "account");
                            request.setAttribute("action", "signup");
                            // Lưu account vào request để bảo tồn trạng thái của form
                            request.setAttribute("account", account);
                            // Chuyển về trang login cho người dùng login.jsp lại
                            request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                        }

                    }

                } catch (SQLException ex) {
                    ex.printStackTrace();
                    request.setAttribute("message", ex.getMessage());
                    request.setAttribute("controller", "error");
                    request.setAttribute("action", "error");
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                }
                break;
            case "logout":
                HttpSession session = request.getSession();
                session.removeAttribute("acc");
                response.sendRedirect(request.getContextPath() + "/home/index.do");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
