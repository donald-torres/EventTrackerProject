package com.skilldistillery.bingeworthy.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class ProgramTest {

	private static EntityManagerFactory emf;
	private EntityManager em;

	private Program program;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPABingeWorthy");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		program = em.find(Program.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		program = null;
	}

	@Test
	void test_initial_mapping() {
		assertNotNull(program);
		assertEquals("Supernatural", program.getName());
	}

	@Test
	void test_many_to_one_mapping() {
		assertNotNull(program);
		assertEquals("Action", program.getCategory().getType());
	}

	@Test
	void test_many_to_many_mapping() {
		assertNotNull(program);
		assertTrue(program.getPlatforms().size() > 0);
	}

}
