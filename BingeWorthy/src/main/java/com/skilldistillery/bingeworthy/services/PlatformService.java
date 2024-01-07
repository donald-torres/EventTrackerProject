package com.skilldistillery.bingeworthy.services;

import java.util.List;

import com.skilldistillery.bingeworthy.entities.Platform;

public interface PlatformService {

	List<Platform> index();

	Platform show(int id);

	Platform create(Platform platform);

	Platform update(Platform platform, int id);

}
