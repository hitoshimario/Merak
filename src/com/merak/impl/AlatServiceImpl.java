package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.Alat;
import com.merak.service.AlatService;

@Service("alatService")
@Transactional
public class AlatServiceImpl implements AlatService {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public AlatServiceImpl() {
		
	}

	@Override
	public void save(Alat alat) {
		sessionFactory.getCurrentSession().saveOrUpdate(alat);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Alat> listAlat() {
		return sessionFactory.getCurrentSession().createQuery("FROM Alat").list();
	}

	@Override
	public void delete(Alat alat) {
		sessionFactory.getCurrentSession().delete(alat);
	}

	@Override
	public Alat getAlatById(int id) {
		return (Alat) sessionFactory.getCurrentSession().get(Alat.class, id);
	}

}
