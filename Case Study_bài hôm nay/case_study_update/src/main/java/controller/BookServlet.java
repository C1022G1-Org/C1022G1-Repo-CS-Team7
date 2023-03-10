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
            case "edit":
                editBook(request, response);
                break;
            case "search":
                search(request, response);
                break;
            case "delete":
                deleteBook(request, response);
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
                showEditForm(request, response);
                break;
            default:
                findAll(request, response);
                break;
        }
    }
//    ================================================================================

    //    ------------------------ T??m S??ch theo t??n -----------------------
    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Books> booksList = bookService.search(name);
        request.setAttribute("booksList", booksList);
        try {
            request.getRequestDispatcher("view/book/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //    ------------------------- X??a S??ch ----------------------------------------
    private void deleteBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        String mess = "x??a th??nh c??ng";
        boolean check = bookService.delete(id);
        if (!check) {
            mess = "X??a th???t b???i";
        }
        request.setAttribute("mess", mess);
        findAll(request, response);
    }

    //    ---------------------------- form edit ----------------------------------
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Books books = bookService.findById(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/book/edit.jsp");
        request.setAttribute("books", books);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // ------------------------------ Ch???nh s???a s??ch -----------------------------------
    private void editBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String pageSize = request.getParameter("pageSize");
        double cost = Double.parseDouble(request.getParameter("cost"));
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        Books books = new Books(id, name, pageSize, cost, author, category);
        boolean flag = bookService.updateBook(books);
        if (flag ) {
            request.setAttribute("mess ", "update th???t b???i");
            request.setAttribute("books", books);
        } else {
            request.setAttribute("mess", "update th??nh c??ng");
            request.setAttribute("books", books);
        }
        try {
            response.sendRedirect("/books");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //    ------------------------------- form th??m m???i S??ch ------------------------
    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/book/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //    ------------------------------- Th??m m???i S??ch ------------------------
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

    //    ---------------------- Hi???n th??? danh S??ch -------------------------------
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
