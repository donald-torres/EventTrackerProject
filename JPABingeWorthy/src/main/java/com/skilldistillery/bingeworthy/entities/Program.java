package com.skilldistillery.bingeworthy.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Program {
	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY )
	private int id;
	private String name;
	private String description;
	@Column(name="image_url")
	private String imageUrl;
	
	@Column(name="still_airing")
	private boolean stillAiring;
	private Integer length;
	
	@Column(name="episode_count")
	private Integer episodeCount;
	
	@Column(name="total_runtime")
	private Integer totalRuntime;

	private boolean active;

	

	public Program() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public boolean isStillAiring() {
		return stillAiring;
	}

	public void setStillAiring(boolean stillAiring) {
		this.stillAiring = stillAiring;
	}

	public Integer getLength() {
		return length;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

	public Integer getEpisodeCount() {
		return episodeCount;
	}

	public void setEpisodeCount(Integer episodeCount) {
		this.episodeCount = episodeCount;
	}

	public Integer getTotalRuntime() {
		return totalRuntime;
	}

	public void setTotalRuntime(Integer totalRuntime) {
		this.totalRuntime = totalRuntime;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Program other = (Program) obj;
		return id == other.id;
	}
	@Override
	public String toString() {
		return "Program [id=" + id + ", name=" + name + ", description=" + description + ", imageUrl=" + imageUrl
				+ ", stillAiring=" + stillAiring + ", length=" + length + ", episodeCount=" + episodeCount
				+ ", totalRuntime=" + totalRuntime + ", active=" + active + "]";
	}

}
