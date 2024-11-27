<%@ page import="uz.pdp.online.classes.Order" %>
<%@ page import="uz.pdp.online.classes.Product" %>
<%@ page import="uz.pdp.online.db.DB" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="uz.pdp.online.classes.User" %>
<%
  User auth = (User) session.getAttribute("auth");
  if (auth == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Orders</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/includes/menu.jsp" %>

<div class="container mt-5">
  <h1>My Orders</h1>
  <%
    boolean hasOrders = false;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  %>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>#</th>
      <th>Product</th>
      <th>Amount</th>
      <th>Date</th>
    </tr>
    </thead>
    <tbody>
    <%
      int count = 1;
      for (Order order : DB.ORDERS) {
        if (order.getUserId().equals(auth.getId())) {
          hasOrders = true;
          Product product = DB.PRODUCTS.stream()
                  .filter(p -> p.getId().equals(order.getProductId()))
                  .findFirst()
                  .orElse(null);
    %>
    <tr>
      <td><%= count++ %></td>
      <td><%= product != null ? product.getName() : "Unknown Product" %></td>
      <td><%= order.getAmount() %></td>
      <td><%= sdf.format(order.getDate()) %></td>
    </tr>
    <%
        }
      }

      if (!hasOrders) {
    %>
    <tr>
      <td colspan="4" class="text-center">You have no orders yet.</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
</div>

<%@ include file="/includes/footer.jsp" %>
</body>
</html>
