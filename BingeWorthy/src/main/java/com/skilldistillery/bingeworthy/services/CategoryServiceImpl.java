package com.skilldistillery.bingeworthy.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.bingeworthy.entities.Category;
import com.skilldistillery.bingeworthy.repositories.CategoryRepository;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository catRepo;

	@Override
	public List<Category> index() {
		return catRepo.findAll();
	}

	@Override
	public Category show(int id) {
		return catRepo.searchById(id);
	}

	@Override
	public Category create(Category category) {
		return catRepo.saveAndFlush(category);
	}

	@Override
	public Category update(Category category, int id) {
		Category updated = catRepo.searchById(id);
		updated.setType(category.getType());
		updated.setDescription(category.getDescription());

		return catRepo.save(updated);
	}

	@Override
	public boolean delete(int id) {
		boolean success = false;
		Category deleted = catRepo.searchById(id);

		if (deleted != null) {
			catRepo.delete(deleted);
			success = true;
		}

		return success;
	}

}
