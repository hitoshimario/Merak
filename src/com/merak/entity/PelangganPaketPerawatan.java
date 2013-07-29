package com.merak.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "pelanggan_paket_perawatan")
public class PelangganPaketPerawatan implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name="id_pelanggan")
	private Pelanggan pelanggan;
	
	@ManyToOne
	@JoinColumn(name="id_paket_perawatan")
	private PaketPerawatan paketPerawatan;
	
	@OneToMany(mappedBy="pelangganPaketPerawatan")
	private Set<Perawatan> perawatan;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Pelanggan getPelanggan() {
		return pelanggan;
	}

	public void setPelanggan(Pelanggan pelanggan) {
		this.pelanggan = pelanggan;
	}

	public PaketPerawatan getPaketPerawatan() {
		return paketPerawatan;
	}

	public void setPaketPerawatan(PaketPerawatan paketPerawatan) {
		this.paketPerawatan = paketPerawatan;
	}

	public Set<Perawatan> getPerawatan() {
		return perawatan;
	}

	public void setPerawatan(Set<Perawatan> perawatan) {
		this.perawatan = perawatan;
	}

}
