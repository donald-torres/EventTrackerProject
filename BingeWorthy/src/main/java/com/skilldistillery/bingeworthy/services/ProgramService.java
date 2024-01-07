package com.skilldistillery.bingeworthy.services;

import java.util.List;

import com.skilldistillery.bingeworthy.entities.Program;

public interface ProgramService {

	List<Program> getAllPrograms();

	Program getProgramById(int id);

	List<Program> getProgramByCategoryId(int id);

	List<Program> getProgramByPlatformId(int id);

	Program create(Program program);

	Program update(Program program, int id);

	boolean delete(int id);
}
