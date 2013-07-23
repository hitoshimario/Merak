package com.merak.service;

import java.util.List;

import com.merak.entity.PaketPerawatan;

public interface PaketPerawatanService {
	
	public void save(PaketPerawatan paketPerawatan);
	
	public List<PaketPerawatan> listPaketPerawatan();
	
	public void delete(PaketPerawatan paketPerawatan);
	
	public PaketPerawatan getPaketPerawatanById(int id);
	
}
