package com.merak.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "paket_perawatan")
public class PaketPerawatan implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;

	@Column(name = "nama_paket_perawatan")
	private String namaPaketPerawatan;

	@Column(name = "harga")
	private Double harga;

	@Column(name = "durasi")
	private String durasi;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "paket_perawatan_produk", joinColumns = { @JoinColumn(name = "id_paket_perawatan") }, inverseJoinColumns = { @JoinColumn(name = "id_produk") })
	private Set<Produk> produk = new HashSet<Produk>();

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "paket_perawatan_alat", joinColumns = { @JoinColumn(name = "id_paket_perawatan") }, inverseJoinColumns = { @JoinColumn(name = "id_alat") })
	private Set<Alat> alat = new HashSet<Alat>();

	@ManyToMany(mappedBy = "paketPerawatan")
	private Set<Pelanggan> pelanggan = new HashSet<Pelanggan>();

	@OneToMany(mappedBy = "paketPerawatan")
	private Set<PelangganPaketPerawatan> pelangganPaketPerawatans;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNamaPaketPerawatan() {
		return namaPaketPerawatan;
	}

	public void setNamaPaketPerawatan(String namaPaketPerawatan) {
		this.namaPaketPerawatan = namaPaketPerawatan;
	}

	public Double getHarga() {
		return harga;
	}

	public void setHarga(Double harga) {
		this.harga = harga;
	}

	public String getDurasi() {
		return durasi;
	}

	public void setDurasi(String durasi) {
		this.durasi = durasi;
	}

	public Set<Produk> getProduk() {
		return produk;
	}

	public void setProduk(Set<Produk> produk) {
		this.produk = produk;
	}

	public Set<Alat> getAlat() {
		return alat;
	}

	public void setAlat(Set<Alat> alat) {
		this.alat = alat;
	}

	public Set<PelangganPaketPerawatan> getPelangganPaketPerawatans() {
		return pelangganPaketPerawatans;
	}

	public void setPelangganPaketPerawatans(
			Set<PelangganPaketPerawatan> pelangganPaketPerawatans) {
		this.pelangganPaketPerawatans = pelangganPaketPerawatans;
	}

	public Set<Pelanggan> getPelanggan() {
		return pelanggan;
	}

	public void setPelanggan(Set<Pelanggan> pelanggan) {
		this.pelanggan = pelanggan;
	}

}
