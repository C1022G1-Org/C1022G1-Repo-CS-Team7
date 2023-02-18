package service;

import model.Books;

import java.util.List;

public interface IBookService {
    List<Books> finAll();

    void create(Books books);
}
