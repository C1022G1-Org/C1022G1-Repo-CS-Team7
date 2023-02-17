package service;

import model.Book;

import java.util.List;

public interface IBookService {
    List<Book> showAll();

    List<Book> find(String name);

    boolean deleteBook(String id);
}
