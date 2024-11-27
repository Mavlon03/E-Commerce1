<%@ page import="uz.pdp.online.classes.Category" %>
<%@ page import="uz.pdp.online.db.DB" %>
<%@ page import="uz.pdp.online.classes.Product" %>
<%@ page import="uz.pdp.online.classes.User" %>
<%@ page import="uz.pdp.online.classes.Basket" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
    Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());
%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Filter Products</title>
</head>
<body>

<%@ include file="/includes/menu.jsp" %>

<div class="container mt-4">
    <h2>Products Page</h2>
    <a href="/addProduct.jsp?categoryId=<%= request.getParameter("categoryId") == null ? "1" : request.getParameter("categoryId") %>" class="btn btn-success">Add Product</a>
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
                        <%= category.getId() == Integer.parseInt(request.getParameter("categoryId") == null ? "1" : request.getParameter("categoryId")) ? "selected" : "" %>>
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
        <ul class="list-group">
            <%
                String selectedCategoryId = request.getParameter("categoryId");
                int categoryId = selectedCategoryId == null ? 1 : Integer.parseInt(selectedCategoryId);

                boolean hasProducts = false;
                for (Product product : DB.PRODUCTS) {
                    if (categoryId == 1 || product.getCategoryId() == categoryId) {
                        hasProducts = true;
            %>
            <li class="list-group-item d-flex align-items-center">
                <img src="<%= product.getPhotoUrl() %>" alt="<%= product.getName() %>" width="100" height="100" class="me-3">
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <p class="card-text"><%= product.getPrice() %> UZS</p>
                    <%
                        if (basket.getMap().containsKey(product)) {
                    %>
                    <form action="/remove" method="post">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <button class="btn btn-danger">Remove</button>
                    </form>
                    <%
                    } else {
                    %>
                    <form action="/add" method="post">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <button class="btn btn-success">Add</button>
                    </form>
                    <%
                        }
                    %>
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

</div>
</body>
</html>
