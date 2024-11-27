<%@ page import="uz.pdp.online.classes.Category" %>
<%@ page import="uz.pdp.online.db.DB" %>
<%@ page import="uz.pdp.online.classes.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>Filtered Products</title>
</head>
<body>
<div class="container mt-4">
  <h2>Filtered Products</h2>
  <a href="/admin.jsp" class="btn btn-dark">Back</a>

  <div class="mt-4">
    <form action="filterProduct.jsp" method="get">
      <label for="categoryId" class="form-label">Select Category:</label>
      <select name="categoryId" id="categoryId" class="form-select">
        <option value="1" <%= request.getParameter("categoryId") == null || request.getParameter("categoryId").equals("1") ? "selected" : "" %>>All</option>
        <%
          for (Category category : DB.CATEGORIES) {
        %>
        <option value="<%= category.getId() %>"
                <%= category.getId() == Integer.parseInt(request.getParameter("categoryId") == null ? "1" : request.getParameter("categoryId")) ? "selected" : "" %> >
          <%= category.getName() %>
        </option>
        <%
          }
        %>
      </select>
      <button type="submit" class="btn btn-primary mt-3">Filter</button>
    </form>
  </div>

  <div class="mt-5">
    <h3>Products List:</h3>
    <div class="container">
      <div class="row">
        <%
          String selectedCategoryId = request.getParameter("categoryId");
          int categoryId = selectedCategoryId == null ? 1 : Integer.parseInt(selectedCategoryId);

          boolean hasProducts = false;
          for (Product product : DB.PRODUCTS) {
            if (categoryId == 1 || product.getCategoryId() == categoryId) {
              hasProducts = true;
        %>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img src="<%= product.getPhotoUrl() %>" class="card-img-top" alt="<%= product.getName() %>">
            <div class="card-body">
              <h5 class="card-title"><%= product.getName() %></h5>
              <p class="card-text"><%= product.getPrice() %> UZS</p>
            </div>
          </div>
        </div>
        <%
            }
          }

          if (!hasProducts) {
        %>
        <div class="col-12">
          <p class="text-center text-muted">No products found for the selected category.</p>
        </div>
        <%
          }
        %>
      </div>
    </div>
  </div>


</div>
</body>
</html>
