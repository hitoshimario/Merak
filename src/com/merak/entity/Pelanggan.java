package com.merak.entity;

import java.io.Serializable;
import java.sql.Date;
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
@Table(name = "pelanggan")
@org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Pelanggan implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	
	@Column(name="nmr_pelanggan")
	private String nomorPelanggan;
	
	@Column(name="nama_awal")
	private String namaAwal;
	
	@Column(name="nama_akhir")
	private String namaAkhir;
	
	@Column(name="jns_kelamin")
	private int jnsKelamin;
	
	@Column(name="tgl_lahir")
	private Date tglLahir;
	
	@Column(name="tmp_lahir")
	private String tmpLahir;
	
	@Column(name="alamat")
	private String alamat;
	
	@Column(name="telepon")
	private String telepon;
	
	@Column(name="email")
	private String email;
	
	//ke table pelanggan_paket_perawatan
	@OneToMany(mappedBy="pelanggan")
	private Set<PelangganPaketPerawatan> pelangganPaketPerawatan;
	
	//ke table paket Perawatan
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "pelanggan_paket_perawatan",
				joinColumns = {@JoinColumn(name = "id_pelanggan")},
				inverseJoinColumns = {@JoinColumn(name = "id_paket_perawatan")})
	private Set<PaketPerawatan> paketPerawatan = new HashSet<PaketPerawatan>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNomorPelanggan() {
		return nomorPelanggan;
	}

	public void setNomorPelanggan(String nomorPelanggan) {
		this.nomorPelanggan = nomorPelanggan;
	}

	public String getNamaAwal() {
		return namaAwal;
	}

	public void setNamaAwal(String namaAwal) {
		this.namaAwal = namaAwal;
	}

	public String getNamaAkhir() {
		return namaAkhir;
	}

	public void setNamaAkhir(String namaAkhir) {
		this.namaAkhir = namaAkhir;
	}
	
	public int getJnsKelamin() {
		return jnsKelamin;
	}

	public void setJnsKelamin(int jnsKelamin) {
		this.jnsKelamin = jnsKelamin;
	}

	public Date getTglLahir() {
		return tglLahir;
	}

	public void setTglLahir(Date tglLahir) {
		this.tglLahir = tglLahir;
	}

	public String getTmpLahir() {
		return tmpLahir;
	}

	public void setTmpLahir(String tmpLahir) {
		this.tmpLahir = tmpLahir;
	}

	public String getAlamat() {
		return alamat;
	}

	public void setAlamat(String alamat) {
		this.alamat = alamat;
	}

	public String getTelepon() {
		return telepon;
	}

	public void setTelepon(String telepon) {
		this.telepon = telepon;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set<PelangganPaketPerawatan> getPelangganPaketPerawatan() {
		return pelangganPaketPerawatan;
	}

	public void setPelangganPaketPerawatan(
			Set<PelangganPaketPerawatan> pelangganPaketPerawatan) {
		this.pelangganPaketPerawatan = pelangganPaketPerawatan;
	}

	public Set<PaketPerawatan> getPaketPerawatan() {
		return paketPerawatan;
	}

	public void setPaketPerawatan(Set<PaketPerawatan> paketPerawatan) {
		this.paketPerawatan = paketPerawatan;
	}
	
}
