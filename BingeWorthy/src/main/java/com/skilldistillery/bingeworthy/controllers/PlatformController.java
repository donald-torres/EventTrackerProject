package com.skilldistillery.bingeworthy.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.bingeworthy.entities.Platform;
import com.skilldistillery.bingeworthy.services.PlatformService;

import jakarta.servlet.http.HttpServletResponse;

@CrossOrigin({"*", "http://localhost/"})
@RestController
@RequestMapping("api")
public class PlatformController {

	@Autowired
	private PlatformService platformService;

	@GetMapping(path = { "platforms", "platforms/" })
	public List<Platform> index() {
		return platformService.index();
	}

	@GetMapping(path = { "platforms/{id}" })
	public Platform show(@PathVariable("id") Integer id, HttpServletResponse res) {
		Platform single = platformService.show(id);
		if (single == null) {
			res.setStatus(404);
		}

		return single;
	}

	@PostMapping(path = { "platforms" })
	public Platform create(@RequestBody Platform platform, HttpServletResponse res) {
		Platform newPlatform;
		try {
			newPlatform = platformService.create(platform);
			res.setStatus(201);
			res.setHeader("Location", "http://localhost:8083/api/platforms/" + newPlatform.getId());
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
			newPlatform = null;
		}
		return newPlatform;
	}

	@PutMapping(path = { "platforms/{id}" })
	public Platform update(@PathVariable("id") Integer id, @RequestBody Platform platform, HttpServletResponse res) {
		try {
			platform = platformService.update(platform, id);
			if (platform == null) {
				res.setStatus(404);

			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
			platform = null;
		}

		return platform;
	}

}
