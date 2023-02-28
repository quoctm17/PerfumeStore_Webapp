/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.CategoryFacade;
import entity.Product;
import dao.ProductFacade;
import entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "ShopController", urlPatterns = {"/shop"})
public class ShopController extends HttpServlet {

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

        ProductFacade pf = new ProductFacade();
        CategoryFacade cf = new CategoryFacade();
        switch (action) {
            case "list":
                try {
                    List<Category> cList = cf.selectAll();
                    List<Product> productList = null;
                    List<Product> displayList = null;
                    Object search = request.getParameter("search");
                    Object categoryId = request.getParameter("category");
                    Object sortOptions = request.getParameter("sort");

                    if (search == null && categoryId == null && sortOptions == null) {
                        productList = pf.selectAll();
                    } else {
                        productList = pf.selectWithConditions(search, categoryId, sortOptions);
                    }

                    int page = 0;
                    if (request.getParameter("page") == null) {
                        page = 1;
                    } else {
                        page = Integer.parseInt(request.getParameter("page"));
                    }

                    int numOfPages = (int) Math.ceil(productList.size() / 9.0);
                    if (page < numOfPages) {
                        displayList = productList.subList(9 * (page - 1), 9 * page);
                    } else {
                        displayList = productList.subList(9 * (page - 1), productList.size());
                    }

                    request.setAttribute("sort", sortOptions);
                    request.setAttribute("cList", cList);
                    request.setAttribute("displayList", displayList);
                    request.setAttribute("numOfPages", numOfPages);
                    request.setAttribute("currentPage", page);
                    request.setAttribute("categoryId", categoryId);
                    request.setAttribute("tab", "shop");
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                } catch (SQLException ex) {
                    //Hien trang thong bao loi
                    ex.printStackTrace(); //in thong báo loi chi tiet cho developer
                    request.setAttribute("message", ex.getMessage());
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                }
                break;

            case "detail":
                try {
                    String id = request.getParameter("id");

                    Product p = null;
                    p = pf.read(id);

                    Category c = cf.read(String.valueOf(p.getCategoryId()));

                    //TODO
                    request.setAttribute("p", p);
                    request.setAttribute("category", c);
                    request.setAttribute("tab", "shop");
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                } catch (IOException | SQLException | ServletException ex) {
                    ex.printStackTrace(); //in thong báo loi chi tiet cho developer
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
