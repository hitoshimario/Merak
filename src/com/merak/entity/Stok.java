package com.merak.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="stok")
public class Stok {
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	int id_stok;
	
	@Column(name="stok")
	int stok;
	
	@Column(name="tgl_stok")
	Date tglStok;

	@ManyToOne
	@JoinColumn(name="id_produk")
	private Produk produk;
		
	
	public Date getTglStok() {
		return tglStok;
	}

	public void setTglStok(Date tglStok) {
		this.tglStok = tglStok;
	}

	public int getId_stok() {
		return id_stok;
	}

	public void setId_stok(int id_stok) {
		this.id_stok = id_stok;
	}


	public Produk getProduk() {
		return produk;
	}

	public void setProduk(Produk produk) {
		this.produk = produk;
	}

	public int getStok() {
		return stok;
	}

	public void setStok(int stok) {
		this.stok = stok;
	}
	
	
}
