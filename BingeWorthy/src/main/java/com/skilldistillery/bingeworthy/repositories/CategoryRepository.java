package com.skilldistillery.bingeworthy.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.bingeworthy.entities.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

	Category searchById(int id);
}
