package uz.pdp.online.servlets;

import uz.pdp.online.classes.*;
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

        Order order = new Order();
        order.setDate(new Date());
        order.setUserId(auth.getId());

        if (basket != null && !basket.getMap().isEmpty()) {
            for (Map.Entry<Product, Integer> entry : basket.getMap().entrySet()) {
                Product product = entry.getKey();
                Integer amount = entry.getValue();

                OrderItem orderItem = new OrderItem();
                orderItem.setOrderId(order.getId());
                orderItem.setAmount(amount);
                orderItem.setProductId(product.getId());

                DB.ORDER_ITEMS.add(orderItem);
            }

            DB.ORDERS.add(order);
            basket.getMap().clear();
        }

        resp.sendRedirect("orders.jsp");
    }
}
