package uz.pdp.online.servlets;

import uz.pdp.online.classes.User;
import uz.pdp.online.db.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static java.lang.System.out;

@WebServlet("/login")
public class  LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        User user = DB.USERS.stream()
                .filter(item -> item.getPhone().equals(phone) && String.valueOf(item.getPassword()).equals(password))
                .findFirst()
                .orElse(null);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("auth", user);

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                resp.sendRedirect("admin.jsp");
            } else {
                resp.sendRedirect("index.jsp");
            }
        } else {
            out.print("Incorrect password or phone");
            resp.sendRedirect("register.jsp?phone=" + phone + "&password=" + password);
        }
    }
}

