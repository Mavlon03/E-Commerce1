<%@ page import="uz.pdp.online.db.DB" %>
<%@ page import="uz.pdp.online.classes.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>Add Product</title>
</head>
<body>
<div class="container mt-4">
  <h2>Add New Product</h2>
  <form action="/addProduct" method="post" enctype="multipart/form-data">
    <div class="mb-3">
      <label for="name" class="form-label">Product Name:</label>
      <input type="text" name="name" id="name" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="price" class="form-label">Price ($):</label>
      <input type="number" name="price" id="price" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="categoryId" class="form-label">Category:</label>
      <select name="categoryId" id="categoryId" class="form-select" required>
        <%
          for (Category category : DB.CATEGORIES) {
        %>
        <option value="<%= category.getId() %>"><%= category.getName() %></option>
        <% } %>
      </select>
    </div>

    <div class="mb-3">
      <label for="productImage" class="form-label">Product Image:</label>
      <input type="file" name="productImage" id="productImage" class="form-control" required>
    </div>

    <button type="submit" class="btn btn-primary">Add Product</button>
  </form>
</div>
</body>
</html>
