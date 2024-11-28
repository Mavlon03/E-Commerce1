<%@ page import="uz.pdp.online.classes.Order" %>
<%@ page import="uz.pdp.online.db.DB" %>
<%@ page import="uz.pdp.online.classes.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="uz.pdp.online.classes.Product" %>

<%
  User user = (User) session.getAttribute("auth");

  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  List<Order> orders = DB.ORDERS.stream()
          .filter(order -> order.getUserId().equals(user.getId()))
          .collect(Collectors.toList());
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Orders</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <a href="/index.jsp" class="btn btn-secondary mb-3">Back to Menu</a>
  <h1>Your Orders</h1>

  <%
    if (orders.isEmpty()) {
  %>
  <p class="text-muted">You have no orders yet.</p>
  <%
  } else {
  %>
  <table class="table table-bordered table-striped">
    <thead class="table-dark">
    <tr>
      <th>Id</th>
      <th>Order Date</th>
      <th>User ID</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      int index = 1;
      for (Order order : orders) {

    %>
    <tr>
      <td><%= index++ %></td>
      <td><%= dateFormat.format(order.getDate()) %></td>
      <td><%= order.getUserId() %></td> <!-- Show User ID -->
      <td>
        <a href="order-items?orderId=<%= order.getId() %>" class="btn btn-info btn-sm">View Items</a>
      </td>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
