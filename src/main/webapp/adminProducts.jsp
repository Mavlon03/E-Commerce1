<%@ page import="uz.pdp.online.classes.Product" %>
<%@ page import="uz.pdp.online.db.DB" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.online.classes.User" %>

<%
    User user = (User) session.getAttribute("auth");
    if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Product> products = DB.PRODUCTS;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin - Manage Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>Manage Products</h1>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Product Name</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Product product : products) {
        %>
        <tr>
            <td><%= product.getName() %></td>
            <td><%= product.getPrice() %></td>
            <td>
                <form action="remove" method="post">
                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
