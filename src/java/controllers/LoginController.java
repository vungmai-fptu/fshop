/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Account;
import entities.Account;
import entities.Product;
import entities.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessionbeans.AccountFacade;
import sessionbeans.ProductFacade;

/**
 *
 * @author SE161714 Ha Anh Tu
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @EJB
    private ProductFacade pf;

    @EJB
    private AccountFacade af;

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
        
        String action = request.getAttribute("action").toString();
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "signup":
                signup(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
        }
        request.getRequestDispatcher(App.LAYOUT).forward(request, response);
    }

    public Account find(String user,String password) {
        for (Account acc : af.findAll()) {
            if (acc.getUserName().equals(user)&&acc.getPassword().equals(password)) {
                return acc;
            }
        }
        return null;
    }
    
    public Account check(String user) {
        for (Account acc : af.findAll()) {
            if (acc.getUserName().equals(user)) {
                return acc;
            }
        }
        return null;
    }

    public void login(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        Account acc = find(username,pass);

        HttpSession session = request.getSession();

        if (acc == null) {
            request.setAttribute("controller", "login");
            request.setAttribute("action", "indexlogin");
            request.setAttribute("errorMessage", "Sai tên đăng nhập hoặc mật khẩu");

        } else {
            request.setAttribute("controller", "home");
            request.setAttribute("action", "index");
            List<Product> list = pf.findAll();
            //Phan Trang
            int pageSize = 6;//Kich thuoc trang                        
            session = request.getSession();

        //Xac dinh so thu tu cua trang hien tai
        Integer page = (Integer) session.getAttribute("page");
        if (page == null) {
            page = 1;
        }

        //Xac dinh tong so trang
        Integer totalPage = (Integer) session.getAttribute("totalPage");
        if (totalPage == null) {
            int count = pf.count();//Dem so luong records
            totalPage = (int) Math.ceil((double) count / pageSize);//Tinh tong so trang
        }

        String op = request.getParameter("op");
        if (op == null) {
            op = "FirstPage";
        }
        switch (op) {
            case "FirstPage":
                page = 1;
                break;
            case "PreviousPage":
                if (page > 1) {
                    page--;
                }
                break;
            case "NextPage":
                if (page < totalPage) {
                    page++;
                }
                break;
            case "LastPage":
                page = totalPage;
                break;
            case "GotoPage":
                page = Integer.parseInt(request.getParameter("gotoPage"));
                if (page <= 0) {
                    page = 1;
                } else if (page > totalPage) {
                    page = totalPage;
                }
                break;
        }

        //Lay trang du lieu duoc yeu cau
        int n1 = (page - 1) * pageSize;//Vi tri mau tin dau trang
        int n2 = n1 + pageSize - 1;//Vi tri mau tin cuoi trang
        list = pf.findRange(new int[]{n1, n2});//Doc mot trang

        //Luu thong tin vao session va request
        session.setAttribute("page", page);
        session.setAttribute("totalPage", totalPage);
            request.setAttribute("list", list);
            session.setAttribute("user", acc);
        }

    }

    public void signup(HttpServletRequest request, HttpServletResponse response) {
        int count = af.count();
        count = count + 1;

        String fullName = request.getParameter("fullname");
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String repass = request.getParameter("repassword");
        Account accCheck = check(username);
        if (pass.equals(repass) && accCheck == null) {
            Account acc = new Account(count, fullName, address, phone, email, username, pass, true, "ROLE_CUSTOMER");
            af.create(acc);

            request.setAttribute("controller", "login");
            request.setAttribute("action", "indexlogin");
            request.setAttribute("successMessage", "Bạn đã đăng kí tài khoản thành công,vui lòng đăng nhập");

        } else {
            request.setAttribute("controller", "login");
            request.setAttribute("action", "indexsignup");
            request.setAttribute("errMessage", "Vui lòng nhập lại");
        }

    }

    public void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        request.setAttribute("controller", "home");
        request.setAttribute("action", "index");
        List<Product> list = pf.findAll();
        request.setAttribute("list", list);
        session.setAttribute("user", null);
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
