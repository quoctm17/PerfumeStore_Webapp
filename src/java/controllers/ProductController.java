/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import dao.AccountFacade;
import dao.CategoryFacade;
import dao.ProductFacade;
import entity.Category;
import entity.Product;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Beyond Nguyen
 */
@WebServlet(name = "ProductController", urlPatterns = {"/admin/product"})
@MultipartConfig
public class ProductController extends HttpServlet {

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

        ProductFacade p = new ProductFacade();
        CategoryFacade cf = new CategoryFacade();
        if (AccountFacade.isLogin(request) != 0 && AccountFacade.isLogin(request) != 3) {
            switch (action) {
                case "list":
                    try {
                        List<Category> clist = cf.selectAll();
                        List<Product> list = p.selectAll();

                        int page = 0;
                        if (request.getParameter("page") == null) {
                            page = 1;
                        } else {
                            page = Integer.parseInt(request.getParameter("page"));
                        }

                        int numOfPages = (int) Math.ceil(list.size() / 5.0);
                        if (page < numOfPages) {
                            list = list.subList(5 * (page - 1), 5 * page);
                        } else {
                            list = list.subList(5 * (page - 1), list.size());
                        }

                        request.setAttribute("numOfPages", numOfPages);
                        request.setAttribute("currentPage", page);
                        request.setAttribute("LIST_CATEGORY", clist);
                        request.setAttribute("LIST_ALL_PRODUCTS", list);
                        request.setAttribute("activeTab", "product");
                        request.getRequestDispatcher("/WEB-INF/layouts/admin.jsp").forward(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    break;
                case "create":
                    try {

                        HashMap<String, String> map = new HashMap<>();
                        HashMap<Part, String> fileMap = new HashMap<>();
                        for (Part part : request.getParts()) {
                            String partName = part.getName();
                            if (!partName.startsWith("pImg-")) {
                                String partValue = convertISToString(part.getInputStream());
                                map.put(partName, partValue);
                            } else {
                                if (part.getContentType().startsWith("image/")) {
                                    String imgPos = partName.split("-")[1];
                                    fileMap.put(part, imgPos);
                                }
                            }
                        }

                        String name = map.get("name");
                        String description = map.get("description");
                        Double price = Double.parseDouble(map.get("price"));
                        Double discount = Double.parseDouble(map.get("discount"));
                        int categoryId = Integer.parseInt(map.get("categoryId"));
                        Product pro = new Product(1, name, description, price, discount, categoryId);
                        p.create(pro);

                        int id = p.getLatestId();

                        for (Part part : fileMap.keySet()) {
                            String newFileName = "product-" + id + "_" + fileMap.get(part) + ".jpg";
                            String savePath = getServletContext().getRealPath("/assets/img/product/" + File.separator + newFileName);
                            savePath = savePath.replace("\\build", "");
                            part.write(savePath);
                        }

                        response.sendRedirect(request.getContextPath() + "/admin/product/list.do");
                    } catch (SQLException ex) {
                        Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                case "read":
                    try {
                        String id = request.getParameter("id");
                        Product cate = p.read(id);

                        Gson gson = new Gson();
                        PrintWriter out = response.getWriter();
                        out.print(gson.toJson(cate));
                        out.flush();
                        out.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                case "update":
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));

                        HashMap<String, String> map = new HashMap<>();
                        for (Part part : request.getParts()) {
                            String partName = part.getName();
                            if (!partName.startsWith("pImg-")) {
                                String partValue = convertISToString(part.getInputStream());
                                map.put(partName, partValue);
                            } else {
                                if (part.getContentType().startsWith("image/")) {
                                    String imgPos = partName.split("-")[1];
                                    String newFileName = "product-" + id + "_" + imgPos + ".jpg";
                                    String savePath = getServletContext().getRealPath("/assets/img/product/" + File.separator + newFileName);
                                    savePath = savePath.replace("\\build", "");
                                    part.write(savePath);
                                }
                            }
                        }

                        String name = request.getParameter("name");
                        String description = request.getParameter("description");
                        Double price = Double.valueOf(request.getParameter("price"));
                        Double discount = Double.valueOf(request.getParameter("discount"));
                        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                        Product pro = new Product(id, name, description, price, discount, categoryId);
                        p.update(pro);
                        response.sendRedirect(request.getContextPath() + "/admin/product/list.do");
                    } catch (SQLException ex) {
                        Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                case "delete":
                    try {
                        String id = request.getParameter("id");
                        p.delete(id);
                        response.sendRedirect(request.getContextPath() + "/admin/product/list.do");
                    } catch (SQLException ex) {
                        Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
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

    public String convertISToString(InputStream is) throws IOException {
        int bufferSize = 1024;
        char[] buffer = new char[bufferSize];
        StringBuilder out = new StringBuilder();
        Reader in = new InputStreamReader(is, StandardCharsets.UTF_8);
        for (int numRead; (numRead = in.read(buffer, 0, buffer.length)) > 0;) {
            out.append(buffer, 0, numRead);
        }
        return out.toString();
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
