package repository.Impl;

import model.User;
import repository.IUserRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {
 private static String CREATE_USER= "insert into user(name,username,password,id_role) values(?,?,?,?)";
    @Override
    public boolean add(User user) {
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement ps = connection.prepareStatement(CREATE_USER)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getRole());
            int update = ps.executeUpdate();
            if (update != 0) {
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    @Override
    public List<User> showAll() {
        List<User> userList = new ArrayList<>();

        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("select*from user where username= ? and password = ?");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String role = resultSet.getString("role");
                userList.add(new User(id, name, username, password, role));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

}
