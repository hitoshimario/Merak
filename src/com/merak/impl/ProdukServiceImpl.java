package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.Produk;
import com.merak.service.ProdukService;

@Service("produkService")
@Transactional
public class ProdukServiceImpl implements ProdukService {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public ProdukServiceImpl() {
		
	}

	@Override
	public void save(Produk produk) {
		sessionFactory.getCurrentSession().saveOrUpdate(produk);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Produk> listProduk() {
		return sessionFactory.getCurrentSession().createQuery("FROM Produk").list();
	}

	@Override
	public void delete(Produk produk) {
		sessionFactory.getCurrentSession().delete(produk);
	}

	@Override
	public Produk getProdukById(int id) {
		return (Produk) sessionFactory.getCurrentSession().get(Produk.class, id);
	}

}
