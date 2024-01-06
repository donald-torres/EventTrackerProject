package com.skilldistillery.bingeworthy.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.bingeworthy.entities.Program;
import com.skilldistillery.bingeworthy.services.ProgramService;

import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("api")
public class ProgramController {

	@Autowired
	private ProgramService programService;
	
	@GetMapping(path = {"programs", "programs/"})
	public List<Program> index(){
		return programService.getAllPrograms();
	}
	@GetMapping(path = {"programs/{id}"})
	public Program show(@PathVariable("id") Integer id, HttpServletResponse res){
		return programService.getProgramById(id);
	}
	
}
