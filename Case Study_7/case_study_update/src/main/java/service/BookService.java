package service;

import model.Books;
import repository.BookRepository;
import repository.IBookRepository;

import java.util.List;

public class BookService implements IBookService {
    private IBookRepository bookRepository = new BookRepository();

    @Override
    public List<Books> finAll() {
        return bookRepository.findAll();
    }

    @Override
    public void create(Books books) {
        bookRepository.create(books);
    }

    @Override
    public boolean delete(int id) {
        return bookRepository.delete(id);
    }

    @Override
    public List<Books> search(String name) {
        return bookRepository.find(name);
    }
}
