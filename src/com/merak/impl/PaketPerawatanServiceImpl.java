package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.PaketPerawatan;
import com.merak.service.PaketPerawatanService;

@Service("paketPerawatan")
@Transactional
public class PaketPerawatanServiceImpl implements PaketPerawatanService {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public PaketPerawatanServiceImpl() {
		
	}

	@Override
	public void save(PaketPerawatan paketPerawatan) {
		sessionFactory.getCurrentSession().saveOrUpdate(paketPerawatan);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PaketPerawatan> listPaketPerawatan() {
		return sessionFactory.getCurrentSession().createQuery("SELECT DISTINCT(pp) FROM PaketPerawatan pp left join fetch pp.produk p left join fetch pp.alat a").list();
	}

	@Override
	public void delete(PaketPerawatan paketPerawatan) {
		sessionFactory.getCurrentSession().delete(paketPerawatan);
	}

	@Override
	public PaketPerawatan getPaketPerawatanById(int id) {
//		return (PaketPerawatan) sessionFactory.getCurrentSession().get(PaketPerawatan.class, id);
		return (PaketPerawatan) sessionFactory.getCurrentSession().
				createQuery("FROM PaketPerawatan pp left join fetch pp.produk p left join fetch pp.alat a WHERE pp.id = :id").
				setParameter("id", id).uniqueResult();
	}

}
