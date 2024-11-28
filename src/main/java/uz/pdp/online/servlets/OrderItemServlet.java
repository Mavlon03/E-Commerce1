package uz.pdp.online.servlets;

import uz.pdp.online.classes.OrderItem;
import uz.pdp.online.classes.Product;
import uz.pdp.online.db.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
@WebServlet("/order-items")
public class OrderItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("orderId");

        if (id == null || id.isEmpty()) {
            resp.sendRedirect("orders.jsp");
            return;
        }

        try {
            int orderId = Integer.parseInt(id);

            List<OrderItem> orderItems = DB.ORDER_ITEMS.stream()
                    .filter(item -> item.getOrderId().equals(orderId))
                    .collect(Collectors.toList());

            List<Product> products = DB.PRODUCTS;

            System.out.println("Filtered Order Items: " + orderItems);
            System.out.println("Available Products: " + products);

            req.setAttribute("orderItems", orderItems);
            req.setAttribute("products", products);
            req.getRequestDispatcher("order-items.jsp").forward(req, resp);

        } catch (NumberFormatException e) {
            System.out.println("Invalid Order ID format: " + id);
            resp.sendRedirect("orders.jsp");
        }
    }
}
