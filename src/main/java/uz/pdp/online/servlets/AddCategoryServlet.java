package uz.pdp.online.servlets;

import uz.pdp.online.classes.Category;
import uz.pdp.online.db.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/add/category")
public class AddCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String categoryId = req.getParameter("categoryId");
        System.out.println(categoryId);

        if (name != null){
            Category category = new Category();
            category.setId(DB.CATEGORIES.size()+1);
            category.setName(name);

            DB.CATEGORIES.add(category);

            System.out.println("category added: " + category.getName() + "Id: " + category.getId());
        }

        resp.sendRedirect("/admin.jsp");

    }
}

