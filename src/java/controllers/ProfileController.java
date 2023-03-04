package controllers;

import dao.AccountFacade;
import dao.CustomerFacade;
import entity.Account;
import entity.Customer;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Beyond Nguyen
 */
@WebServlet(name = "ProfileController", urlPatterns = {"/profile"})
@MultipartConfig
public class ProfileController extends HttpServlet {

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

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        String id = Integer.toString(acc.getId());
        AccountFacade af = new AccountFacade();
        CustomerFacade cf = new CustomerFacade();
        switch (action) {
            case "info":
                try {

                    Customer cus;
                    cus = cf.read(id);

                    request.setAttribute("cus", cus);
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "updateInfo": {
                try {

                    HashMap<String, String> map = new HashMap<>();
                    for (Part part : request.getParts()) {
                        String partName = part.getName();
                        if (!partName.equals("avatar")) {
                            String partValue = convertISToString(part.getInputStream());
                            map.put(partName, partValue);
                        } else {
                            if (part.getContentType().startsWith("image/")) {
                                String newFileName = "avatar-" + id + ".jpg";
                                String savePath = getServletContext().getRealPath("/assets/img/account/" + File.separator + newFileName);
                                savePath = savePath.replace("\\build", "");
                                part.write(savePath);
                            }
                        }
                    }

                    af.updateNonSecurityInfo(id, map.get("username"), map.get("phone"), map.get("email"), map.get("address"));
                    cf.update(id, cf.read(id).getCategory(), map.get("deliveryAddress"));

                    response.sendRedirect(request.getContextPath() + "/profile/info.do");
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            break;
            case "security":

                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "updatePass":
                try {
                    String password = request.getParameter("password");
                    String newPassword = request.getParameter("newPassword");
                    String confirmPassword = request.getParameter("confirmPassword");

                    if (!newPassword.equals(confirmPassword)) {
                        response.sendRedirect(request.getContextPath() + "/profile/security.do");
                    } else {
                        af.updateSecurityInfo(newPassword, id);
                    }
                    response.sendRedirect(request.getContextPath() + "/profile/security.do");
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
