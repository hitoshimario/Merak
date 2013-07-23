package com.merak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String listPelangganPaketPerawatan(@ModelAttribute Pelanggan pelanggan, ModelMap modelMap){
		
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
	public String addPelangganPaketPerawatan(@ModelAttribute Pelanggan pelanggan, ModelMap modelMap) {

		List<PaketPerawatan> paketPerawatan = paketPerawatanService.listPaketPerawatan();
		modelMap.put("paketPerawatan",paketPerawatan);
		
		pelanggan = pelangganService.getPelangganById(pelanggan.getId());
		modelMap.put("pelanggan", pelanggan);
				
		return "/master/pelangganPaketPerawatan/add";
	}
	
	//SAVE PelangganPaketPerawatan
	@RequestMapping(value = "pelangganPaketPerawatan/add", method = RequestMethod.POST)
	public String savePelangganPaketPerawatan(@ModelAttribute PelangganPaketPerawatan pelangganPaketPerawatan, BindingResult result) {
		
		int idPelanggan = Integer.parseInt(result.getFieldValue("pelanggan").toString());
		Pelanggan pelanggan = pelangganService.getPelangganById(idPelanggan);
		
		int idPaketPerawatan = Integer.parseInt(result.getFieldValue("paketPerawatan").toString());
		PaketPerawatan paketPerawatan = paketPerawatanService.getPaketPerawatanById(idPaketPerawatan);
		
		pelangganPaketPerawatan.setPelanggan(pelanggan);
		pelangganPaketPerawatan.setPaketPerawatan(paketPerawatan);
				
		pelangganPaketPerawatanService.save(pelangganPaketPerawatan);
		return "redirect:list?id="+idPelanggan+"";
	}
	
	/*//FIND BY ID : Pelanggan Paket Perawatan
	@RequestMapping(value = "pelangganPaketPerawatan/detail", method = RequestMethod.GET)
	public String openPelangganPaketPerawatan(@ModelAttribute PelangganPaketPerawatan pelangganPaketPerawatan, ModelMap modelMap) {
		
		//buat ambil data dari table pelanggan
		List<Pelanggan> pelanggan = pelangganService.listPelanggan();
		modelMap.put("pelanggan", pelanggan);
		
		//buat ambil data dari table paket perawatan
		List<PaketPerawatan> paketPerawatan = paketPerawatanService.listPaketPerawatan();
		modelMap.put("paketPerawatan", paketPerawatan);
		
		pelangganPaketPerawatan = pelangganPaketPerawatanService.getPelangganPaketPerawatanById(pelangganPaketPerawatan.getId());
		modelMap.put("pelangganPaketPerawatan", pelangganPaketPerawatan);
		return "/master/produk/detail";
	}
	
	//UPDATE Pelanggan Paket Perawatan
	@RequestMapping(value = "pelangganPaketPerawatan/detail", method = RequestMethod.POST)
	public String updatePelangganPaketPerawatan(@ModelAttribute PelangganPaketPerawatan pelangganPaketPerawatan, BindingResult result) {
			
		int idPelanggan = Integer.parseInt(result.getFieldValue("pelanggan").toString());
		Pelanggan pelanggan = pelangganService.getPelangganById(idPelanggan);
			
		int idPaketPerawatan = Integer.parseInt(result.getFieldValue("paketPerawatan").toString());
		PaketPerawatan paketPerawatan = paketPerawatanService.getPaketPerawatanById(idPaketPerawatan);

		pelangganPaketPerawatan.setPelanggan(pelanggan);
		pelangganPaketPerawatan.setPaketPerawatan(paketPerawatan);

		pelangganPaketPerawatanService.save(pelangganPaketPerawatan);
		return "redirect:list";
	}*/
	
	//DELETE Pelanggan Paket Perawatan
	@RequestMapping(value = "pelangganPaketPerawatan/delete")
	public String deletePelangganPaketPerawatan(@ModelAttribute PelangganPaketPerawatan pelangganPaketPerawatan){
		pelangganPaketPerawatanService.delete(pelangganPaketPerawatan);
		return "redirect:list";
	}
	
}
