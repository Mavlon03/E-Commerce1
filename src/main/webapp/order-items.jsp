<%@ page import="uz.pdp.online.classes.OrderItem" %>
<%@ page import="uz.pdp.online.classes.Product" %>
<%@ page import="java.util.List" %>

<%
    List<OrderItem> orderItems = (List<OrderItem>) request.getAttribute("orderItems");
    List<Product> products = (List<Product>) request.getAttribute("products");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Order Items</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>Order Items</h1>
    <%
        if (orderItems == null || orderItems.isEmpty()) {
    %>
    <p>No items found for this order.</p>
    <%
    } else {
    %>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Product</th>
            <th>Quantity</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (OrderItem orderItem : orderItems) {
                Product product = products.stream()
                        .filter(p -> p.getId().equals(orderItem.getProductId()))
                        .findFirst()
                        .orElse(null);
        %>
        <tr>
            <td><%= product != null ? product.getName() : "Unknown Product" %></td>
            <td><%= orderItem.getAmount() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
        }
    %>
    <a href="orders.jsp" class="btn btn-primary mt-3">Back to Orders</a>
</div>
</body>
</html>
