package repository.Impl;

import model.Books;
import repository.IBookRepository;
import repository.Impl.BaseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {
    private static final String DELETE_BOOK_SQL = "delete from book where id = ?";
    private static final String SEARCH_BOOK_SQL ="select b.id ,b.name,b.page_size,b.cost,b.name_author,c.name_category from book b  join category c on b.id_category = c.id    where name like ?";

    @Override
    public List<Books> findAll() {
        List<Books> booksList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("select b.id ,b.name,b.page_size,b.cost,b.name_author,c.name_category from book b\n" +
                    "join category c on b.id_category = c.id;\n");

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int bookId = resultSet.getInt("b.id");
                String bookName = resultSet.getString("b.name");
                String pageSize = resultSet.getString("b.page_size");
                double cost = resultSet.getDouble("b.cost");
                String author = resultSet.getString("b.name_author");
                String category = resultSet.getString("c.name_category");

                booksList.add(new Books(bookId, bookName, pageSize, cost, author, category));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return booksList;
    }

    @Override
    public void create(Books books) {
        PreparedStatement preparedStatement;
        try {
            preparedStatement =BaseRepository.getConnection().
                    prepareStatement("insert into book (name, page_size, cost, name_author, id_category) values (?,?,?,?,?);");
            preparedStatement.setString(1, books.getName());
            preparedStatement.setString(2, books.getPageSize());
            preparedStatement.setDouble(3,books.getCost());
            preparedStatement.setString(4, books.getAuthor());
            preparedStatement.setString(5, books.getCategory());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BOOK_SQL);
            preparedStatement.setInt(1,id);
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Books> find(String name) {
        List<Books> booksList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SEARCH_BOOK_SQL);
            preparedStatement.setString(1,"%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int bookId = resultSet.getInt("b.id");
                String bookName = resultSet.getString("b.name");
                String pageSize = resultSet.getString("b.page_size");
                double cost = resultSet.getDouble("b.cost");
                String author = resultSet.getString("b.name_author");
                String category = resultSet.getString("c.name_category");

                booksList.add(new Books(bookId, bookName, pageSize, cost, author, category));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return booksList;
    }
}
