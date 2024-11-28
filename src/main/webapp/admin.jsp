<%@ page import="uz.pdp.online.classes.Product" %>
<%@ page import="uz.pdp.online.db.DB" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.online.classes.User" %>
<%@ page import="uz.pdp.online.classes.Category" %>

<%
  User user = (User) session.getAttribute("auth");
  if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
    response.sendRedirect("login.jsp");
    return;
  }

  List<Category> categories = DB.CATEGORIES;
  List<Product> products = DB.PRODUCTS;
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Admin - Manage Products</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<a href="/addCategory.jsp" class="btn btn-primary">Add category</a>
<a href="/addProduct.jsp" class="btn btn-primary">Add product</a>

<div class="container mt-5">
  <h3>Products List:</h3>

  <div class="mb-4">
    <label for="categoryId" class="form-label">Filter by Category</label>
    <select name="categoryId" id="categoryId" class="form-select">
      <option value="1">All Categories</option>
      <% for (Category category : categories) { %>
      <option value="<%= category.getId() %>" <%= (category.getId() == 1 ? "selected" : "") %>><%= category.getName() %></option>
      <% } %>
    </select>
  </div>

  <ul class="list-group">
    <%
      String selectedCategoryId = request.getParameter("categoryId");
      int categoryId = selectedCategoryId == null ? 1 : Integer.parseInt(selectedCategoryId);
      boolean hasProducts = false;

      for (Product product : products) {
        if (categoryId == 1 || product.getCategoryId() == categoryId) {
          hasProducts = true;
    %>
    <li class="list-group-item d-flex align-items-center">
      <img src="<%= product.getPhotoUrl() %>" alt="<%= product.getName() %>" width="100" height="100" class="me-3">
      <div class="card-body">
        <h5 class="card-title"><%= product.getName() %></h5>
        <p class="card-text"><%= product.getPrice() %> UZS</p>
        <form action="/remove-product" method="post">
          <input type="hidden" name="productId" value="<%= product.getId() %>">
          <button class="btn btn-danger">Remove</button>
        </form>
      </div>
    </li>
    <%
        }
      }

      if (!hasProducts) {
    %>
    <li class="list-group-item">No products found for the selected category.</li>
    <%
      }
    %>
  </ul>
</div>

</body>
</html>
