/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Account;
import entities.Feedback;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessionbeans.AccountFacade;
import sessionbeans.FeedbackFacade;

/**
 *
 * @author SE161714 Ha Anh Tu
 */
@WebServlet(name = "FeedbackController", urlPatterns = {"/feedback"})
public class FeedbackController extends HttpServlet {
    
    @EJB
    private AccountFacade af;

    @EJB
    private FeedbackFacade ff;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     public Account find(String user) {
        for (Account acc : af.findAll()) {
            if (acc.getUserName().equals(user)) {
                return acc;
            }
        }
        return null;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getAttribute("action").toString();
        HttpSession session = request.getSession();
        
        switch (action) {
            case "index":

                Account acc = (Account) session.getAttribute("user");
                if (acc == null) {
                    request.setAttribute("controller", "login");
                    request.setAttribute("action", "indexlogin");
                    request.setAttribute("errorMessage", "Vui lòng đăng nhập để nhận xét");
                }else{
                List<Feedback> list=new ArrayList();
                list=ff.findAll();
               
                request.setAttribute("list", list);
                
                int feedbackId= ff.count();
                feedbackId++;
                request.setAttribute("feedbackId", feedbackId);
                }
                
                break;
            case "add":
                int id = Integer.parseInt(request.getParameter("id"));
                String descriptions = request.getParameter("description");
                String userName=request.getParameter("userName");
                Account user=find(userName);        
                Feedback feedback=new Feedback();
                feedback.setId(id);
                feedback.setDescriptions(descriptions);
                feedback.setUserName(user);
                ff.create(feedback);
                 List<Feedback> list=ff.findAll();             
                request.setAttribute("list", list);
                request.setAttribute("controller", "feedback");
                request.setAttribute("action", "index");
                break;

        }
        request.getRequestDispatcher(App.LAYOUT).forward(request, response);
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
