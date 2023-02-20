package service.Impl;

import model.User;
import repository.IUserRepository;
import repository.Impl.UserRepositoryImpl;
import service.IUserService;

import java.util.List;
import java.util.Map;

public class UserSevieceImpl implements IUserService {
private IUserRepository userRepository = new UserRepositoryImpl();
    @Override
    public Map<String, String> add(User user) {
        return null;
    }

    @Override
    public List<User> find() {
        return null;
    }

    @Override
    public List<User> showAll() {
        return userRepository.showAll();
    }
}
