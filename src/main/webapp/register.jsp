<%@ page import="uz.pdp.online.classes.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  User auth = (User)request.getSession().getAttribute("auth");
  if (auth != null){
    response.sendRedirect("index.jsp");
  }
%><html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <title>Ro'yxatdan o'tish</title>
</head>
<body>
<div class="container mt-5">
  <h2 class="mb-4 text-center">Ro'yxatdan o'tish</h2>

  <form action="/register" method="post" enctype="multipart/form-data">
    <div class="mb-3">
      <label for="firstname" class="form-label">Ism</label>
      <input type="text" name="firstname" id="firstname" class="form-control" placeholder="Ismingizni kiriting" required>
    </div>
    <div class="mb-3">
      <label for="lastname" class="form-label">Familiya</label>
      <input type="text" name="lastname" id="lastname" class="form-control" placeholder="Familiyangizni kiriting" required>
    </div>
    <div class="mb-3">
      <label for="phone" class="form-label">Telefon raqam</label>
      <input type="text" name="phone" id="phone" class="form-control"
             value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>"
             placeholder="Telefon raqamni kiriting" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Parol</label>
      <input type="password" name="password" id="password" class="form-control"
             value="<%= request.getParameter("password") != null ? request.getParameter("password") : "" %>"
             placeholder="Parolni kiriting" required>
    </div>
    <div class="mb-3">
      <label for="photo" class="form-label">Rasm yuklash</label>
      <input type="file" name="photo" id="photo" class="form-control">
    </div>
    <button type="submit" class="btn btn-success">Ro'yxatdan o'tish</button>
  </form>
</div>
</body>
</html>
