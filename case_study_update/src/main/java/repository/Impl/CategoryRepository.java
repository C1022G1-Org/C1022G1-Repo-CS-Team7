package repository.Impl;

import model.Category;
import repository.ICategoryRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository {
    private static final String SELECT_ALL_CATEGORY_SQL = "select * from category";

    @Override
    public List<Category> selectAll() {
        Connection connection = BaseRepository.getConnection();
        List<Category> categoryList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY_SQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Category category = new Category();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name_category"));
                categoryList.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList;
    }
}
