package repository;

import model.Books;

import java.util.List;

public interface IBookRepository {
    List<Books> findAll();
    void create(Books books);

    boolean delete(int id);

    List<Books> find(String name);

    boolean updateBook(Books books);

    Books selectBooks(String id);

    Books findById(int id);
}
