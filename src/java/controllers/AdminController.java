/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import dao.AccountFacade;
import dao.CategoryFacade;
import dao.OrderDAO;
import entity.Category;
import entity.Order;
import entity.OrderDetail;
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

/**
 *
 * @author Beyond Nguyen
 */
@WebServlet(name = "AdminController", urlPatterns = {"/admin"})
public class AdminController extends HttpServlet {

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

        if (AccountFacade.isLogin(request) != 0) {
            if (AccountFacade.isLogin(request) != 3) {
                switch (action) {
                    case "dashboard":
                        request.getRequestDispatcher("/WEB-INF/layouts/admin.jsp").forward(request, response);
                        break;
                    case "revenue":
                        if (AccountFacade.isLogin(request) == 1) {

                            Object op = request.getParameter("op");

                            if (op == null) {
                                request.getRequestDispatcher("/WEB-INF/layouts/admin.jsp").forward(request, response);
                            } else {
                                switch ((String) op) {
                                    case "Show Turnover By Year":

                                        try {
                                            String year = request.getParameter("year");

                                            OrderDAO dao = new OrderDAO();
                                            List<OrderDetail> list = dao.findOrderId(year);
                                            float price = 0;

                                            if (!list.isEmpty()) {
                                                for (OrderDetail pro : list) {
                                                    price += pro.getPrice();
                                                }
                                                request.setAttribute("MESSAGE", "Turnover of " + year + " : " + price);
                                            } else {
                                                request.setAttribute("MESSAGE", "No Data of " + year);
                                            }
                                            request.setAttribute("LIST_YEAR", list);

                                        } catch (Exception e) {
                                            log("Error at EditProductController: " + e.toString());
                                        }

                                        request.getRequestDispatcher("/WEB-INF/layouts/admin.jsp").forward(request, response);
                                        break;
                                    case "Show Turnover By Date":

                                        try {
                                            String date = request.getParameter("date");
                                            int id = 0;
                                            OrderDAO dao = new OrderDAO();
                                            List<Order> _list = dao.findOrderIdBDate(date);
                                            for (Order order : _list) {
                                                id = order.getId();
                                            }
                                            float price = 0;
                                            List<OrderDetail> list = dao.getPriceByDate(id);
                                            if (!list.isEmpty()) {
                                                for (OrderDetail pro : list) {
                                                    price += pro.getPrice();
                                                }
                                                request.setAttribute("MESSAGE", "Turnover of " + date + " : " + price);
                                            } else {
                                                request.setAttribute("MESSAGE", "No Data of " + date);
                                            }
                                            request.setAttribute("LIST_DATE", list);

                                        } catch (Exception e) {
                                            log("Error at EditProductController: " + e.toString());
                                        }

                                        request.getRequestDispatcher("/WEB-INF/layouts/admin.jsp").forward(request, response);
                                        break;
                                    case "Show Turnover By Week":

                                        try {
                                            int week = Integer.parseInt(request.getParameter("week"));
                                            int year = Integer.parseInt(request.getParameter("year"));

                                            OrderDAO dao = new OrderDAO();
                                            List<OrderDetail> list = dao.findOrderIdByWeek(week, year);
                                            float price = 0;
                                            if (!list.isEmpty()) {
                                                for (OrderDetail pro : list) {
                                                    price += pro.getPrice();
                                                }
                                                request.setAttribute("MESSAGE", "Turnover of " + week + " of " + year + " : " + price);
                                            } else {
                                                request.setAttribute("MESSAGE", "No Data of " + week + " of " + year);
                                            }

                                            request.setAttribute("LIST_WEEK", list);

                                        } catch (Exception e) {
                                            log("Error at EditProductController: " + e.toString());
                                        }

                                        request.getRequestDispatcher("/WEB-INF/layouts/admin.jsp").forward(request, response);
                                        break;
                                    case "Show Turnover By Month":

                                        try {
                                            int month = Integer.parseInt(request.getParameter("month"));
                                            int year = Integer.parseInt(request.getParameter("year"));

                                            OrderDAO dao = new OrderDAO();
                                            List<OrderDetail> _list = dao.findOrderIdByMonth(month, year);
                                            float price = 0;
                                            if (!_list.isEmpty()) {
                                                for (OrderDetail pro : _list) {
                                                    price += pro.getPrice();
                                                }
                                                request.setAttribute("MESSAGE", "Turnover of " + month + " - " + year + " : " + price);
                                            } else {
                                                request.setAttribute("MESSAGE", "No Data of " + month + " - " + year);
                                            }

                                            request.setAttribute("LIST_MONTH", _list);

                                        } catch (Exception e) {
                                            log("Error at EditProductController: " + e.toString());
                                        }

                                        request.getRequestDispatcher("/WEB-INF/layouts/admin.jsp").forward(request, response);
                                        break;
                                }
                            }
                            request.getRequestDispatcher("/WEB-INF/layouts/admin.jsp").forward(request, response);
                        } else {
                            response.sendRedirect(request.getContextPath() + "/admin/dashboard.do");
                        }
                        break;
                    default:
                        request.setAttribute("controller", "error");
                        request.setAttribute("action", "error404");
                        request.getRequestDispatcher("/WEB-INF/layouts/fullscreen.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/home/index.do");
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
