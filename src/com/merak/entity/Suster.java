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
@Table(name="suster")
public class Suster implements Serializable{
	private static final long serialVersionUID = 1L;

	public Suster(){
	}
	
	@Id
	@GeneratedValue
	@Column(name="id")
	Integer id;
	
	@Column(name="nip_suster")
	String nipSuster;
	
	@Column(name="nama_awal")
	String namaAwal;
	
	@Column(name="nama_akhir")
	String namaAkhir;
	
	@Column(name="tgl_lahir")
	Date tglLahir;
	
	@Column(name="tmp_lahir")
	String tmpLahir;
	
	@Column(name="alamat")
	String alamat;
	
	@Column(name="telepon")
	String telepon;
	
	@Column(name="email")
	String email;
	
	@Column(name="jns_kelamin")
	Integer jnsKelamin;

/*	@ManyToMany(mappedBy="suster")
	private Set<Perawatan> perawatan = new HashSet<Perawatan>();*/
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNipSuster() {
		return nipSuster;
	}

	public void setNipSuster(String nipSuster) {
		this.nipSuster = nipSuster;
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

	public Integer getJnsKelamin() {
		return jnsKelamin;
	}

	public void setJnsKelamin(Integer jnsKelamin) {
		this.jnsKelamin = jnsKelamin;
	}

/*	public Set<Perawatan> getPerawatan() {
		return perawatan;
	}

	public void setPerawatan(Set<Perawatan> perawatan) {
		this.perawatan = perawatan;
	}*/

}