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
@Table(name = "kategori")
public class Kategori implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	
	@Column(name="nama_kategori")
	private String namaKategori;
	
	@OneToMany(mappedBy="kategori")
	private Set<Produk> produk;
	
	//Konstruktor
	public Kategori() {
		
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNamaKategori() {
		return namaKategori;
	}

	public void setNamaKategori(String namaKategori) {
		this.namaKategori = namaKategori;
	}

	public Set<Produk> getProduk() {
		return produk;
	}

	public void setProduk(Set<Produk> produk) {
		this.produk = produk;
	}

	public String toString() {
		return namaKategori;
	}

}
