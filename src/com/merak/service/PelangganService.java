package com.merak.service;

import java.util.List;

import com.merak.entity.Pelanggan;

public interface PelangganService {

	public void save(Pelanggan pelanggan);
	
	public List<Pelanggan> listPelanggan();
	
	public void delete(Pelanggan pelanggan);
	
	public Pelanggan getPelangganById(int id);
	
}
