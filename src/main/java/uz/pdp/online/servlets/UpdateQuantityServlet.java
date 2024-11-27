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
import java.util.Map;

@WebServlet("/update-quantity")
public class UpdateQuantityServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("productId"));
        String action = req.getParameter("action");

        HttpSession session = req.getSession();
        Basket basket = (Basket) session.getAttribute("basket");
        if (basket == null) {
            basket = new Basket();
            session.setAttribute("basket", basket);
        }

        Product product = DB.PRODUCTS.stream().filter(p -> p.getId() == productId).findFirst().orElse(null);
        if (product != null) {
            Map<Product, Integer> map = basket.getMap();
            int currentQuantity = map.getOrDefault(product, 0);

            if ("increase".equals(action)) {
                map.put(product, currentQuantity + 1);
            } else if ("decrease".equals(action) && currentQuantity > 0) {
                map.put(product, currentQuantity - 1);
                if (map.get(product) == 0) {
                    map.remove(product);
                }
            }
        }

        resp.sendRedirect("cart.jsp");
    }
}
