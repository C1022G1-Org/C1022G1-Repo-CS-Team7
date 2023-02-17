package service.impl;

import model.Book;
import repository.IBookRepository;
import repository.impl.BookRepository;
import service.IBookService;

import java.util.List;

public class BookService implements IBookService {
    IBookRepository bookRepository = new BookRepository();
    @Override
    public List<Book> showAll() {
        return bookRepository.showAll();
    }

    @Override
    public List<Book> find(String name) {
        return bookRepository.find(name);
    }

    @Override
    public boolean deleteBook(String id) {
        return bookRepository.deleteBook(id);
    }
}
