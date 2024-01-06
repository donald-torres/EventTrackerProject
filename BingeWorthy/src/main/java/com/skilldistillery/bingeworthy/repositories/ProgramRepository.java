package com.skilldistillery.bingeworthy.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.bingeworthy.entities.Program;

public interface ProgramRepository extends JpaRepository<Program, Integer> {

	Program searchById(int id);
}
