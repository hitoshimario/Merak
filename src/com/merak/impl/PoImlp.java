package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.Po;
import com.merak.service.PoService;


@Service("poService")
@Transactional
public class PoImlp implements PoService{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Po po) {
		sessionFactory.getCurrentSession().saveOrUpdate(po);
		
	}

	@Override
	public void delete(Po po) {
		sessionFactory.getCurrentSession().delete(po);
		
	}

	@Override
	public Po getPoById(int id) {
		return (Po) sessionFactory.getCurrentSession().get(Po.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Po> getAll() {
		return sessionFactory.getCurrentSession().createQuery("FROM Po").list();
	}
	
	
}
