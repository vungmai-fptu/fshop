/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Product;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessionbeans.ProductFacade;

/**
 *
 * @author PHT
 */
@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

    @EJB
    private ProductFacade pf;

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
            case "index":
                index(request, response);
                break;
            case "search":
                search(request, response);
                break;
            case "maintenance":
                request.getRequestDispatcher("/WEB-INF/views/home/maintenance.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
        }
        request.getRequestDispatcher(App.LAYOUT).forward(request, response);
    }

    private void index(HttpServletRequest request, HttpServletResponse response) {
        int pageSize = 6;//Kich thuoc trang                        
        HttpSession session = request.getSession();

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
        List<Product> list = pf.findRange(new int[]{n1, n2});//Doc mot trang

        //Luu thong tin vao session va request
        session.setAttribute("page", page);
        session.setAttribute("totalPage", totalPage);
        request.setAttribute("list", list);
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        int pageSize = 6;
        HttpSession session = request.getSession();
        String searchText = request.getParameter("searchText");
        if (searchText == null) {
            searchText = (String) session.getAttribute("searchText");
        } else {
            session.removeAttribute("pageSearch");
            session.removeAttribute("totalPageSearch");
        }
        List<Product> list = pf.findProductByName(searchText);

        Integer page = (Integer) session.getAttribute("pageSearch");
        if (page == null) {
            page = 1;
        }

        Integer totalPage = (Integer) session.getAttribute("totalPageSearch");
        if (totalPage == null) {
            int count = list.size();
            totalPage = (int) Math.ceil((double) count / pageSize);
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

        int n1 = (page - 1) * pageSize;
        int n2 = n1 + pageSize - 1;
        try {
            list = list.subList(n1, n2 + 1);
        } catch (Exception e) {
            list = list.subList(n1, list.size());
        }

        session.setAttribute("pageSearch", page);
        session.setAttribute("totalPageSearch", totalPage);
        session.setAttribute("searchText", searchText);
        request.setAttribute("list", list);
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
