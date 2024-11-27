<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/26/2024
  Time: 12:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="uz.pdp.online.classes.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  User auth = (User)request.getSession().getAttribute("auth");
  if (auth != null){
    response.sendRedirect("index.jsp");
  }
%><html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

  <title>Title</title>
</head>
<body>
<h2>user page</h2>

</body>
</html>
