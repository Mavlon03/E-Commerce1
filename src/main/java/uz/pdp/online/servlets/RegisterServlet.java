package uz.pdp.online.servlets;

import uz.pdp.online.classes.User;
import uz.pdp.online.db.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        int pass = Integer.parseInt(password);
        Part part = req.getPart("photo");
        String photoUrl = null;
        if (part != null) {
            String fileName = part.getSubmittedFileName();
            photoUrl = "files/" + fileName;
        }

        String role = req.getParameter("role");
        if (role == null) {
            role = "USER";
        }

        User user = new User(firstname, lastname, phone, pass, role);
        if (photoUrl != null) {
            user.setPhotoUrl(photoUrl);
        }

        DB.USERS.add(user);
        resp.sendRedirect("login.jsp");
    }
}

