package com.skilldistillery.bingeworthy.services;

import java.util.List;

import com.skilldistillery.bingeworthy.entities.Program;

public interface ProgramService {

	List<Program> getAllPrograms();

	Program getProgramById(int id);

	Program create(Program program);

	Program update(Program program);

	boolean delete(int id);
}
