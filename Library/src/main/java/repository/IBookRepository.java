package repository;

import model.Book;

import java.util.List;

public interface IBookRepository {
    List<Book> showAll();

    List<Book> find(String tittle);

    boolean deleteBook(String id);
}
