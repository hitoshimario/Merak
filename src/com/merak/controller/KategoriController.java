package com.merak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merak.entity.Kategori;
import com.merak.service.KategoriService;

@Controller
@RequestMapping(value="master/*")
public class KategoriController {
	
	@Autowired
	private KategoriService kategoriService;
	
	//LIST Kategori
	@RequestMapping("kategori/list")
	public String listKategori(ModelMap modelMap){
		List<Kategori> kategori = kategoriService.listKategori();
		modelMap.put("kategori", kategori);
		return "/master/kategori/list";
	}
		
	//ADD Kategori
	@RequestMapping(value = "kategori/add")
	public String addKategori() {
		return "/master/kategori/add";
	}
		
	//SAVE Kategori
	@RequestMapping(value = "kategori/add", method = RequestMethod.POST)
	public String saveKategori(@ModelAttribute Kategori kategori) {
		kategoriService.save(kategori);
		return "redirect:list";
	}
		
	// FIND BY ID : Kategori
	@RequestMapping(value = "kategori/detail", method = RequestMethod.GET)
	public String openKategori(@ModelAttribute Kategori kategori, ModelMap modelMap) {
		kategori = kategoriService.getKategoriById(kategori.getId());
		modelMap.put("kategori", kategori);
		return "/master/kategori/detail";
	}
			
	// UPDATE Kategori
	@RequestMapping(value = "kategori/detail", method = RequestMethod.POST)
	public String updateKategori(@ModelAttribute Kategori kategori) {
		kategoriService.save(kategori);
		return "redirect:list";
	}
		
	//DELETE Kategori
	@RequestMapping(value = "kategori/delete")
	public String deleteKategori(@ModelAttribute Kategori kategori){
		kategoriService.delete(kategori);
		return "redirect:list";
	}
}
