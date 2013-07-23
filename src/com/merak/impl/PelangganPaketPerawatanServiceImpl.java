package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.Pelanggan;
import com.merak.entity.PelangganPaketPerawatan;
import com.merak.service.PelangganPaketPerawatanService;

@Service("pelangganPaketPerawatanService")
@Transactional
public class PelangganPaketPerawatanServiceImpl implements PelangganPaketPerawatanService {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public PelangganPaketPerawatanServiceImpl() {
		
	}

	@Override
	public void save(PelangganPaketPerawatan pelangganPaketPerawatan) {
		sessionFactory.getCurrentSession().saveOrUpdate(pelangganPaketPerawatan);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PelangganPaketPerawatan> listPelangganPaketPerawatan() {
		return sessionFactory.getCurrentSession().createQuery("FROM PelangganPaketPerawatan").list();
	}

	@Override
	public void delete(PelangganPaketPerawatan pelangganPaketPerawatan) {
		sessionFactory.getCurrentSession().delete(pelangganPaketPerawatan);
	}

	@Override
	public PelangganPaketPerawatan getPelangganPaketPerawatanById(int id) {
		return (PelangganPaketPerawatan) sessionFactory.getCurrentSession().get(PelangganPaketPerawatan.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PelangganPaketPerawatan> getAllByPelanggan(Pelanggan pelanggan) {
		Criterion criterion = Restrictions.eq("pelanggan", pelanggan);
		List<PelangganPaketPerawatan> pelangganPaketPerawatan = sessionFactory.getCurrentSession().
				createCriteria(PelangganPaketPerawatan.class).add(criterion).list();
				
		return pelangganPaketPerawatan;
	}

}
