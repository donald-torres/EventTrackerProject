package com.skilldistillery.bingeworthy.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.bingeworthy.entities.Category;
import com.skilldistillery.bingeworthy.services.CategoryService;

import jakarta.servlet.http.HttpServletResponse;

@CrossOrigin({"*", "http://localhost/"})
@RestController
@RequestMapping("api")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@GetMapping(path = { "categories", "categories/" })
	public List<Category> index() {
		return categoryService.index();
	}

	@GetMapping(path = { "categories/{id}" })
	public Category show(@PathVariable("id") Integer id, HttpServletResponse res) {
		Category single = categoryService.show(id);
		if (single == null) {
			res.setStatus(404);
		}

		return single;
	}

	@PostMapping(path = { "categories" })
	public Category create(@RequestBody Category category, HttpServletResponse res) {
		Category newCategory;
		try {
			newCategory = categoryService.create(category);
			res.setStatus(201);
			res.setHeader("Location", "http://localhost:8083/api/categorys/" + newCategory.getId());
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
			newCategory = null;
		}
		return newCategory;
	}

	@PutMapping(path = { "categories/{id}" })
	public Category update(@PathVariable("id") Integer id, @RequestBody Category category, HttpServletResponse res) {
		try {
			category = categoryService.update(category, id);
			if (category == null) {
				res.setStatus(404);

			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
			category = null;
		}

		return category;
	}

	@DeleteMapping(path = "categories/{id}")
	public void delete(@PathVariable("id") Integer id, HttpServletResponse res) {
		try {
			if (categoryService.delete(id)) {
				res.setStatus(204);
			} else {
				res.setStatus(404);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
