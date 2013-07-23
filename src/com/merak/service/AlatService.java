package com.merak.service;

import java.util.List;

import com.merak.entity.Alat;

public interface AlatService {

	public void save(Alat alat);
	
	public List<Alat> listAlat();
	
	public void delete(Alat alat);
	
	public Alat getAlatById(int id);
	
}
