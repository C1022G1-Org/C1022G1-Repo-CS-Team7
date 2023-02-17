package controller;

import model.Book;
import service.IBookService;
import service.impl.BookService;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "helloServlet", value = "/book-servlet")
public class BookServlet extends HttpServlet {
    IBookService bookService = new BookService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "search":
                break;
            case "delete" :
                break;
            default:
                listBook(req,resp);
        }
    }
    private void listBook(HttpServletRequest request,HttpServletResponse response){
        List<Book> bookList = bookService.showAll();
        request.setAttribute("bookList",bookList);
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void deleteBook(HttpServletRequest request,HttpServletResponse response){
        String id = request.getParameter("id");
        bookService.deleteBook(id);
        listBook(request,response);
    }
    }

