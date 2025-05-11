package jayethian.server.control;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jayethian.thanix.bean.ResidenceFacadeLocal;
import jayethian.thanix.entity.Residence;
import jayethian.thanix.persistence.enums.RoomType;

/**
 *
 * @author Jayetheus
 */
@WebServlet(name = "ResFilterServlet", urlPatterns = {"/Filter"})
public class ResFilterServlet extends HttpServlet {

    @EJB
    private ResidenceFacadeLocal rfl;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String city = req.getParameter("city");
            RoomType roomType = RoomType.valueOf(req.getParameter("room_type"));
            List<Residence> reses = rfl.findAll();
            filterAndSet(reses, city, roomType, req);
            
            RequestDispatcher disp = req.getRequestDispatcher("residences_search.jsp");
            disp.forward(req, resp);
    }
    
    private void filterAndSet(List<Residence> reses,String city ,RoomType roomType,HttpServletRequest req){
        
        List<Residence> residencesToReturn = new ArrayList<Residence>();
        for(Residence res : reses){
            if(res.getRoom_type() == roomType && res.getCity().equalsIgnoreCase(city)){
                residencesToReturn.add(res);
                req.setAttribute("residences", residencesToReturn);
            }
        }
    }
    
    
}
