/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import dao.CategoryFacade;
import dao.OrderFacade;
import dao.ProductFacade;
import entity.Account;
import entity.Category;
import entity.OrderDetail;
import entity.OrderHeader;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "OrdersController", urlPatterns = {"/admin/orders"})
public class OrdersController extends HttpServlet {

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

        OrderFacade of = new OrderFacade();
        HttpSession session = request.getSession();
        switch (action) {
            case "list":
                //Processing code here
                try {
                    List<OrderHeader> list = of.selectAll();
                    request.setAttribute("list", list);
                    request.getRequestDispatcher("/WEB-INF/layouts/admin.jsp").forward(request, response);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case "accept":
                try {
                    int orderId = Integer.parseInt(request.getParameter("id"));
                    int empId = ((Account) session.getAttribute("acc")).getId();
                    of.updateStatus(orderId, empId, "Completed");
                } catch (Exception ex) {
                    ex.printStackTrace();
                } 
                break;
            case "reject":
                try {
                    int orderId = Integer.parseInt(request.getParameter("id"));
                    int empId = ((Account) session.getAttribute("acc")).getId();
                    of.updateStatus(orderId, empId, "Failed");
                } catch (Exception ex) {
                    ex.printStackTrace();
                } 
                break;
            case "read":
                try {
                    int orderId = Integer.parseInt(request.getParameter("id"));
                    List<OrderDetail> listDetail = of.selectOrderDetail(orderId);
                    
                    Gson gson = new Gson();
                    PrintWriter out = response.getWriter();
                    out.print(gson.toJson(listDetail));
                    out.flush();
                    out.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                } 
                break;
            default:
                //Show error page
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
