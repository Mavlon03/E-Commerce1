package uz.pdp.online.servlets;

import uz.pdp.online.classes.Product;
import uz.pdp.online.db.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/addProduct")
@MultipartConfig
public class AddProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");

        String priceParam = req.getParameter("price");
        Integer price = Integer.parseInt(priceParam);

        String categoryIdParam = req.getParameter("categoryId");
        int categoryId = Integer.parseInt(categoryIdParam);

        Part productImagePart = req.getPart("productImage");
        String productImageUrl = null;
        if (productImagePart != null && productImagePart.getSize() > 0) {
            String fileName = productImagePart.getSubmittedFileName();

            String uploadPath = getServletContext().getRealPath("/product-image/");
            File uploadDir = new File(uploadPath);
            System.out.println(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            File file = new File(uploadDir, fileName);
            productImagePart.write(file.getAbsolutePath());

            productImageUrl = "product-image/" + fileName;
        }

        Product product = new Product(name, price, categoryId, productImageUrl);

        DB.PRODUCTS.add(product);

        resp.sendRedirect("admin.jsp");
    }
}

