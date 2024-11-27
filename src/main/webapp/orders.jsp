<%@ page import="uz.pdp.online.classes.Order" %>
<%@ page import="uz.pdp.online.db.DB" %>
<%@ page import="uz.pdp.online.classes.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="uz.pdp.online.classes.Product" %>
<%@ page import="uz.pdp.online.classes.Basket" %>

<%
  User user = (User) session.getAttribute("auth");
    Basket basket = (Basket) session.getAttribute("basket");
  List<Order> orders = DB.ORDERS.stream()
          .filter(order -> order.getUserId().equals(user.getId()))
          .collect(Collectors.toList());
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Your Orders</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%--<%@ include file="/includes/menu.jsp" %>--%>

<div class="container mt-5">
  <h1>Your Orders</h1>
  <%
    if (orders.isEmpty()) {
  %>
  <p>You have no orders yet.</p>
  <%
  } else {
  %>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Product</th>
      <th>Quantity</th>
      <th>Order Date</th>
    </tr>
    </thead>
    <tbody>
    <%
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      for (Order order : orders) {
        Product product = DB.PRODUCTS.stream()
                .filter(p -> p.getId().equals(order.getProductId()))
                .findFirst()
                .orElse(null);
    %>
    <tr>
      <td><%= product != null ? product.getName() : "Unknown" %></td>
      <td><%= order.getAmount() %></td>
      <td><%= dateFormat.format(order.getDate()) %></td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <%
    }
  %>
</div>

<%--<%@ include file="/includes/footer.jsp" %>--%>

</body>
</html>
