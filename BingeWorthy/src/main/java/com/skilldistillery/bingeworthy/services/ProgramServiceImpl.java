package com.skilldistillery.bingeworthy.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.bingeworthy.entities.Program;
import com.skilldistillery.bingeworthy.repositories.ProgramRepository;

@Service
public class ProgramServiceImpl implements ProgramService {

	@Autowired
	private ProgramRepository proRepo;
	
	
	@Override
	public List<Program> getAllPrograms() {
		return proRepo.findAll();
	}

	@Override
	public Program getProgramById(int id) {
		return proRepo.searchById(id);
	}

	@Override
	public Program create(Program program) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Program update(Program program) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
