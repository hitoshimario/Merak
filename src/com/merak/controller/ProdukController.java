package com.merak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merak.entity.Kategori;
import com.merak.entity.Produk;
import com.merak.entity.Satuan;
import com.merak.service.KategoriService;
import com.merak.service.ProdukService;
import com.merak.service.SatuanService;

@Controller
@RequestMapping(value="master/*")
public class ProdukController {
	
	@Autowired
	private ProdukService produkService;
	
	@Autowired
	private SatuanService satuanService;
	
	@Autowired
	private KategoriService kategoriService;
	
	//LIST Produk
	@RequestMapping("produk/list")
	public String listProduk(ModelMap modelMap){
		List<Produk> produk = produkService.listProduk();
		modelMap.put("produk", produk);
		return "/master/produk/list";
	}
	
	//ADD Produk
	@RequestMapping(value = "produk/add")
	public String addProduk(ModelMap modelMap) {
		
		//buat ambil data dari table satuan
		List<Satuan> satuan = satuanService.listSatuan();
		modelMap.put("satuan", satuan);
		
		//buat ambil data dari table kategori
		List<Kategori> kategori = kategoriService.listKategori();
		modelMap.put("kategori", kategori);
		
		return "/master/produk/add";
	}
	
	//SAVE Produk
	@RequestMapping(value = "produk/add", method = RequestMethod.POST)
	public String saveProduk(@ModelAttribute Produk produk, BindingResult result) {
//		System.out.println(result.getFieldValue("satuan"));
		int idSatuan = Integer.parseInt(result.getFieldValue("satuan").toString());
//		int idSatuan = (Integer) result.getFieldValue("satuan"); --> downcast
		Satuan s = satuanService.getSatuanById(idSatuan);
		
		int idKategori = Integer.parseInt(result.getFieldValue("kategori").toString());
		Kategori k = kategoriService.getKategoriById(idKategori);
		
		produk.setSatuan(s);
		produk.setKategori(k);
		produkService.save(produk);
		return "redirect:list";
	}
	
	// FIND BY ID : Produk
	@RequestMapping(value = "produk/detail", method = RequestMethod.GET)
	public String openProduk(@ModelAttribute Produk produk, ModelMap modelMap) {
		
		//buat ambil data dari table satuan
		List<Satuan> satuan = satuanService.listSatuan();
		modelMap.put("satuan", satuan);
				
		//buat ambil data dari table kategori
		List<Kategori> kategori = kategoriService.listKategori();
		modelMap.put("kategori", kategori);
		
		produk = produkService.getProdukById(produk.getId());
		modelMap.put("produk", produk);
		return "/master/produk/detail";
	}
			
	// UPDATE Produk
	@RequestMapping(value = "produk/detail", method = RequestMethod.POST)
	public String updateProduk(@ModelAttribute Produk produk, BindingResult result) {
		
		int idSatuan = Integer.parseInt(result.getFieldValue("satuan").toString());
		Satuan s = satuanService.getSatuanById(idSatuan);
		
		int idKategori = Integer.parseInt(result.getFieldValue("kategori").toString());
		Kategori k = kategoriService.getKategoriById(idKategori);
		
		produk.setSatuan(s);
		produk.setKategori(k);
		
		produkService.save(produk);
		return "redirect:list";
	}
		
	//DELETE Produk
	@RequestMapping(value = "produk/delete")
	public String deleteProduk(@ModelAttribute Produk produk){
		produkService.delete(produk);
		return "redirect:list";
	}
	
}
