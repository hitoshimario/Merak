package com.merak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merak.entity.Dokter;
import com.merak.service.DokterService;
import com.merak.util.IdGenerator;

@Controller
@RequestMapping(value="master/*")
public class DokterController {
	
	@Autowired
	protected DokterService dokterService;
	
	//LIST Dokter
	@RequestMapping("dokter/list")
	public String list(ModelMap modelMap){
		List<Dokter> dokter = dokterService.listDokter();
		modelMap.put("dokter", dokter);
		return "/master/dokter/list";
	}
	
	//ADD Dokter
	@RequestMapping(value = "dokter/add")
	public String add(ModelMap modelMap) {
		IdGenerator idGenerator = new IdGenerator();
		modelMap.put("idGenerator", idGenerator.getNipDokter());
		return "/master/dokter/add";
	}
	
	//SAVE Dokter
	@RequestMapping(value = "dokter/add", method = RequestMethod.POST)
	public String save(@ModelAttribute Dokter dokter) {
		dokterService.save(dokter);
		return "redirect:list";
	}
	
	//FIND BY ID : Dokter
	@RequestMapping(value = "dokter/detail", method = RequestMethod.GET)
	public String open(@ModelAttribute Dokter dokter, ModelMap modelMap) {
		dokter = dokterService.getDokterById(dokter.getId());
		modelMap.put("dokter", dokter);
		return "/master/dokter/detail";
	}
	
	// UPDATE Dokter
	@RequestMapping(value = "dokter/detail", method = RequestMethod.POST)
	public String update(@ModelAttribute Dokter dokter) {
		dokterService.save(dokter);
		return "redirect:list";
	}
	
	//DELETE Pelanggan
	@RequestMapping(value = "dokter/delete")
	public String delete(@ModelAttribute Dokter dokter){
		dokterService.delete(dokter);
		return "redirect:list";
	}
	
}
