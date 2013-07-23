package com.merak.service;

import java.util.List;

import com.merak.entity.Produk;

public interface ProdukService {
	
	public void save(Produk produk);
	
	public List<Produk> listProduk();
	
	public void delete(Produk produk);
	
	public Produk getProdukById(int id);
	
}
