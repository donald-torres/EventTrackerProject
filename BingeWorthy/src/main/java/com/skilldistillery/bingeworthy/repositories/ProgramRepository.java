package com.skilldistillery.bingeworthy.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.bingeworthy.entities.Program;

public interface ProgramRepository extends JpaRepository<Program, Integer> {

	List<Program> findByActiveTrue();

	List<Program> findByActiveFalse();

	Program searchById(int id);

	List<Program> findProgramByPlatforms_Id(int id);

	List<Program> findProgramByCategoryId(int id);
}
