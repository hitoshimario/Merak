package com.merak.service;

import java.util.List;

import com.merak.entity.PelangganPaketPerawatan;
import com.merak.entity.Perawatan;

public interface PerawatanService {

	public void save(Perawatan perawatan);
	
	public List<Perawatan> listPerawatan();
	
	public void delete(Perawatan perawatan);
	
	public Perawatan getPerawatanById(int id);
	
	public List<Perawatan> getAllByPPP(PelangganPaketPerawatan pelangganPaketPerawatan);
	
}
