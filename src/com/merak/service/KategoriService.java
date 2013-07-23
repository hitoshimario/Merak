package com.merak.service;

import java.util.List;

import com.merak.entity.Kategori;

public interface KategoriService {
	
	public void save(Kategori kategori);
	
	public List<Kategori> listKategori();
	
	public void delete(Kategori kategori);
	
	public Kategori getKategoriById(int id);

}
