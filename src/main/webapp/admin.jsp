<%@ page import="uz.pdp.online.db.DB" %>
<%@ page import="uz.pdp.online.classes.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>Admin Page</title>
</head>
<body>
<h1>Admin Page</h1>
<a href="/addCategory.jsp" class="btn btn-primary">Add category</a>
<a href="/products.jsp" class="btn btn-primary">Add product</a>


<div class="col-6">
  <label for="category">Select Existing Category:</label>
  <select name="categoryId" id="category" class="form-select">
    <% for (Category category : DB.CATEGORIES) { %>
    <option value="<%=category.getId()%>"><%=category.getName()%></option>
    <% } %>
  </select>
</div>
</div>
</div>

</body>
</html>
