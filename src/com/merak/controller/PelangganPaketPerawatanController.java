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

import com.merak.entity.PaketPerawatan;
import com.merak.entity.Pelanggan;
import com.merak.entity.PelangganPaketPerawatan;
import com.merak.service.PaketPerawatanService;
import com.merak.service.PelangganPaketPerawatanService;
import com.merak.service.PelangganService;

@Controller
@RequestMapping(value="master/*")
public class PelangganPaketPerawatanController {
	
	@Autowired
	protected PelangganPaketPerawatanService pelangganPaketPerawatanService;
	
	@Autowired
	protected PelangganService pelangganService;
	
	@Autowired
	protected PaketPerawatanService paketPerawatanService;
	
	public PelangganPaketPerawatanController() {
		
	}
	
	//LIST PelangganPaketPerawatan
	@RequestMapping("pelangganPaketPerawatan/list")
	public String list(@ModelAttribute Pelanggan pelanggan, ModelMap modelMap){
		
		List<PelangganPaketPerawatan> pelangganPaketPerawatan = pelangganPaketPerawatanService.listPelangganPaketPerawatan();
		modelMap.put("pelangganPaketPerawatan", pelangganPaketPerawatan);
		
		pelanggan = pelangganService.getPelangganById(pelanggan.getId());
		modelMap.put("pelanggan", pelanggan);
		
		List<PelangganPaketPerawatan> paketPerawatanList = pelangganPaketPerawatanService.getAllByPelanggan(pelanggan);
		modelMap.put("pelangganPaketPerawatan", paketPerawatanList);
		
		return "/master/pelangganPaketPerawatan/list";
	}
	
	//ADD PelangganPaketPerawatan
	@RequestMapping(value = "pelangganPaketPerawatan/add", method = RequestMethod.GET)
	public String add(@ModelAttribute Pelanggan pelanggan, ModelMap modelMap) {

		List<PaketPerawatan> paketPerawatan = paketPerawatanService.listPaketPerawatan();
		modelMap.put("paketPerawatan",paketPerawatan);
		
		pelanggan = pelangganService.getPelangganById(pelanggan.getId());
		modelMap.put("pelanggan", pelanggan);
				
		return "/master/pelangganPaketPerawatan/add";
	}
	
	//SAVE PelangganPaketPerawatan
	@RequestMapping(value = "pelangganPaketPerawatan/add", method = RequestMethod.POST)
	public String save(@ModelAttribute PelangganPaketPerawatan pelangganPaketPerawatan, BindingResult result) {
		
		int idPelanggan = Integer.parseInt(result.getFieldValue("pelanggan").toString());
		Pelanggan pelanggan = pelangganService.getPelangganById(idPelanggan);
		
		int idPaketPerawatan = Integer.parseInt(result.getFieldValue("paketPerawatan").toString());
		PaketPerawatan paketPerawatan = paketPerawatanService.getPaketPerawatanById(idPaketPerawatan);
		
		pelangganPaketPerawatan.setPelanggan(pelanggan);
		pelangganPaketPerawatan.setPaketPerawatan(paketPerawatan);
				
		pelangganPaketPerawatanService.save(pelangganPaketPerawatan);
		return "redirect:list?id="+idPelanggan;
	}
		
	//DELETE Pelanggan Paket Perawatan
	@RequestMapping(value = "pelangganPaketPerawatan/delete")
	public String delete(@ModelAttribute PelangganPaketPerawatan pelangganPaketPerawatan, @RequestParam("idPlg")int idPlg){
		pelangganPaketPerawatanService.delete(pelangganPaketPerawatan);
		return "redirect:list?id="+idPlg;
	}
	
}
