package controller;

import model.User;
import service.IUserService;
import service.Impl.UserSevieceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private static List<User> userList = new ArrayList<>();
    private IUserService userService = new UserSevieceImpl();

    static {
        userList.add(new User("AnhHuy", "Huy", "123", "ADMIN"));
        userList.add(new User("QuanNe", "Quan", "123", "ADMIN"));
        userList.add(new User("TruongNe", "Truong", "123", "ADMIN"));
        userList.add(new User("ChanhTv", "Chanh", "123", "ADMIN"));
        userList.add(new User("Khach1", "guest1", "123", "GUEST"));
        userList.add(new User("Khach2", "guest2", "123", "GUEST"));
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            default:
                request.getRequestDispatcher("/view/login/login.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insert(request, response);
                break;
            default:
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                boolean rememberMe = Boolean.parseBoolean(request.getParameter("rememberMe"));
                // xác thực
                User userLogin = null;
                for (User user : userList) {
                    if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                        userLogin = user;
                        break;
                    }
                }
                String messLogin = "";
                HttpSession session = request.getSession();

                if (userLogin != null) {
                    session.setAttribute("sessionUser", userLogin);
                    if (rememberMe) {
                        Cookie cookieUsername = new Cookie("cookieUsername", username);
                        Cookie cookiePassword = new Cookie("cookiePassword", password);
                        cookieUsername.setMaxAge(1000);
                        cookiePassword.setMaxAge(1000);
                        response.addCookie(cookieUsername);
                        response.addCookie(cookiePassword);
                    }
                    // đăng nhập thành công
                    response.sendRedirect("/view/landing/home.jsp");
                } else {
                    // đăng nhập thấ bại
                    messLogin = "Đăng nhập thất bại";
                    request.setAttribute("messLogin", messLogin);
                    request.getRequestDispatcher("/view/login/login.jsp").forward(request, response);
                }
        break;
    }

}

    private void insert(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.find();
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");


        User user = new User(name, username, password, role);
        Map<String, String> errors = userService.add(user);
        if (errors.isEmpty()) {
            request.setAttribute("mess", "thêm mới thành công");
        } else {
            // lấy lại những gì đã nhập
            request.setAttribute("name", name);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("role", role);


            request.setAttribute("mess", "thêm mới thất bại");
            request.setAttribute("userList", userList);
            request.setAttribute("errors", errors);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/login/login.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.find();
        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/add.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}

