package com.merak.service;

import java.util.List;

import com.merak.entity.Dokter;

public interface DokterService {
	
	public void save(Dokter dokter);
	
	public List<Dokter> listDokter();
	
	public void delete(Dokter dokter);
	
	public Dokter getDokterById(int id);
	
}
