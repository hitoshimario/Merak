package com.merak.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "satuan")
public class Satuan implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	
	@Column(name="nama_satuan")
	private String namaSatuan;
	
	@OneToMany(mappedBy="satuan")
	private Set<Produk> produk;
	
	//Konstruktor
	public Satuan() {
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNamaSatuan() {
		return namaSatuan;
	}

	public void setNamaSatuan(String namaSatuan) {
		this.namaSatuan = namaSatuan;
	}

	public Set<Produk> getProduk() {
		return produk;
	}

	public void setProduk(Set<Produk> produk) {
		this.produk = produk;
	}

	public String toString() {
		return namaSatuan;
	}
	
}
