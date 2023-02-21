package service.Impl;

import model.Category;
import repository.ICategoryRepository;
import repository.Impl.CategoryRepository;
import service.ICategoryService;

import java.util.List;

public class CategoryService implements ICategoryService {
    ICategoryRepository categoryRepository = new CategoryRepository();

    @Override
    public List<Category> showAll() {
        return categoryRepository.selectAll();
    }
}
