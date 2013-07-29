package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.Distributor;
import com.merak.service.DistributorService;


@Service("distributorService")
@Transactional
public class DistributorImpl implements DistributorService {
	
	@Autowired 
	protected SessionFactory sessionFactory;
	
	public DistributorImpl(){}
	
	@Override
	@Transactional(readOnly=false)
	public void save(Distributor distributor) {
		sessionFactory.getCurrentSession().saveOrUpdate(distributor);
		
	}

	@Override
	@Transactional(readOnly=false)
	public void delete(Distributor distributor) {
		sessionFactory.getCurrentSession().delete(distributor);
		
	}
	
	
	@Override
	public Distributor getDistributorById(int id) {
		return (Distributor) sessionFactory.getCurrentSession().get(Distributor.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Distributor> getAll() {
		return sessionFactory.getCurrentSession().createQuery("FROM Distributor").list();
	}
	
	

}
