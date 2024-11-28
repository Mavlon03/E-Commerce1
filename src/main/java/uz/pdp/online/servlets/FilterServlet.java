package uz.pdp.online.servlets;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//@WebFilter("/*")
public class FilterServlet extends HttpFilter {
    List<String> openPages = new ArrayList<>(List.of(
            "/login.jsp", "/register.jsp", "/login", "/register" // ochiq sahifalar
    ));

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        String requestURI = req.getRequestURI();
        System.out.println("Request URI: " + requestURI);

        if (openPages.contains(requestURI)) {
            chain.doFilter(req, res);
            return;
        }

        HttpSession session = req.getSession(false); // Mavjud sessiyani oladi
        if (session == null) {
            System.out.println("Sessiya mavjud emas. Login sahifasiga yo'naltirildi.");
            res.sendRedirect("/login.jsp");
            return;
        }

        String role = (String) session.getAttribute("role");
        if (role == null) {
            System.out.println("Rol mavjud emas. Login sahifasiga yo'naltirildi.");
            res.sendRedirect("/login.jsp");
            return;
        }

        if ("ADMIN".equalsIgnoreCase(role)) {
            System.out.println("Admin sahifasi davom ettirildi.");
            chain.doFilter(req, res); // Davom etadi
        } else if ("USER".equalsIgnoreCase(role)) {
            System.out.println("User sahifasi davom ettirildi.");
            chain.doFilter(req, res); // Davom etadi
        } else {
            System.out.println("Notanish rol. Login sahifasiga yo'naltirildi.");
            res.sendRedirect("/login.jsp");
        }
    }
}

