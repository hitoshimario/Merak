package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.Stok;
import com.merak.service.StokService;


@Service("stokService")
@Transactional
public class StokImpl implements StokService{

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public void update(int id) {
		sessionFactory.getCurrentSession().createSQLQuery("UPDATE stok SET stok =?  WHERE id= "+id).executeUpdate();
		
	}

	@Override
	public void save(Stok stok) {
		sessionFactory.getCurrentSession().saveOrUpdate(stok);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Stok> getAll() {
		return sessionFactory.getCurrentSession().createQuery("FROM Stok").list();
	}

	@Override
	public Stok getStokById(int id) {
		return (Stok) sessionFactory.getCurrentSession().get(Stok.class, id);
	}

	@Override
	public void delete(Stok stok) {
		sessionFactory.getCurrentSession().delete(stok);
		
	}

}
