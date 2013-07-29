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
import javax.persistence.OneToMany;
import javax.persistence.Table;




@Entity
@Table(name="produk")
public class Produk implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@Column(name="jml_produk")
	int jmlProduk;
	
	@Column(name="NAMA_PRODUK")
	String namaProduk;
	
	@Column(name="harga")
	double harga;
	
	@ManyToOne
	@JoinColumn(name="id_satuan")
	private Satuan satuan;
	
	@ManyToOne
	@JoinColumn(name="id_kategori")
	private Kategori kategori;
	
	
	@OneToMany(mappedBy="produk")
	private Set<PoDetail> poDetails;
	
	@OneToMany(mappedBy="produk")
	private Set<Stok> stok;
	
	@ManyToMany(mappedBy = "produk")
	private Set<PaketPerawatan> paketPerawatan = new HashSet <PaketPerawatan> ();
	
	public Produk(){}	

	public Set<PaketPerawatan> getPaketPerawatan() {
		return paketPerawatan;
	}



	public void setPaketPerawatan(Set<PaketPerawatan> paketPerawatan) {
		this.paketPerawatan = paketPerawatan;
	}



	public Set<Stok> getStok() {
		return stok;
	}


	public void setStok(Set<Stok> stok) {
		this.stok = stok;
	}


	public int getJmlProduk() {
		return jmlProduk;
	}


	public void setJmlProduk(int jmlProduk) {
		this.jmlProduk = jmlProduk;
	}


	public Set<PoDetail> getPoDetails() {
		return poDetails;
	}


	public void setPoDetails(Set<PoDetail> poDetails) {
		this.poDetails = poDetails;
	}


	public double getHarga() {
		return harga;
	}


	public void setHarga(double harga) {
		this.harga = harga;
	}


	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getNamaProduk() {
		return namaProduk;
	}



	public void setNamaProduk(String namaProduk) {
		this.namaProduk = namaProduk;
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



	

	public String toString(){
		return namaProduk;
	}
	
//	@ManyToMany
//	@JoinTable(name="DISTRIBUTOR",
//				joinColumns={@JoinColumn(name="ID_DISTRIBUTOR")},
//				inverseJoinColumns={@JoinColumn(name="ID_PRODUCT")})
//	private List<Distributor> distributor ;
}
