package com.merak.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="po")
public class Po implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@Column(name="NMR_PO")
	private String nmrPo;
	
	
	@Column(name="tgl_po")
	private Date tglPo;
	
	@ManyToOne
	@JoinColumn(name="id_distributor")
	private Distributor distributor;
	
	@OneToMany(mappedBy="po")
	private Set<PoDetail> PoDetail;
	
	public Po (){}	
	
	
	public Set<PoDetail> getPoDetail() {
		return PoDetail;
	}

	public void setPoDetail(Set<PoDetail> poDetail) {
		PoDetail = poDetail;
	}

	public Date getTglPo() {
		return tglPo;
	}



	public void setTglPo(Date tglPo) {
		this.tglPo = tglPo;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNmrPo() {
		return nmrPo;
	}

	public void setNmrPo(String nmrPo) {
		this.nmrPo = nmrPo;
	}


	public Distributor getDistributor() {
		return distributor;
	}

	public void setDistributor(Distributor distributor) {
		this.distributor = distributor;
	}
	
	public String toString(){
		return nmrPo;
	}
	
}
