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

@Controller
@RequestMapping(value="master/*")
public class DokterController {

	@Autowired
	private DokterService dokterService;
	
	//List Dokter
	@RequestMapping("dokter/list")
	public String listDokter(ModelMap modelMap){
		List<Dokter> dokter = dokterService.listDokter();
		modelMap.put("dokter", dokter);
		return "/master/dokter/list";
	}
	
	//Add Dokter
	@RequestMapping(value = "dokter/add")
	public String addDokter(){
		return "/master/dokter/list";
	}
	
	//Save Dokter
	@RequestMapping(value="dokter/add", method = RequestMethod.POST)
	public String saveDokter(@ModelAttribute Dokter dokter){
		dokterService.save(dokter);
		return "redirect:list";
	}
	
	//Find Dokter
	@RequestMapping(value="dokter/detail", method = RequestMethod.GET)
	public String openDokter(@ModelAttribute Dokter dokter, ModelMap modelMap){
		dokter = dokterService.getDokterById(dokter.getId());
		modelMap.put("dokter", dokter);
		return "/master/dokter/detail";
	}
	
	//Update Dokter
	@RequestMapping(value = "dokter/detail", method = RequestMethod.POST)
	public String updateDokter(@ModelAttribute Dokter dokter) {
		dokterService.save(dokter);
		return "redirect:list";
	}
	
	//DELETE Dokter
	@RequestMapping(value = "dokter/delete")
	public String deleteDokter(@ModelAttribute Dokter dokter){
		dokterService.delete(dokter);
		return "redirect:list";
	}
}
