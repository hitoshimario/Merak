package com.merak.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "dokter")
public class Dokter implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	
	@Column(name="nip_dokter")
	private String nipDokter;
	
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
	
	@ManyToMany(mappedBy = "dokter")
    private Set<Perawatan> perawatan = new HashSet<Perawatan>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNipDokter() {
		return nipDokter;
	}

	public void setNipDokter(String nipDokter) {
		this.nipDokter = nipDokter;
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

	public Set<Perawatan> getPerawatan() {
		return perawatan;
	}

	public void setPerawatan(Set<Perawatan> perawatan) {
		this.perawatan = perawatan;
	}
	
}
