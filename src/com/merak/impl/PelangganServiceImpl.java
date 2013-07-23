package com.merak.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.Pelanggan;
import com.merak.service.PelangganService;

@Service("pelangganService")
@Transactional
public class PelangganServiceImpl implements PelangganService {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public PelangganServiceImpl() {
		
	}

	@Override
	public void save(Pelanggan pelanggan) {
		sessionFactory.getCurrentSession().saveOrUpdate(pelanggan);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pelanggan> listPelanggan() {
		return sessionFactory.getCurrentSession().createQuery("FROM Pelanggan").list();
	}

	@Override
	public void delete(Pelanggan pelanggan) {
		sessionFactory.getCurrentSession().delete(pelanggan);
	}

	@Override
	public Pelanggan getPelangganById(int id) {
		return (Pelanggan) sessionFactory.getCurrentSession().
				createQuery("FROM Pelanggan p left join fetch p.pelangganPaketPerawatan ppp WHERE p.id = :id").setParameter("id", id).uniqueResult();
	}

	@Override
	public void update(int id, String nomorPelanggan, String namaAwal, String namaAkhir, int jnsKelamin , String tmpLahir, Date tglLahir, String alamat, String telepon, String email) {
		
		Query q = sessionFactory.getCurrentSession().createQuery("FROM Pelanggan where id = :id");
		q.setParameter("id", id);
		Pelanggan pelanggan = (Pelanggan)q.list().get(0);
		 
		pelanggan.setNomorPelanggan(nomorPelanggan);
		pelanggan.setNamaAwal(namaAwal);
		pelanggan.setNamaAkhir(namaAkhir);
		pelanggan.setJnsKelamin(jnsKelamin);
		pelanggan.setTmpLahir(tmpLahir);
		pelanggan.setTglLahir(tglLahir);
		pelanggan.setAlamat(alamat);
		pelanggan.setTelepon(telepon);
		pelanggan.setEmail(email);
				
		sessionFactory.getCurrentSession().update(pelanggan);
	}

}
