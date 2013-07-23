package com.merak.service;

import java.util.List;

import com.merak.entity.Suster;

public interface SusterService {
	public void save(Suster suster);
	
	public List<Suster> listSuster();
	
	public void delete(Suster suster);
	
	public Suster getSusterById(int id);

}
