/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import db.Category;
import db.CategoryFacade;
import db.Product;
import db.ProductFacade;
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
                    List<Category> cList = cf.selectAll();;
                    List<Product> productList = null;
                    List<Product> displayList = null;
                    int categoryId = 0;
                    
                    
                    if (request.getParameter("category") == null || request.getParameter("category").equals("0")) {
                        productList = pf.selectAll();
                    } else {
                        categoryId = Integer.parseInt(request.getParameter("category"));
                        productList = pf.selectWithCategory(categoryId);
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
                    
                    request.setAttribute("cList", cList);
                    request.setAttribute("displayList", displayList);
                    request.setAttribute("numOfPages", numOfPages);
                    request.setAttribute("currentPage", page);
                    request.setAttribute("categoryId", categoryId);
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
                    
                    ProductFacade pf1 = new ProductFacade();
                    p = pf1.read(id);
                    cf = new CategoryFacade();
                    
                    Category c = cf.read(String.valueOf(p.getCategoryId()));
                    String categoryName = c.getName();
                    //TODO
                    request.setAttribute("p", p);
                    request.setAttribute("categoryName", categoryName);
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
