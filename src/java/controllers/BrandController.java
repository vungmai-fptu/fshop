/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessionbeans.ProductFacade;

/**
 *
 * @author SE161785 Nguyen Tho Nguyen
 */
@WebServlet(name = "BrandController", urlPatterns = {"/brand"})
public class BrandController extends HttpServlet {

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
            case "apple":
                apple(request, response);
                break;
            case "samsung":
                samsung(request, response);
                break;
            case "oppo":
                oppo(request, response);
                break;
            case "nokia":
                nokia(request, response);
                break;
            default:
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
        }
        request.getRequestDispatcher(App.LAYOUT).forward(request, response);
    }

    private void apple(HttpServletRequest request, HttpServletResponse response) {
        int pageSize = 6;//Kich thuoc trang
        int categoryId = 1;
        HttpSession session = request.getSession();
        List<Product> list = pf.findByCategory(categoryId);//Doc mot trang

        //Xac dinh so thu tu cua trang hien tai
        Integer page = (Integer) session.getAttribute("pageApple");
        if (page == null) {
            page = 1;
        }

        //Xac dinh tong so trang
        Integer totalPage = (Integer) session.getAttribute("totalPageApple");
        if (totalPage == null) {
            int count = list.size();//Dem so luong records
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
        try {
            list = list.subList(n1, n2 + 1);
        } catch (Exception e) {
            list = list.subList(n1, list.size());
        }
        //Luu thong tin vao session va request
        session.setAttribute("pageApple", page);
        session.setAttribute("totalPageApple", totalPage);
        request.setAttribute("list", list);
    }

    private void samsung(HttpServletRequest request, HttpServletResponse response) {
        int pageSize = 6;//Kich thuoc trang
        int categoryId = 2;
        HttpSession session = request.getSession();
        List<Product> list = pf.findByCategory(categoryId);//Doc mot trang

        //Xac dinh so thu tu cua trang hien tai
        Integer page = (Integer) session.getAttribute("pageSamsung");
        if (page == null) {
            page = 1;
        }

        //Xac dinh tong so trang
        Integer totalPage = (Integer) session.getAttribute("totalPageSamsung");
        if (totalPage == null) {
            int count = list.size();//Dem so luong records
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
        try {
            list = list.subList(n1, n2 + 1);
        } catch (Exception e) {
            list = list.subList(n1, list.size());
        }
        //Luu thong tin vao session va request
        session.setAttribute("pageSamsung", page);
        session.setAttribute("totalPageSamsung", totalPage);
        request.setAttribute("list", list);
    }

    private void oppo(HttpServletRequest request, HttpServletResponse response) {
        int pageSize = 6;//Kich thuoc trang
        int categoryId = 3;
        HttpSession session = request.getSession();
        List<Product> list = pf.findByCategory(categoryId);//Doc mot trang

        //Xac dinh so thu tu cua trang hien tai
        Integer page = (Integer) session.getAttribute("pageOppo");
        if (page == null) {
            page = 1;
        }

        //Xac dinh tong so trang
        Integer totalPage = (Integer) session.getAttribute("totalPageOppo");
        if (totalPage == null) {
            int count = list.size();//Dem so luong records
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
        try {
            list = list.subList(n1, n2 + 1);
        } catch (Exception e) {
            list = list.subList(n1, list.size());
        }
        //Luu thong tin vao session va request
        session.setAttribute("pageOppo", page);
        session.setAttribute("totalPageOppo", totalPage);
        request.setAttribute("list", list);
    }

    private void nokia(HttpServletRequest request, HttpServletResponse response) {
        int pageSize = 6;//Kich thuoc trang
        int categoryId = 4;
        HttpSession session = request.getSession();
        List<Product> list = pf.findByCategory(categoryId);//Doc mot trang

        //Xac dinh so thu tu cua trang hien tai
        Integer page = (Integer) session.getAttribute("pageNokia");
        if (page == null) {
            page = 1;
        }

        //Xac dinh tong so trang
        Integer totalPage = (Integer) session.getAttribute("totalPageNokia");
        if (totalPage == null) {
            int count = list.size();//Dem so luong records
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

        try {
            list = list.subList(n1, n2 + 1);
        } catch (Exception e) {
            list = list.subList(n1, list.size());
        }

        //Luu thong tin vao session va request
        session.setAttribute("pageNokia", page);
        session.setAttribute("totalPageNokia", totalPage);
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
