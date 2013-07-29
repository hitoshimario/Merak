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
import com.merak.util.IdGenerator;

@Controller
@RequestMapping(value="master/*")
public class SusterController {

	@Autowired
	protected SusterService susterService;
	
	//LIST Suster
	@RequestMapping("suster/list")
	public String list(ModelMap modelMap){
		List<Suster> suster = susterService.listSuster();
		modelMap.put("suster", suster);
		return "/master/suster/list";
	}
	
	//ADD Suster
	@RequestMapping(value = "suster/add")
	public String add(ModelMap modelMap) {
		IdGenerator idGenerator = new IdGenerator();
		modelMap.put("idGenerator", idGenerator.getNipSuster());
		return "/master/suster/add";
	}
	
	//SAVE Suster
	@RequestMapping(value = "suster/add", method = RequestMethod.POST)
	public String save(@ModelAttribute Suster suster) {
		susterService.save(suster);
		return "redirect:list";
	}
	
	//FIND BY ID : Suster
	@RequestMapping(value = "suster/detail", method = RequestMethod.GET)
	public String open(@ModelAttribute Suster suster, ModelMap modelMap) {
		suster = susterService.getSusterById(suster.getId());
		modelMap.put("suster", suster);
		return "/master/suster/detail";
	}
	
	// UPDATE Suster
	@RequestMapping(value = "suster/detail", method = RequestMethod.POST)
	public String update(@ModelAttribute Suster suster) {
		susterService.save(suster);
		return "redirect:list";
	}
	
	//DELETE Suster
	@RequestMapping(value = "suster/delete")
	public String delete(@ModelAttribute Suster suster){
		susterService.delete(suster);
		return "redirect:list";
	}
	
}
