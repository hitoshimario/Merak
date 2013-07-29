package com.merak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merak.entity.Satuan;
import com.merak.service.SatuanService;

@Controller
@RequestMapping(value="master/*")
public class SatuanController {
	
	@Autowired
	private SatuanService satuanService;
	
	//LIST Satuan
	@RequestMapping("satuan/list")
	public String list(ModelMap modelMap){
		List<Satuan> satuan = satuanService.listSatuan();
		modelMap.put("satuan", satuan);
		return "/master/satuan/list";
	}
	
	//ADD Satuan
	@RequestMapping(value = "satuan/add")
	public String add() {
		return "/master/satuan/add";
	}
	
	//SAVE Satuan
	@RequestMapping(value = "satuan/add", method = RequestMethod.POST)
	public String saveSatuan(@ModelAttribute Satuan satuan) {
		satuanService.save(satuan);
		return "redirect:list";
	}
	
	// FIND BY ID : Satuan
	@RequestMapping(value = "satuan/detail", method = RequestMethod.GET)
	public String open(@ModelAttribute Satuan satuan, ModelMap modelMap) {
		satuan = satuanService.getSatuanById(satuan.getId());
		modelMap.put("satuan", satuan);
		return "/master/satuan/detail";
	}
		
	// UPDATE Satuan
	@RequestMapping(value = "satuan/detail", method = RequestMethod.POST)
	public String update(@ModelAttribute Satuan satuan) {
		satuanService.save(satuan);
		return "redirect:list";
	}
	
	//DELETE Satuan
	@RequestMapping(value = "satuan/delete")
	public String delete(@ModelAttribute Satuan satuan){
		satuanService.delete(satuan);
		return "redirect:list";
	}

}
