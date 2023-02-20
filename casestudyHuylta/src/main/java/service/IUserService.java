package service;

import model.User;

import java.util.List;
import java.util.Map;

public interface IUserService {
    Map<String,String> add(User user);
    List<User> find();
    List<User>showAll();

}
