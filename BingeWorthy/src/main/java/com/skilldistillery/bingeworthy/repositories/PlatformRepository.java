package com.skilldistillery.bingeworthy.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.bingeworthy.entities.Platform;

public interface PlatformRepository extends JpaRepository<Platform, Integer> {

	Platform searchById(int id);
}
