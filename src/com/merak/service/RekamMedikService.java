package com.merak.service;

import java.util.List;

import com.merak.entity.Perawatan;
import com.merak.entity.RekamMedik;

public interface RekamMedikService {

	public void save(RekamMedik rekamMedik);
	
	public List<RekamMedik> listRekamMedik();
	
	public void delete(RekamMedik rekamMedik);
	
	public RekamMedik getRekamMedikById(int id);
	
	public List<RekamMedik> getAllByPerawatan(Perawatan perawatan);
	
}
