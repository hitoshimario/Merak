package com.merak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.merak.entity.Perawatan;
import com.merak.entity.RekamMedik;
import com.merak.service.PerawatanService;
import com.merak.service.RekamMedikService;

@Controller
@RequestMapping(value="master/*")
public class RekamMedikController {

	@Autowired
	protected RekamMedikService rekamMedikService;
	
	@Autowired
	protected PerawatanService perawatanService;
	
	//LIST Rekam Medik
	@RequestMapping("rekamMedik/list")
	public String list(@ModelAttribute Perawatan perawatan, ModelMap modelMap){
		
		List<RekamMedik> rekamMedik = rekamMedikService.getAllByPerawatan(perawatan);
		modelMap.put("rekamMedik", rekamMedik);
		
		perawatan = perawatanService.getPerawatanById(perawatan.getId());
		modelMap.put("perawatan", perawatan);
		
		return "/master/rekamMedik/list";
	}
	
	//ADD Rekam Medik
	@RequestMapping(value = "rekamMedik/add")
	public String add(@ModelAttribute Perawatan perawatan, ModelMap modelMap) {
		perawatan = perawatanService.getPerawatanById(perawatan.getId());
		modelMap.put("perawatan", perawatan);
		
		return "/master/rekamMedik/add";
	}
	
	//SAVE Rekam Medik
	@RequestMapping(value = "rekamMedik/add", method = RequestMethod.POST)
	public String save(@ModelAttribute RekamMedik rekamMedik, BindingResult result) {
		int idPerawatan = Integer.parseInt(result.getFieldValue("perawatan").toString());
		
		Perawatan perawatan = perawatanService.getPerawatanById(idPerawatan);
		rekamMedik.setPerawatan(perawatan);
		
		rekamMedikService.save(rekamMedik);
		return "redirect:list?id="+idPerawatan;
	}
	
	//FIND BY ID : Rekam Medik
	@RequestMapping(value = "rekamMedik/detail", method = RequestMethod.GET)
	public String open(@ModelAttribute RekamMedik rekamMedik, ModelMap modelMap) {
		rekamMedik = rekamMedikService.getRekamMedikById(rekamMedik.getId());
		modelMap.put("rekamMedik", rekamMedik);
		return "/master/rekamMedik/detail";
	}
	
	// UPDATE Rekam Medik
	@RequestMapping(value = "rekamMedik/detail", method = RequestMethod.POST)
	public String update(@ModelAttribute RekamMedik rekamMedik) {
		rekamMedikService.save(rekamMedik);
		return "redirect:list";
	}
	
	//DELETE Rekam Medik
	@RequestMapping(value = "rekamMedik/delete")
	public String delete(@ModelAttribute RekamMedik rekamMedik, @RequestParam("idP")int idP){
		rekamMedikService.delete(rekamMedik);
		return "redirect:list?id="+idP;
	}
	
}
