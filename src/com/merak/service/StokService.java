package com.merak.service;

import java.util.List;

import com.merak.entity.Stok;

public interface StokService {
	
	public void update (int id);
	
	public void delete (Stok stok);
	
	public void save (Stok stok);
	
	public List<Stok> getAll();
	
	public Stok getStokById (int id);

}
