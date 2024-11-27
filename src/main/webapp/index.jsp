<%@ page import="uz.pdp.online.classes.Product" %>
<%@ page import="uz.pdp.online.db.DB" %>
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

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<%@ include file="/includes/menu.jsp" %>

<div class="container mt-5">
    <h1>Welcome to E-Commerce</h1>
    <h3 class="mb-4">Products List</h3>
    <div class="row">
        <%
            for (Product product : DB.PRODUCTS) {
        %>
        <div class="col-md-4 mb-3">
            <div class="card">
                <img src="<%= product.getPhotoUrl() %>" class="card-img-top" alt="<%= product.getName() %>" style="height: 200px; object-fit: cover;">
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <p class="card-text"><%= product.getPrice() %> UZS</p>
                    <%
                        if (basket.getMap().containsKey(product)) {
                    %>
                    <form action="/remove" method="post" class="d-inline">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <button class="btn btn-danger btn-sm">Remove</button>
                    </form>
                    <%
                    } else {
                    %>
                    <form action="/add" method="post" class="d-inline">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <button class="btn btn-success btn-sm">Add to Basket</button>
                    </form>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
