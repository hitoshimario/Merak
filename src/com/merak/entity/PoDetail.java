package com.merak.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="po_detail")
public class PoDetail implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="id_po")
	private Po po;
	
	@ManyToOne
	@JoinColumn(name="id_produk")
	private Produk produk;
	
	@Column(name="stok")
	private int stok;
	
	@Column(name="harga")
	private double harga;
	
	@Column(name="total")
	private double total;
	
	public PoDetail(){}
	
	
	public Po getPo() {
		return po;
	}


	public void setPo(Po po) {
		this.po = po;
	}


	public Produk getProduk() {
		return produk;
	}


	public void setProduk(Produk produk) {
		this.produk = produk;
	}


	public double getTotal() {
		return total;
	}


	public void setTotal(double total) {
		this.total = total;
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

	public int getStok() {
		return stok;
	}

	public void setStok(int stok) {
		this.stok = stok;
	}
	
//	public String tosString(){
//		return stok;
//	}
}
