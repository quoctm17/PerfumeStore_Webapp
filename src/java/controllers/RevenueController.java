/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import dao.AccountFacade;
import dao.OrderFacade;
import entity.Revenue;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Beyond Nguyen
 */
@WebServlet(name = "RevenueController", urlPatterns = {"/admin/revenue"})
public class RevenueController extends HttpServlet {

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

        String time = request.getParameter("time");
        if (AccountFacade.isLogin(request) == 1) {
            switch (action) {
                case "list":
                    request.setAttribute("time", time);
                    request.setAttribute("activeTab", "revenue");
                    request.getRequestDispatcher("/WEB-INF/layouts/admin.jsp").forward(request, response);
                    break;
                case "read":
                    try {
                        List<Revenue> list = null;
                        OrderFacade od = new OrderFacade();
                        String[] timeSelect = new String[2];

                        String _time = request.getParameter("time");
                        switch (_time) {
                            case "daily":
                                timeSelect[0] = request.getParameter("month");
                                timeSelect[1] = request.getParameter("year");
                                list = od.getRevenue("day", timeSelect);
                                break;
                            case "monthly":
                                timeSelect[0] = request.getParameter("year");
                                list = od.getRevenue("month", timeSelect);
                                break;
                            case "yearly":
                                timeSelect[0] = request.getParameter("year");
                                timeSelect[1] = request.getParameter("endYear");
                                list = od.getRevenue("year", timeSelect);
                                System.out.println(timeSelect[0]);
                                System.out.println(timeSelect[1]);
                                System.out.println(list);
                                break;
                        }

                        Gson gson = new Gson();
                        PrintWriter out = response.getWriter();
                        out.print(gson.toJson(list));
                        out.flush();
                        out.close();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    break;
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
