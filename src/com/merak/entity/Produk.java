package com.merak.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "produk")
public class Produk implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	
	@Column(name="nama_produk")
	private String namaProduk;
	
	@Column(name="jml_produk")
	private String jmlProduk;
	
	@ManyToOne
	@JoinColumn(name="id_satuan")
	private Satuan satuan;
	
	@ManyToOne
	@JoinColumn(name="id_kategori")
	private Kategori kategori;
	
	@ManyToMany(mappedBy = "produk")
    private Set<PaketPerawatan> paketPerawatan = new HashSet<PaketPerawatan>();
	
	//Konstruktor
	public Produk() {
		
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNamaProduk() {
		return namaProduk;
	}

	public void setNamaProduk(String namaProduk) {
		this.namaProduk = namaProduk;
	}

	public String getJmlProduk() {
		return jmlProduk;
	}

	public void setJmlProduk(String jmlProduk) {
		this.jmlProduk = jmlProduk;
	}

	public Satuan getSatuan() {
		return satuan;
	}

	public void setSatuan(Satuan satuan) {
		this.satuan = satuan;
	}

	public Kategori getKategori() {
		return kategori;
	}

	public void setKategori(Kategori kategori) {
		this.kategori = kategori;
	}

	public Set<PaketPerawatan> getPaketPerawatan() {
		return paketPerawatan;
	}

	public void setPaketPerawatan(Set<PaketPerawatan> paketPerawatan) {
		this.paketPerawatan = paketPerawatan;
	}

	public String toString() {
		return namaProduk;
	}
		
}
