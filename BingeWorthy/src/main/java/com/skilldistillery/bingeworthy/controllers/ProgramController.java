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

import com.skilldistillery.bingeworthy.entities.Program;
import com.skilldistillery.bingeworthy.repositories.ProgramRepository;
import com.skilldistillery.bingeworthy.services.ProgramService;

import jakarta.servlet.http.HttpServletResponse;

@CrossOrigin({"*", "http://localhost/"})
@RestController
@RequestMapping("api")
public class ProgramController {

	@Autowired
	private ProgramService programService;

	@Autowired
	private ProgramRepository proRepo;

	@GetMapping(path = { "programs", "programs/" })
	public List<Program> index() {
		return programService.getAllPrograms();
	}

	@GetMapping(path = "category/{id}/programs")
	public List<Program> getProgramByCategoryId(@PathVariable("id") Integer id, HttpServletResponse res) {
		List<Program> programs = programService.getProgramByCategoryId(id);
		if (programs == null) {
			res.setStatus(404);
		}
		return programs;
	}

	@GetMapping(path = "platform/{id}/programs")
	public List<Program> getProgramByPlatformId(@PathVariable("id") Integer id, HttpServletResponse res) {
		List<Program> programs = programService.getProgramByPlatformId(id);
		if (programs == null) {
			res.setStatus(404);
		}
		return programs;
	}

	@GetMapping(path = { "programs/{id}" })
	public Program show(@PathVariable("id") Integer id, HttpServletResponse res) {
		Program single = programService.getProgramById(id);
		if (single == null) {
			res.setStatus(404);
		}

		return single;
	}

	@PostMapping(path = { "programs" })
	public Program create(@RequestBody Program program, HttpServletResponse res) {
		Program newProgram;
		try {
			newProgram = programService.create(program);
			res.setStatus(201);
			res.setHeader("Location", "http://localhost:8083/api/programs/" + newProgram.getId());
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
			newProgram = null;
		}
		return newProgram;
	}

	@PutMapping(path = { "programs/{id}" })
	public Program update(@PathVariable("id") Integer id, @RequestBody Program program, HttpServletResponse res) {
		try {
			program = programService.update(program, id);
			if (program == null) {
				res.setStatus(404);

			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
			program = null;
		}

		return program;
	}

	@DeleteMapping(path = { "programs/{id}" })
	public void delete(@PathVariable("id") Integer id, HttpServletResponse res) {
		Program deleted = proRepo.searchById(id);
		try {
			if (deleted.isActive() == true) {
				programService.delete(id);
				res.setStatus(204);
			} else {
				res.setStatus(404);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
