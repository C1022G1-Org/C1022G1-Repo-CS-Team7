package controller;

import model.Category;
import service.ICategoryService;
import service.Impl.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Category",urlPatterns = "/category")
public class CategoryServlet extends HttpServlet {
    private ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "add" :
                break;
            default:
                listCategory(req,resp);
        }
    }

    private void listCategory(HttpServletRequest req, HttpServletResponse resp) {
        List<Category> categoryList = this.categoryService.showAll();
        req.setAttribute("categoryList",categoryList);
        try {
            req.getRequestDispatcher("view/category/list.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
