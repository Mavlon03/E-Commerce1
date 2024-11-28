package uz.pdp.online.servlets;

import uz.pdp.online.classes.Product;
import uz.pdp.online.classes.User;
import uz.pdp.online.db.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/remove-product")
public class RemoveProductAdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("auth");
        if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String productId = req.getParameter("productId");
        Product productToRemove = DB.PRODUCTS.stream()
                .filter(p -> p.getId().equals(productId))
                .findFirst()
                .orElseThrow();

        if (productToRemove != null) {
            DB.PRODUCTS.remove(productToRemove);
        }

        resp.sendRedirect("admin.jsp");
    }
}
