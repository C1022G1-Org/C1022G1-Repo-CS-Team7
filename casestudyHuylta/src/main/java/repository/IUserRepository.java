package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    boolean add(User user);
    List<User> showAll();
}
