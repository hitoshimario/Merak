package com.merak.impl;

import java.util.List;

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
		return (Pelanggan) sessionFactory.getCurrentSession().get(Pelanggan.class, id);
	}

}
