/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import dao.AccountFacade;
import dao.OrderFacade;
import entity.Account;
import entity.OrderDetail;
import entity.OrderHeader;
import java.io.IOException;
import java.io.PrintWriter;
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
        if (AccountFacade.isLogin(request) != 0 && AccountFacade.isLogin(request) != 3) {
            switch (action) {
                case "list":
                    //Processing code here
                    try {
                        List<OrderHeader> list = of.selectAll();

                        int page = 0;
                        if (request.getParameter("page") == null) {
                            page = 1;
                        } else {
                            page = Integer.parseInt(request.getParameter("page"));
                        }

                        int numOfPages = (int) Math.ceil(list.size() / 9.0);
                        if (page < numOfPages) {
                            list = list.subList(9 * (page - 1), 9 * page);
                        } else {
                            list = list.subList(9 * (page - 1), list.size());
                        }

                        request.setAttribute("numOfPages", numOfPages);
                        request.setAttribute("currentPage", page);
                        request.setAttribute("activeTab", "order");
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
        } else {
            response.sendRedirect(request.getContextPath() + "/account/login.do");
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
