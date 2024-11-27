package uz.pdp.online.servlets;

import uz.pdp.online.classes.Basket;
import uz.pdp.online.classes.Order;
import uz.pdp.online.classes.Product;
import uz.pdp.online.classes.User;
import uz.pdp.online.db.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User auth = (User) session.getAttribute("auth");
        Basket basket = (Basket) session.getAttribute("basket");

        if (auth == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        if (basket != null && !basket.getMap().isEmpty()) {
            // Buyurtma saqlanadi
            for (Map.Entry<Product, Integer> entry : basket.getMap().entrySet()) {
                Product product = entry.getKey();
                Integer amount = entry.getValue();

                // Order obyektini yaratish va saqlash
                Order order = new Order(null, product.getId(), auth.getId(), amount, new Date());
                DB.ORDERS.add(order);
            }
            // Basketni tozalash
            basket.getMap().clear();
        }

        // Order sahifasiga yo'naltirish
        resp.sendRedirect("orders.jsp");
    }
}
