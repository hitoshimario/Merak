package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.Perawatan;
import com.merak.entity.RekamMedik;
import com.merak.service.RekamMedikService;

@Service("rekamMedikService")
@Transactional
public class RekamMedikServiceImpl implements RekamMedikService {

	@Autowired
	protected SessionFactory sessionFactory;
	
	public RekamMedikServiceImpl() {
		
	}
	
	@Override
	public void save(RekamMedik rekamMedik) {
		sessionFactory.getCurrentSession().saveOrUpdate(rekamMedik);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RekamMedik> listRekamMedik() {
		return sessionFactory.getCurrentSession().createQuery("FROM RekamMedik").list();
	}

	@Override
	public void delete(RekamMedik rekamMedik) {
		sessionFactory.getCurrentSession().delete(rekamMedik);
	}

	@Override
	public RekamMedik getRekamMedikById(int id) {
		return (RekamMedik) sessionFactory.getCurrentSession().get(RekamMedik.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RekamMedik> getAllByPerawatan(Perawatan perawatan) {
		Criterion criterion = Restrictions.eq("perawatan", perawatan);
		List<RekamMedik> rekamMedik = sessionFactory.getCurrentSession().
				createCriteria(RekamMedik.class).add(criterion).list();
				
		return rekamMedik;
	}

}
