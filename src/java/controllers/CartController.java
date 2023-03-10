/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.AccountFacade;
import dao.CartFacade;
import dao.CategoryFacade;
import dao.CustomerFacade;
import dao.ProductFacade;
import entity.Account;
import entity.Cart;
import entity.Item;
import entity.Product;
import entity.Toast;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String id = request.getParameter("id");
        //Lay gio tu session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (id == null) {
            request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
            return;
        }
        Integer quantity = null;
        ProductFacade pf = new ProductFacade();
        Product product = pf.read(id);
        Item item = new Item(product, quantity);
        //Add item vao cart
        cart.add(item);
        //Quay ve home page
        request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String id = request.getParameter("idneettoupdate");
        int quantity = Integer.parseInt(request.getParameter("newQuantity"));
        //Lay gio tu session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        ProductFacade pf = new ProductFacade();
        Product product = pf.read(id);
        Item item = new Item(product, quantity);
        //Add item vao cart
        cart.update(Integer.parseInt(id), quantity);
        System.out.println(cart);
        //Quay ve home page
        response.sendRedirect(request.getContextPath() + "/cart/index.do");
    }

//    protected void updateDataToOrderDetail(int customerId, HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException, SQLException {
//        //Lay gio tu session
//        HttpSession session = request.getSession();
//        Cart cart = (Cart) session.getAttribute("cart");
//
//        CartFacade cartFacade = new CartFacade();
//        int orderHeaderId = cartFacade.getOrderHeaderIdByCustomerId(customerId);
//        cartFacade.addCartDetailToOrderDetail(orderHeaderId, cart);
//        //Quay ve home page
//        response.sendRedirect(request.getContextPath() + "/cart/index.do");
//    }
    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String id = request.getParameter("idneedtodelete");
        //Lay gio tu session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        //Add item vao cart
        cart.delete(Integer.parseInt(id));
        //Quay ve home page
        response.sendRedirect(request.getContextPath() + "/cart/index.do");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String controller = (String) request.getAttribute("controller");
        String action = (String) request.getAttribute("action");
        ProductFacade pf = new ProductFacade();
        CategoryFacade cf = new CategoryFacade();
        List<Product> list = new ArrayList<>();

        switch (action) {
            case "index":
                try {
                    add(request, response);
                } catch (IOException | SQLException | ServletException ex) { //in thong báo loi chi tiet cho developer
                    //in thong báo loi chi tiet cho developer
                    request.setAttribute("message", ex.getMessage());
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                }
                break;
            case "checkout":

                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "order":
                try {
                    int customerId = 0;

                    String newAccount = request.getParameter("newAccount");
                    if (newAccount == null) {
                        HttpSession session = request.getSession();
                        Account acc = (Account) session.getAttribute("acc");
                        customerId = acc.getId();
                    } else if (newAccount.equalsIgnoreCase("true")) {
                        String name = request.getParameter("name");
                        String address = request.getParameter("address");
                        String deliveryAddress = request.getParameter("deliveryAddress");
                        String phone = request.getParameter("phone");
                        String email = request.getParameter("email");

                        AccountFacade af = new AccountFacade();
                        CustomerFacade cusf = new CustomerFacade();

                        af.createCustomerAccount(name, phone, email, address);
                        customerId = af.getCustomerId(email);
                        cusf.create(customerId, "Copper", deliveryAddress);
                    }
//                    At this line, you have customer id already, save product order to database here
                    String noteOfDetailHeader = request.getParameter("noteOfDetailHeader");
                    HttpSession session = request.getSession();
                    Cart cart = (Cart) session.getAttribute("cart");
                    CartFacade cartFacade = new CartFacade();
                    cartFacade.addOrder(customerId, noteOfDetailHeader, cart);
                    cart.empty();
                    session.setAttribute("cart", cart);
                    
                    Toast toast = new Toast("Order confirmed! Thank you <3", "success");
                    request.setAttribute("toast", toast);
                    request.setAttribute("controller", "home");
                    request.setAttribute("action", "index");
                    request.getRequestDispatcher("home").forward(request, response);
                } catch (IOException | SQLException ex) {
                    request.setAttribute("message", ex.getMessage());
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                }
                break;
            case "update":
                try {
                    update(request, response);
                } catch (IOException | SQLException | ServletException ex) { //in thong báo loi chi tiet cho developer
                    //in thong báo loi chi tiet cho developer
                    request.setAttribute("message", ex.getMessage());
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                }
                break;
            case "delete":
                try {
                    delete(request, response);
                } catch (IOException | SQLException | ServletException ex) { //in thong báo loi chi tiet cho developer
                    //in thong báo loi chi tiet cho developer
                    request.setAttribute("message", ex.getMessage());
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                }
                break;
            default:
                request.setAttribute("controller", "error");
                request.setAttribute("action", "error404");
                request.getRequestDispatcher("/WEB-INF/layouts/fullscreen.jsp").forward(request, response);
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
