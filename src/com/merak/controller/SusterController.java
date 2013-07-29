package com.merak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merak.entity.Suster;
import com.merak.service.SusterService;

@Controller
@RequestMapping(value="master/*")
public class SusterController {

	@Autowired
	private SusterService susterService;
	
	//List Dokter
	@RequestMapping("suster/list")
	public String listDokter(ModelMap modelMap){
		List<Suster> suster = susterService.listSuster();
		modelMap.put("suster", suster);
		return "/master/suster/list";
	}
	
	//Add Dokter
	@RequestMapping(value = "suster/add")
	public String addSuster(){
		return "/master/suster/list";
	}
	
	//Save Dokter
	@RequestMapping(value="suster/add", method = RequestMethod.POST)
	public String saveSuster(@ModelAttribute Suster suster){
		susterService.save(suster);
		return "redirect:list";
	}
	
	//Find Dokter
	@RequestMapping(value="suster/detail", method = RequestMethod.GET)
	public String openDokter(@ModelAttribute Suster suster, ModelMap modelMap){
		suster = susterService.getSusterById(suster.getId());
		modelMap.put("suster", suster);
		return "/master/suster/detail";
	}
	
	//Update Dokter
	@RequestMapping(value = "suster/detail", method = RequestMethod.POST)
	public String updateSuster(@ModelAttribute Suster suster) {
		susterService.save(suster);
		return "redirect:list";
	}
	
	//DELETE Dokter
	@RequestMapping(value = "suster/delete")
	public String deleteDokter(@ModelAttribute Suster suster){
		susterService.delete(suster);
		return "redirect:list";
	}
}
