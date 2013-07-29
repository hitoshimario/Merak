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
@Table(name="distributor")
public class Distributor implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	int id;
	
	@Column(name="NAMA_DISTRIBUTOR")
	String namaDistributor;
	
	@Column(name="ALAMAT")
	String alamat;
	
	@Column(name="TELEPON")
	String telepon;
	
	@Column(name="EMAIL")
	String email;
	// nama mapped harus kecil sesuain sama table sqlnya
	
	@OneToMany(mappedBy="distributor")
	private Set <Po> po;
	
	public Set<Po> getPo() {
		return po;
	}

	public void setPo(Set<Po> po) {
		this.po = po;
	}

	public Distributor (){}

	

	public int getId() {
		return id;
	}

	public String getNamaDistributor() {
		return namaDistributor;
	}

	public void setNamaDistributor(String namaDistributor) {
		this.namaDistributor = namaDistributor;
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

	public void setId(int id) {
		this.id = id;
	}

	public String toString(){
		return namaDistributor;
	}
	
	
}
