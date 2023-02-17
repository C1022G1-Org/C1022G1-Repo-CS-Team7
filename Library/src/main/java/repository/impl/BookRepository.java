package repository.impl;

import model.Book;
import repository.BaseRepository;
import repository.IBookRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository
{
    private static final String SHOW_ALL_BOOK_SQL = "select  b.id ,b.name,b.page_size, a.name_author,b.cost, c.name_category from book b\n" +
            "join author a on b.id_author = a.id\n" +
            "join category c on b.id_category = c.id; ";
    private static final String DELETE_BOOK_SQL = "delete from book where id =?";
    private static final String SEARCH_BOOK_SQL = "select * from book where title =?";
    @Override
    public List<Book> showAll() {
        Connection connection = BaseRepository.getConnection();
        List<Book> bookList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SHOW_ALL_BOOK_SQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Book book = new Book();
                book.setId(resultSet.getString("id"));
                book.setTitle(resultSet.getString("name"));
                book.setPageSize(resultSet.getString("page_size"));
                book.setAuthor(resultSet.getString("a.name_author"));
                book.setCost(resultSet.getString("cost"));
                book.setCategory(resultSet.getString("c.name_category"));
                bookList.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }

    @Override
    public List<Book> find(String title) {
       Connection connection = BaseRepository.getConnection();
        List<Book> bookList = new ArrayList<>();
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = connection.prepareStatement(SEARCH_BOOK_SQL);
            preparedStatement.setString(1,"%" + title + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Book book = new Book();
                book.setId(resultSet.getString("id"));
                book.setTitle(resultSet.getString("name"));
                book.setPageSize(resultSet.getString("page_size"));
                book.setAuthor(resultSet.getString("author"));
                book.setCost(resultSet.getString("cost"));
                book.setCategory(resultSet.getString("cagetory"));
                bookList.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }

    @Override
    public boolean deleteBook(String id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BOOK_SQL);
            return preparedStatement.executeUpdate() >0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
