package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.Dokter;
import com.merak.service.DokterService;

@Service("dokterService")
@Transactional
public class DokterServiceImpl implements DokterService {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public DokterServiceImpl() {
		
	}

	@Override
	public void save(Dokter dokter) {
		sessionFactory.getCurrentSession().saveOrUpdate(dokter);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Dokter> listDokter() {
		return sessionFactory.getCurrentSession().createQuery("FROM Dokter").list();
	}

	@Override
	public void delete(Dokter dokter) {
		sessionFactory.getCurrentSession().delete(dokter);
	}

	@Override
	public Dokter getDokterById(int id) {
		return (Dokter) sessionFactory.getCurrentSession().get(Dokter.class, id);
	}

}
