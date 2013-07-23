package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.Suster;
import com.merak.service.SusterService;

@Service("susterService")
@Transactional
public class SusterServiceImpl implements SusterService {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public SusterServiceImpl() {
		
	}

	@Override
	public void save(Suster suster) {
		sessionFactory.getCurrentSession().saveOrUpdate(suster);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Suster> listSuster() {
		return sessionFactory.getCurrentSession().createQuery("FROM Suster").list();
	}

	@Override
	public void delete(Suster suster) {
		sessionFactory.getCurrentSession().delete(suster);
	}

	@Override
	public Suster getSusterById(int id) {
		return (Suster) sessionFactory.getCurrentSession().get(Suster.class, id);
	}

}
