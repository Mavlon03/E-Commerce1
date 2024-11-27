<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/22/2024
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

  <title>Title</title>
</head>
<body>
<div class="container mt-4">
  <div class="row">
    <div class="col-6">
      <form action="/add/category" method="post" class="mb-3">
        <label for="name">New Category Name:</label>
        <input type="text" id="name" name="name" class="form-control" required>
        <button type="submit" class="btn btn-success mt-2">Add Category</button>
      </form>
    </div>
  </div>
</div>
</body>
</html>
