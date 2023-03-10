package service;

import model.Books;

import java.util.List;

public interface IBookService {
    List<Books> finAll();

    void create(Books books);

    boolean delete(int id);

    List<Books> search(String name);

    boolean updateBook(Books books);

    Books selectBooks(String id);

    Books findById(int id);
}
