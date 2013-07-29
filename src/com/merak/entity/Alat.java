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
@Table(name="alat")
public class Alat implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;
	
	@Column(name = "nama_alat")
	private String namaAlat;
	
	@Column(name = "jml_alat")
	private int jmlAlat;
	
	//relasi ke table satuan
	@ManyToOne
	@JoinColumn(name="id_satuan")
	private Satuan satuan;
	
	//relasi ke table paket perawatan
	@ManyToMany(mappedBy = "alat")
    private Set<PaketPerawatan> paketPerawatan = new HashSet<PaketPerawatan>();
	
	//Konstruktor
	public Alat() {
		
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNamaAlat() {
		return namaAlat;
	}

	public void setNamaAlat(String namaAlat) {
		this.namaAlat = namaAlat;
	}

	public int getJmlAlat() {
		return jmlAlat;
	}

	public void setJmlAlat(int jmlAlat) {
		this.jmlAlat = jmlAlat;
	}

	public Satuan getSatuan() {
		return satuan;
	}

	public void setSatuan(Satuan satuan) {
		this.satuan = satuan;
	}

	public Set<PaketPerawatan> getPaketPerawatan() {
		return paketPerawatan;
	}

	public void setPaketPerawatan(Set<PaketPerawatan> paketPerawatan) {
		this.paketPerawatan = paketPerawatan;
	}

	public String toString() {
		return namaAlat;
	}
}
