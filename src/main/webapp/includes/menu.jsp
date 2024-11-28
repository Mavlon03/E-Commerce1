<%@ page import="uz.pdp.online.classes.Basket" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">E-Commerce</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="../basket.jsp">Basket</a></li>
                <% if (auth != null) { %>
                <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                <% } else { %>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <% } %>
                <% if (auth != null && "Admin".equals(auth.getRole())) { %>
                <li class="nav-item"><a class="nav-link" href="admin.jsp">Admin Page</a></li>
                <% } %>

            </ul>
        </div>
    </div>
</nav>
