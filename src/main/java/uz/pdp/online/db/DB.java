package uz.pdp.online.db;

import uz.pdp.online.classes.Category;
import uz.pdp.online.classes.Order;
import uz.pdp.online.classes.Product;
import uz.pdp.online.classes.User;

import java.util.ArrayList;
import java.util.List;

public interface DB {
    List<User> USERS = new ArrayList<>(List.of(
            new User("Akmalov", "Mavlon", "+998945060701", 123, "Admin"),
            new User("Akmalov", "Mustafo", "+998946088895", 123, "User")
    ));

    List<Category> CATEGORIES = new ArrayList<>(List.of(
            new Category("Eats"),
            new Category("Drinks"),
            new Category("Clothes")
    ));

    List<Product> PRODUCTS = new ArrayList<>(List.of(
            new Product("Lavash", 15000, 1, "product-image/lavash.jpg"),
            new Product("Hamburger", 25000, 1, "product-image/hamburger.jpg"),
            new Product("Cola", 8000, 2, "product-image/cola.jpg"),
            new Product("Pepsi", 5000, 2, "product-image/pepsi.jpg"),
            new Product("Boots", 5000, 3, "product-image/boots.jpg"),
            new Product("Kastyum", 5000, 3, "product-image/kastyum.jpg")
    ));

    List<Order> ORDERS = new ArrayList<>();
}
