package com.merak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merak.entity.Pelanggan;
import com.merak.service.PelangganService;
import com.merak.util.IdGenerator;

@Controller
@RequestMapping(value="master/*")
public class PelangganController {
	
	@Autowired
	protected PelangganService pelangganService;
	
	//LIST Pelanggan
	@RequestMapping("pelanggan/list")
	public String list(ModelMap modelMap){
		List<Pelanggan> pelanggan = pelangganService.listPelanggan();
		modelMap.put("pelanggan", pelanggan);
		return "/master/pelanggan/list";
	}
	
	//ADD Pelanggan
	@RequestMapping(value = "pelanggan/add")
	public String add(ModelMap modelMap) {
		IdGenerator idGenerator = new IdGenerator();
		modelMap.put("idGenerator", idGenerator.getNmrPelanggan());
		return "/master/pelanggan/add";
	}
	
	//SAVE Pelanggan
	@RequestMapping(value = "pelanggan/add", method = RequestMethod.POST)
	public String save(@ModelAttribute Pelanggan pelanggan) {
		pelangganService.save(pelanggan);
		return "redirect:list";
	}
	
	//FIND BY ID : Pelanggan
	@RequestMapping(value = "pelanggan/detail", method = RequestMethod.GET)
	public String open(@ModelAttribute Pelanggan pelanggan, ModelMap modelMap) {
		pelanggan = pelangganService.getPelangganById(pelanggan.getId());
		modelMap.put("pelanggan", pelanggan);
		return "/master/pelanggan/detail";
	}
	
	// UPDATE Pelanggan
	@RequestMapping(value = "pelanggan/detail", method = RequestMethod.POST)
	public String update(@ModelAttribute Pelanggan pelanggan) {
		pelangganService.save(pelanggan);
		return "redirect:list";
	}
	
	//DELETE Pelanggan
	@RequestMapping(value = "pelanggan/delete")
	public String delete(@ModelAttribute Pelanggan pelanggan){
		pelangganService.delete(pelanggan);
		return "redirect:list";
	}

}
