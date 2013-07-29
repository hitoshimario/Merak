package com.merak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merak.entity.Distributor;
import com.merak.service.DistributorService;

@Controller
@RequestMapping(value="master/*")
public class DistributorController {

	
	@Autowired
	private DistributorService distributorService;
	
		
//	untuk listing
	@RequestMapping("distributor/list")
	public String list (ModelMap modelMap){
		List<Distributor> getAll = distributorService.getAll();
		modelMap.put("distributor", getAll.toArray());
		return "/master/distributor/list";
	}
	
	@RequestMapping("distributor/add")
	public String add (){
		return "/master/distributor/add";
	}
	
//	untuk save
	@RequestMapping(value="distributor/add", method =RequestMethod.POST)
	public String save(@ModelAttribute Distributor distributor){
		distributorService.save(distributor);
		return "redirect:list";
	}
	
//	untuk delete
	@RequestMapping("distributor/delete")
	public String delete (@ModelAttribute Distributor distributor){
		distributorService.delete(distributor);
		return "redirect:list";
	}
	

//	untuk update
	@RequestMapping(value="distributor/detail", method=RequestMethod.POST)
	public String update(@ModelAttribute Distributor distributor){
		distributorService.save(distributor);
		return "redirect:list";
	}
	
	
//	untuk listing di edit.jsp dan melakukan update
	@RequestMapping(value="distributor/detail", method = RequestMethod.GET)
	public String listedit (@ModelAttribute Distributor distributor, ModelMap modelMap){
	distributor = distributorService.getDistributorById(distributor.getId());
	modelMap.put("distributor", distributor);
	return "/master/distributor/detail";
	}
	
}

