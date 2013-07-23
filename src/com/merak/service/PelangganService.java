package com.merak.service;

import java.sql.Date;
import java.util.List;

import com.merak.entity.Pelanggan;

public interface PelangganService {

	public void save(Pelanggan pelanggan);
	
	public List<Pelanggan> listPelanggan();
	
	public void delete(Pelanggan pelanggan);
	
	public Pelanggan getPelangganById(int id);
	
	public void update(int id, String nomorPelanggan, String namaAwal, String namaAkhir, int jnsKelamin, String tmpLahir, Date tglLahir, String alamat, String telepon, String email);
	
}
