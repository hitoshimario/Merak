package com.merak.service;

import java.util.List;

import com.merak.entity.PoDetail;

public interface PoDetailService {

	public void save (PoDetail poDetail);
	
	public void delete (PoDetail poDetail );
	
	public PoDetail getPoDetailById (int id);
	
	public List<PoDetail> getAll();
}
