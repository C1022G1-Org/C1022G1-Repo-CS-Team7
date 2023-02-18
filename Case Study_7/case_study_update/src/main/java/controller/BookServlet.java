package controller;

import model.Books;
import service.BookService;
import service.IBookService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", urlPatterns = "/books")
public class BookServlet extends HttpServlet {
    private IBookService bookService = new BookService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createBook(request, response);
                break;

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request,response);
            default:
                findAll(request, response);
                break;
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/book/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createBook(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String pageSize = request.getParameter("pageSize");
        double cost = Double.parseDouble(request.getParameter("cost"));
        String author = request.getParameter("author");
        String category = request.getParameter("category");

        Books books = new Books(name, pageSize, cost, author, category);
        bookService.create(books);
        try {
            response.sendRedirect("/books");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        List<Books> booksList = bookService.finAll();

        request.setAttribute("booksList", booksList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/book/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
