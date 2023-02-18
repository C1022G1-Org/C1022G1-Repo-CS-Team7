package repository;

import model.Books;

import java.util.List;

public interface IBookRepository {
    List<Books> findAll();
    void create(Books books);

}
