package com.skilldistillery.bingeworthy.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.bingeworthy.entities.Category;
import com.skilldistillery.bingeworthy.entities.Program;
import com.skilldistillery.bingeworthy.repositories.ProgramRepository;

@Service
public class ProgramServiceImpl implements ProgramService {

	@Autowired
	private ProgramRepository proRepo;

	@Override
	public List<Program> getAllPrograms() {
		return proRepo.findByActiveTrue();
	}

	@Override
	public List<Program> getProgramByCategoryId(int id) {
		return proRepo.findProgramByCategoryId(id);
	}

	@Override
	public List<Program> getProgramByPlatformId(int id) {
		return proRepo.findProgramByPlatforms_Id(id);
	}

	@Override
	public Program getProgramById(int id) {
		return proRepo.searchById(id);
	}

	@Override
	public Program create(Program program) {
		Category cat = new Category();
		cat.setId(22);
		program.setCategory(cat);
		program.setActive(true);
		proRepo.saveAndFlush(program);
		return program;
	}

	@Override
	public Program update(Program program, int id) {
		Program updated = proRepo.searchById(id);
		updated.setName(program.getName());
		updated.setDescription(program.getDescription());
		updated.setImageUrl(program.getImageUrl());
		updated.setStillAiring(program.isStillAiring());
		updated.setLength(program.getLength());
		updated.setEpisodeCount(program.getEpisodeCount());
		updated.setTotalRuntime(program.getTotalRuntime());
		updated.setActive(true);
		if (program.getCategory() == null) {
			Category cat = new Category();
			cat.setId(22);

			updated.setCategory(cat);

		} else {
			updated.setCategory(program.getCategory());
		}

		proRepo.save(updated);
		return updated;
	}

	@Override
	public boolean delete(int id) {
		boolean success = false;
		Program deleted = proRepo.searchById(id);
		if (deleted != null) {
			deleted.setActive(false);
		    proRepo.save(deleted);
		    success = true;

		}
		return success;
	}

}
