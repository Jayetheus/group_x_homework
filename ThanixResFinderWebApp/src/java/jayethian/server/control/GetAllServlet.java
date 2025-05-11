/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jayethian.server.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jayethian.thanix.bean.ResidenceFacadeLocal;
import jayethian.thanix.entity.Residence;

/**
 *
 * @author Thakgalang
 */

@WebServlet(name = "GetAllServlet", urlPatterns = {"/GetAllServlet"})
public class GetAllServlet extends HttpServlet {

  @EJB private ResidenceFacadeLocal rfl;   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          
           List<Residence> reses = rfl.findAll();
            
            request.setAttribute("residences", reses);
            request.getRequestDispatcher("residences_search.jsp").forward(request, response);
    }

}
