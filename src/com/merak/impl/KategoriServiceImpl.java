package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.Kategori;
import com.merak.service.KategoriService;

@Service("kategoriService")
@Transactional
public class KategoriServiceImpl implements KategoriService {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public KategoriServiceImpl() {
		
	}

	@Override
	public void save(Kategori kategori) {
		sessionFactory.getCurrentSession().saveOrUpdate(kategori);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Kategori> listKategori() {
		return sessionFactory.getCurrentSession().createQuery("FROM Kategori").list();
	}

	@Override
	public void delete(Kategori kategori) {
		sessionFactory.getCurrentSession().delete(kategori);
	}

	@Override
	public Kategori getKategoriById(int id) {
		return (Kategori) sessionFactory.getCurrentSession().get(Kategori.class, id);
	}

}
