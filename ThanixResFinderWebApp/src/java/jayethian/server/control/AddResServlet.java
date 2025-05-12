package jayethian.server.control;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jayethian.thanix.bean.ResidenceFacadeLocal;
import jayethian.thanix.entity.Residence;
import jayethian.thanix.persistence.enums.GenderIntake;
import jayethian.thanix.persistence.enums.RoomType;
import jayethian.thanix.persistence.enums.State;

@WebServlet(name = "AddResServlet", urlPatterns = {"/AddResServlet"})
public class AddResServlet extends HttpServlet {
    
    @EJB
    private ResidenceFacadeLocal rfl;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form data
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        boolean nsfas = Boolean.parseBoolean(req.getParameter("nsfas"));
        GenderIntake gender = GenderIntake.valueOf(req.getParameter("gender"));
        RoomType roomType = RoomType.valueOf(req.getParameter("room-type"));
        long resProv = Long.parseLong(req.getParameter("res-prov"));
        String telephone = req.getParameter("telephone");
        String website = req.getParameter("website");

        // Address details
        String streetName = req.getParameter("street-name");
        int streetNum = Integer.parseInt(req.getParameter("street-number"));
        String city = req.getParameter("city");
        State state = State.valueOf(req.getParameter("state"));
        int postalCode = Integer.parseInt(req.getParameter("postal-code"));

        // Create Residence object
        Residence residence = createResidence(
            name, email, nsfas, gender, roomType, resProv, telephone, website,
            streetName, streetNum, city, state, postalCode
        );

        rfl.create(residence);
        resp.sendRedirect("index.html");
    }

    private Residence createResidence(String name, String email, boolean nsfas, GenderIntake gender, RoomType roomType, long resProv, String telephone, String website,
                                     String streetName, int streetNum, String city, State state, int postalCode) {
        Residence res = new Residence();
        res.setName(name);
        res.setEmail(email);
        res.setNsfas_accr(nsfas);
        res.setGender_intake(gender);
        res.setRoom_type(roomType);
        res.setRes_prov_id(resProv);
        res.setTelephone(telephone);
        res.setWebsite(website);
        res.setStreet_name(streetName);
        res.setStreet_number(streetNum);
        res.setCity(city);
        res.setState(state);
        res.setPostal_code(postalCode);
        return res;
    }
}