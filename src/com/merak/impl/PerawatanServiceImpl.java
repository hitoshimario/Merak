package com.merak.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.PelangganPaketPerawatan;
import com.merak.entity.Perawatan;
import com.merak.service.PerawatanService;

@Service("perawatanService")
@Transactional
public class PerawatanServiceImpl implements PerawatanService {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public PerawatanServiceImpl() {
		
	}

	@Override
	public void save(Perawatan perawatan) {
		sessionFactory.getCurrentSession().saveOrUpdate(perawatan);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Perawatan> listPerawatan() {
		return sessionFactory.getCurrentSession().
				createQuery("FROM Perawatan p left join fetch p.dokter d left join fetch p.suster s").list();
	}

	@Override
	public void delete(Perawatan perawatan) {
		sessionFactory.getCurrentSession().delete(perawatan);
	}

	@Override
	public Perawatan getPerawatanById(int id) {
		return (Perawatan) sessionFactory.getCurrentSession().
				createQuery("FROM Perawatan p left join fetch p.dokter d left join fetch p.suster s WHERE p.id = :id").
				setParameter("id", id).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Perawatan> getAllByPPP(PelangganPaketPerawatan pelangganPaketPerawatan) {
		Query q = sessionFactory.getCurrentSession().createQuery("FROM Perawatan p left join fetch p.dokter d left join fetch p.suster s WHERE p.pelangganPaketPerawatan = :pelangganPaketPerawatan");
		q.setParameter("pelangganPaketPerawatan", pelangganPaketPerawatan);
		List<Perawatan> perawatan = q.list();
		return perawatan;
	}

}
