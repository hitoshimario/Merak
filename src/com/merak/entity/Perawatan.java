package com.merak.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
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
import javax.persistence.Table;

@Entity
@Table(name = "perawatan")
public class Perawatan implements Serializable {
	private static final long serialVersionUID = 1L;

	public Perawatan() {
	}

	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;

	@Column(name = "tgl_perawatan")
	private Date tglPerawatan;

	@Column(name = "jam_mulai")
	private Time jamMulai;

	@Column(name = "jam_akhir")
	private Time jamAkhir;

	@Column(name = "visit_ke")
	private Integer visitKe;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "perawatan_dokter", joinColumns = { @JoinColumn(name = "id_perawatan") }, inverseJoinColumns = { @JoinColumn(name = "id_dokter") })
	private Set<Dokter> dokter = new HashSet<Dokter>();

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "perawatan_suster", joinColumns = { @JoinColumn(name = "id_perawatan") }, inverseJoinColumns = { @JoinColumn(name = "id_suster") })
	private Set<Suster> suster = new HashSet<Suster>();

	@Column(name="id_pelanggan_paket_perawatan")
	private int pelangganPaketPerawatan;
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getTglPerawatan() {
		return tglPerawatan;
	}

	public void setTglPerawatan(Date tglPerawatan) {
		this.tglPerawatan = tglPerawatan;
	}

	public Time getJamMulai() {
		return jamMulai;
	}

	public void setJamMulai(Time jamMulai) {
		this.jamMulai = jamMulai;
	}

	public Time getJamAkhir() {
		return jamAkhir;
	}

	public void setJamAkhir(Time jamAkhir) {
		this.jamAkhir = jamAkhir;
	}

	public Integer getVisitKe() {
		return visitKe;
	}

	public void setVisitKe(Integer visitKe) {
		this.visitKe = visitKe;
	}

	public Set<Dokter> getDokter() {
		return dokter;
	}

	public void setDokter(Set<Dokter> dokter) {
		this.dokter = dokter;
	}

	public Set<Suster> getSuster() {
		return suster;
	}

	public void setSuster(Set<Suster> suster) {
		this.suster = suster;
	}

	public int getPelangganPaketPerawatan() {
		return pelangganPaketPerawatan;
	}

	public void setPelangganPaketPerawatan(
			int pelangganPaketPerawatan) {
		this.pelangganPaketPerawatan = pelangganPaketPerawatan;
	}

}