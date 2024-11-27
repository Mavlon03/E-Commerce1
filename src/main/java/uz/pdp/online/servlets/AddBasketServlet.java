package uz.pdp.online.servlets;

import uz.pdp.online.classes.Basket;
import uz.pdp.online.classes.Product;
import uz.pdp.online.db.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/add")
public class AddBasketServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("productId"));
        HttpSession session = req.getSession();
        Basket basket = (Basket) session.getAttribute("basket");

        if (basket == null) {
            basket = new Basket();
            session.setAttribute("basket", basket);
        }

        Product product = DB.PRODUCTS.stream()
                .filter(p -> p.getId() == productId)
                .findFirst()
                .orElse(null);

        if (product != null) {
            basket.getMap().put(product, basket.getMap().getOrDefault(product, 0) + 1);
        }

        resp.sendRedirect("index.jsp");
    }
}

