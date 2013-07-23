package com.merak.service;

import java.util.List;

import com.merak.entity.Satuan;

public interface SatuanService {
	
	public void save(Satuan satuan);
	
	public List<Satuan> listSatuan();
	
	public void delete(Satuan satuan);
	
	public Satuan getSatuanById(int id);

}
