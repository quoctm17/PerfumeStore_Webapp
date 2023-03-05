/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.AccountFacade;
import entity.Account;
import entity.Toast;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String controller = (String) request.getAttribute("controller");
        String action = (String) request.getAttribute("action");
        String redirect = request.getParameter("redirect");
        switch (action) {
            case "login":
                // Hiện form để người dùng login
                // B1: Get Email, pass từ cookies
                Cookie arr[] = request.getCookies();
                if (arr != null) {
                    for (Cookie o : arr) {
                        if (o.getName().equals("cookEmail")) {
                            request.setAttribute("email", o.getValue());
                        } else if (o.getName().equals("cookPass")) {
                            request.setAttribute("pass", o.getValue());
                        }
                    }
                }
                // B2: Set Email, pass vào form login
                if (redirect != null) {
                    request.setAttribute("redirect", redirect);
                } 
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "login_handler":
                // Xử lý form đăng nhập
                login_handler(request, response);
                if (request.getAttribute("controller").equals("admin")) {
                    request.getRequestDispatcher("/WEB-INF/layouts/admin.jsp").forward(request, response);
                } else {
                    Toast toast = new Toast("Login sucessfully! Welcome back!", "success");
                    request.setAttribute("toast", toast);
                    if (redirect == null) {  // Chuyển người dùng về trang chủ nếu người login là customer
                        request.setAttribute("action", "index");
                        request.setAttribute("controller", "home");
                        request.getRequestDispatcher("/home").forward(request, response);
                    } else { // nếu cần chuyển đến trang khác
                        request.getRequestDispatcher(redirect).forward(request, response);
                    }

                }

                break;
            case "signup": //Hiện form để nhập dữ liệu mới
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "signup_handler":
                // Xử lý signup form
                signup_handler(request, response);
                if (request.getAttribute("action").equals("login_handler")) {
                    request.getRequestDispatcher("/account").forward(request, response);
                } else {
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                }
                break;
            case "logout":
                HttpSession session = request.getSession();
                session.removeAttribute("acc");

                Toast toast = new Toast("Loged out! Sign in for more experience", "info");
                request.setAttribute("action", "index");
                request.setAttribute("controller", "home");
                request.setAttribute("toast", toast);
                request.getRequestDispatcher("/home").forward(request, response);
        }

    }

    protected void login_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy dữ liệu từ client do người dùng nhập vào
            String email = request.getParameter("email");
            String password = request.getParameter("pass");
            String remember = request.getParameter("remember");
            AccountFacade af = new AccountFacade();
            // Kiểm tra trong DB
            Account a = af.login(email, password);
            if (a == null) { // Không tồn tại account trong DB
                request.setAttribute("message", "Wrong email or password");
                // Cho quay về trang login để login lại
                request.setAttribute("controller", "account");
                request.setAttribute("action", "login");
                // Bảo tồn trạng thái form login đã nhập
            } else { // Có tồn tại
                // Lưu tài khoản vào Session để duy trì trạng thái đăng nhập cho đến khi logout
                HttpSession session = request.getSession();
                session.setAttribute("acc", a);
                // Lưu vào Cookies để tạo chức năng Rememberme
                Cookie cookieEmail = new Cookie("cookEmail", email);
                Cookie cookiePass = new Cookie("cookPass", password);
                Cookie cookRemember = new Cookie("cookRem", remember);

                cookieEmail.setMaxAge(60 * 60);

                if (remember != null) {
                    cookiePass.setMaxAge(60 * 60);
                } else {
                    cookiePass.setMaxAge(0);
                }

                response.addCookie(cookieEmail);
                response.addCookie(cookiePass);
                response.addCookie(cookRemember);
                if (!"ROLE_CUSTOMER".equals(a.getRole())) { // Chuyển hướng trang nếu người đăng nhập không phải là Customer
                    request.setAttribute("action", "dashboard");
                    request.setAttribute("controller", "admin");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("message", ex.getMessage());
            request.setAttribute("controller", "error");
            request.setAttribute("action", "error");
        }
    }

    protected void signup_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
                Account a = af.checkAccountExist(account.getEmail());
                if (a == null) {
                    // Được signup
                    af.signup(account);
                    request.setAttribute("email", account.getEmail());
                    request.setAttribute("pass", account.getPass());
                    // Tiến hành đăng nhập tự động khi đã signup thành công
                    request.setAttribute("controller", "account");
                    request.setAttribute("action", "login_handler");
                } else {
                    // Không được signup do đã tồn tại Username trong DB
                    request.setAttribute("message", "Email already exists. Please use a different!");
                    // Lưu account vào request để bảo tồn trạng thái của form
                    request.setAttribute("account", account);
                    // Chuyển về trang signup để yêu cầu người dùng nhập lại thông tin
                    request.setAttribute("controller", "account");
                    request.setAttribute("action", "signup");
                }
            }
        } catch (Exception ex) { // Hiển thị lỗi
            ex.printStackTrace();
            request.setAttribute("message", ex.getMessage());
            request.setAttribute("controller", "error");
            request.setAttribute("action", "error");
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
