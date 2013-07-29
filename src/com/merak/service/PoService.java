package com.merak.service;

import java.util.List;

import com.merak.entity.Po;

public interface PoService {

	public void save(Po po);
	
	public void delete(Po po);
	
	public Po getPoById(int id);
	
	public List<Po> getAll();
}
