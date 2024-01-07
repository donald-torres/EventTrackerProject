package com.skilldistillery.bingeworthy.services;

import java.util.List;

import com.skilldistillery.bingeworthy.entities.Category;

public interface CategoryService {

	List<Category> index();

	Category show(int id);

	Category create(Category category);

	Category update(Category category, int id);

	boolean delete(int id);

}
