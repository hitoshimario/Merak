package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.PaketPerawatan;
import com.merak.entity.Perawatan;
import com.merak.service.PerawatanService;

@Service("perawatanService")
@Transactional
public class PerawatanServiceImpl implements PerawatanService {

	@Autowired
	protected SessionFactory sessionFactory;

	@Override
	public void save(Perawatan perawatan) {
		sessionFactory.getCurrentSession().saveOrUpdate(perawatan);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Perawatan> listPerawatan() {
		return sessionFactory.getCurrentSession().createQuery("FROM Perawatan").list();
	}

	@Override
	public void delete(Perawatan perawatan) {
		sessionFactory.getCurrentSession().delete(perawatan);
	}

	@Override
	public Perawatan getPerawatanById(int id) {
		return (Perawatan) sessionFactory.getCurrentSession().get(Perawatan.class, id);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Perawatan> listByPelangganPaketPerawatan(
			int idPelangganPaketPerawatan) {
		Criterion c = Restrictions.eq("pelangganPaketPerawatan", idPelangganPaketPerawatan);
		List<Perawatan> perawatans = sessionFactory.getCurrentSession().createCriteria(Perawatan.class).add(c).list();
		return perawatans;
	}
	
}
