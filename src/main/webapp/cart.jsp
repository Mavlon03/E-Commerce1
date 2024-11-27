<%@ page import="uz.pdp.online.classes.Basket" %>
<%@ page import="uz.pdp.online.classes.Product" %>
<%@ page import="uz.pdp.online.classes.User" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null){
        request.setAttribute("auth", auth);
    }

    Basket basket = (Basket) session.getAttribute("basket");
    if (basket == null) {
        basket = new Basket();
        session.setAttribute("basket", basket);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Basket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/includes/menu.jsp" %>

<div class="container mt-5">
    <h1>Your Basket</h1>
    <%
        Integer grandTotal = 0;
        if (!basket.getMap().isEmpty()) {
    %>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Map.Entry<Product, Integer> entry : basket.getMap().entrySet()) {
                Product product = entry.getKey();
                Integer quantity = entry.getValue();
                int total = product.getPrice() * quantity;
                grandTotal += total;
        %>
        <tr>
            <td><%= product.getName() %></td>
            <td><%= product.getPrice() %> UZS</td>
            <td><%= quantity %></td>
            <td><%= total %> UZS</td>
            <td>
                <form action="update-quantity" method="post" style="display: inline-block;">
                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                    <input type="hidden" name="action" value="decrease">
                    <button class="btn btn-sm btn-secondary" type="submit">-</button>
                </form>
                <form action="update-quantity" method="post" style="display: inline-block;">
                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                    <input type="hidden" name="action" value="increase">
                    <button class="btn btn-sm btn-secondary" type="submit">+</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
        <tfoot>
        <tr>
            <th colspan="3">All Total</th>
            <th colspan="2"><%= grandTotal %> UZS</th>
        </tr>
        </tfoot>
    </table>

    <!-- Order button -->
    <form action="order" method="post">
        <button class="btn btn-success mt-3">Order</button>
    </form>

    <%
    } else {
    %>
    <p>Your basket is empty!</p>
    <%
        }
    %>
</div>

<%@ include file="/includes/footer.jsp" %>
</body>
</html>
