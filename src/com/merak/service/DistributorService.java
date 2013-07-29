package com.merak.service;

import java.util.List;

import com.merak.entity.Distributor;

public interface DistributorService {

	
	public void save (Distributor distributor);
	
	public void delete (Distributor distributor);
	
	public Distributor getDistributorById(int id);
	
	public List<Distributor> getAll();
	
}
