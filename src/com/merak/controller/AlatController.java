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
import com.merak.entity.Satuan;
import com.merak.service.AlatService;
import com.merak.service.SatuanService;

@Controller
@RequestMapping(value="master/*")
public class AlatController {
	
	@Autowired
	private AlatService alatService;
	
	@Autowired
	private SatuanService satuanService;
	
	//LIST Alat
	@RequestMapping("alat/list")
	public String list(ModelMap modelMap){
		List<Alat> alat = alatService.listAlat();
		modelMap.put("alat", alat);
		return "/master/alat/list";
	}
	
	//ADD Alat
	@RequestMapping(value = "alat/add")
	public String add(ModelMap modelMap) {
			
		//buat ambil data dari table satuan
		List<Satuan> satuan = satuanService.listSatuan();
		modelMap.put("satuan", satuan);
			
		return "/master/alat/add";
	}
	
	//SAVE Alat
	@RequestMapping(value = "alat/add", method = RequestMethod.POST)
	public String save(@ModelAttribute Alat alat, BindingResult result) {
		int idSatuan = Integer.parseInt(result.getFieldValue("satuan").toString());
		Satuan s = satuanService.getSatuanById(idSatuan);
			
		alat.setSatuan(s);
		alatService.save(alat);
		return "redirect:list";
	}
	
	// FIND BY ID : Alat
	@RequestMapping(value = "alat/detail", method = RequestMethod.GET)
	public String open(@ModelAttribute Alat alat, ModelMap modelMap) {
			
		//buat ambil data dari table satuan
		List<Satuan> satuan = satuanService.listSatuan();
		modelMap.put("satuan", satuan);
					
		alat = alatService.getAlatById(alat.getId());
		modelMap.put("alat", alat);
		return "/master/alat/detail";
	}
	
	// UPDATE Alat
	@RequestMapping(value = "alat/detail", method = RequestMethod.POST)
	public String update(@ModelAttribute Alat alat, BindingResult result) {
			
		int idSatuan = Integer.parseInt(result.getFieldValue("satuan").toString());
		Satuan s = satuanService.getSatuanById(idSatuan);
		
		alat.setSatuan(s);
			
		alatService.save(alat);
		return "redirect:list";
	}
	
	//DELETE Alat
	@RequestMapping(value = "alat/delete")
	public String delete(@ModelAttribute Alat alat){
		alatService.delete(alat);
		return "redirect:list";
	}

}
