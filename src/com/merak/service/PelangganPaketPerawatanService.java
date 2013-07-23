package com.merak.service;

import java.util.List;

import com.merak.entity.Pelanggan;
import com.merak.entity.PelangganPaketPerawatan;

public interface PelangganPaketPerawatanService {

	public void save(PelangganPaketPerawatan pelangganPaketPerawatan);
	
	public List<PelangganPaketPerawatan> listPelangganPaketPerawatan();
	
	public void delete(PelangganPaketPerawatan pelangganPaketPerawatan);
	
	public PelangganPaketPerawatan getPelangganPaketPerawatanById(int id);
	
	public List<PelangganPaketPerawatan> getAllByPelanggan(Pelanggan pelanggan);
	
}
