package com.merak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merak.entity.Alat;
import com.merak.entity.PaketPerawatan;
import com.merak.entity.Produk;
import com.merak.service.AlatService;
import com.merak.service.PaketPerawatanService;
import com.merak.service.ProdukService;

@Controller
@RequestMapping(value="master/*")
public class PaketPerawatanController {
	
	@Autowired
	protected PaketPerawatanService paketPerawatanService;
	
	@Autowired
	protected ProdukService produkService;
	
	@Autowired
	protected AlatService alatService;
	
	//LIST Paket Perawatan
	@RequestMapping("paketPerawatan/list")
	public String list(ModelMap modelMap){
		List<PaketPerawatan> paketPerawatan = paketPerawatanService.listPaketPerawatan();
		modelMap.put("paketPerawatan", paketPerawatan);
		return "/master/paketPerawatan/list";
	}
	
	//ADD Paket Perawatan
	@RequestMapping(value = "paketPerawatan/add")
	public String add(ModelMap modelMap) {
		
		List<Produk> produk = produkService.listProduk();
		modelMap.put("produk", produk);
		
		List<Alat> alat = alatService.listAlat();
		modelMap.put("alat", alat);
				
		return "/master/paketPerawatan/add";
	}
	
	//SAVE Paket Perawatan
	@RequestMapping(value = "paketPerawatan/add", method = RequestMethod.POST)
	public String save(@ModelAttribute PaketPerawatan paketPerawatan, BindingResult result) {
		
		String[] produkList = result.getFieldValue("produk").toString().split(",");
		String[] alatList = result.getFieldValue("alat").toString().split(",");
		/*System.out.println(produkList[0]);
		System.out.println(produkList[1]);*/
		
		/*for (int i = 0; i < produkList.length; i++){
			System.out.println("Array ke" + i + " = "+ produkList[i]);
		}*/
		
		/*int idProduk = Integer.parseInt(result.getFieldValue("produk").toString());
		Produk p = produkService.getProdukById(idProduk);*/
		
		/*int idAlat = Integer.parseInt(result.getFieldValue("alat").toString());
		Alat a = alatService.getAlatById(idAlat);*/
		
//		Set<Produk> produk = new HashSet<Produk>();
		for (int i = 0; i < produkList.length; i++){
			int idProduk = Integer.parseInt(produkList[i]);
			Produk p = produkService.getProdukById(idProduk);
//			produk.add(p);
			paketPerawatan.getProduk().add(p);
		}
		
//		Set<Alat> alat = new HashSet<Alat>();
		for (int i = 0; i < alatList.length; i++){
			int idAlat = Integer.parseInt(alatList[i]);
			Alat a = alatService.getAlatById(idAlat);
//			alat.add(a);
			paketPerawatan.getAlat().add(a);
		}
		
//		paketPerawatan.setAlat(alat);
		
		paketPerawatanService.save(paketPerawatan);
		return "redirect:list";
	}
	
	// FIND BY ID : Paket Perawatan
	@RequestMapping(value = "paketPerawatan/detail", method = RequestMethod.GET)
	public String open(@ModelAttribute PaketPerawatan paketPerawatan, ModelMap modelMap) {
		
		List<Produk> produk = produkService.listProduk();
		modelMap.put("produk", produk);
		
		List<Alat> alat = alatService.listAlat();
		modelMap.put("alat", alat);
		
		paketPerawatan = paketPerawatanService.getPaketPerawatanById(paketPerawatan.getId());
		modelMap.put("paketPerawatan", paketPerawatan);
		return "/master/paketPerawatan/detail";
	}
	
	// UPDATE Paket Perawatan
	@RequestMapping(value = "paketPerawatan/detail", method = RequestMethod.POST)
	public String update(@ModelAttribute PaketPerawatan paketPerawatan, BindingResult result) {
		
		String[] produkList = result.getFieldValue("produk").toString().split(",");
		String[] alatList = result.getFieldValue("alat").toString().split(",");
		
		for (int i = 0; i < produkList.length; i++){
			int idProduk = Integer.parseInt(produkList[i]);
			Produk p = produkService.getProdukById(idProduk);
			paketPerawatan.getProduk().add(p);
		}
		
		for (int i = 0; i < alatList.length; i++){
			int idAlat = Integer.parseInt(alatList[i]);
			Alat a = alatService.getAlatById(idAlat);
			paketPerawatan.getAlat().add(a);
		}
		
		paketPerawatanService.save(paketPerawatan);
		return "redirect:list";
	}
	
	//DELETE Paket Perawatan
	@RequestMapping(value = "paketPerawatan/delete")
	public String delete(@ModelAttribute PaketPerawatan paketPerawatan){
		paketPerawatanService.delete(paketPerawatan);
		return "redirect:list";
	}
}
