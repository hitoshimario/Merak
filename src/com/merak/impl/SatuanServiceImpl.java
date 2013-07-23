package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.Satuan;
import com.merak.service.SatuanService;

@Service("satuanService")
@Transactional
public class SatuanServiceImpl implements SatuanService {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public SatuanServiceImpl() {
		
	}

	@Override
	public void save(Satuan satuan) {
		sessionFactory.getCurrentSession().saveOrUpdate(satuan);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Satuan> listSatuan() {
		return sessionFactory.getCurrentSession().createQuery("FROM Satuan").list();
	}

	@Override
	public void delete(Satuan satuan) {
		sessionFactory.getCurrentSession().delete(satuan);
	}

	@Override
	public Satuan getSatuanById(int id) {
		return (Satuan) sessionFactory.getCurrentSession().get(Satuan.class, id);
	}

}
