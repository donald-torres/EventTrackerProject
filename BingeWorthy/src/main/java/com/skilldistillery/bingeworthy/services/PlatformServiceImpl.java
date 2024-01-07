package com.skilldistillery.bingeworthy.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.bingeworthy.entities.Platform;
import com.skilldistillery.bingeworthy.repositories.PlatformRepository;

@Service
public class PlatformServiceImpl implements PlatformService {

	@Autowired
	private PlatformRepository platRepo;

	@Override
	public List<Platform> index() {
		return platRepo.findAll();
	}

	@Override
	public Platform show(int id) {
		return platRepo.searchById(id);
	}

	@Override
	public Platform create(Platform platform) {
		return platRepo.saveAndFlush(platform);
	}

	@Override
	public Platform update(Platform platform, int id) {
		Platform updated = platRepo.searchById(id);
		updated.setName(platform.getName());
		return platRepo.save(updated);
	}

}
