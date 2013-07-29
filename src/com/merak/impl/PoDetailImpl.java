package com.merak.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merak.entity.PoDetail;
import com.merak.service.PoDetailService;


@Service("poDetailService")
@Transactional
public class PoDetailImpl implements PoDetailService {

	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(PoDetail poDetail) {		
		sessionFactory.getCurrentSession().saveOrUpdate(poDetail);
				
	}
	

	@Override
	public void delete(PoDetail poDetail) {
		sessionFactory.getCurrentSession().delete(poDetail);
		
	}

	@Override
	public PoDetail getPoDetailById(int id) {
		return (PoDetail)sessionFactory.getCurrentSession().get(PoDetail.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PoDetail> getAll() {
		return sessionFactory.getCurrentSession()
				.createSQLQuery("SELECT  a.stok, a.harga, a.total, b.nama_produk, f.nama_satuan, c.nmr_po, d.nama_distributor, c.tgl_po " +
				"FROM po_detail a JOIN produk b "
				+"ON a.id_produk = b.id JOIN po c ON a.id_po = c.id JOIN distributor d ON c.id_distributor = d.id JOIN satuan f ON f.id = b.id_satuan ").list();
	}


//	@Override
//	public void updateStok(int id) {
//		sessionFactory.getCurrentSession().createSQLQuery("UPDATE stok SET stok =?  WHERE id= "+id).executeUpdate();
//		
//	}
	
}
