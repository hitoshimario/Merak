package com.merak.controller;

import java.sql.Date;
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
import com.merak.service.PaketPerawatanService;
import com.merak.service.PelangganService;
import com.merak.util.IdGenerator;

@Controller
@RequestMapping(value="master/*")
public class PelangganController {
	
	@Autowired
	protected PelangganService pelangganService;
	
	@Autowired
	protected PaketPerawatanService paketPerawatanService;
	
	//LIST Pelanggan
	@RequestMapping("pelanggan/list")
	public String listPelanggan(ModelMap modelMap){
		List<Pelanggan> pelanggan = pelangganService.listPelanggan();
		modelMap.put("pelanggan", pelanggan);
		return "/master/pelanggan/list";
	}
	
	//ADD Pelanggan
	@RequestMapping(value = "pelanggan/add")
	public String addPelanggan(ModelMap modelMap) {
		
		IdGenerator idGenerator = new IdGenerator();
		modelMap.put("idGenerator", idGenerator.getNmrPelanggan());
		
		List<PaketPerawatan> paketPerawatan = paketPerawatanService.listPaketPerawatan();
		modelMap.put("paketPerawatan", paketPerawatan);
			
		return "/master/pelanggan/add";
	}
	
	//SAVE Pelanggan
	@RequestMapping(value = "pelanggan/add", method = RequestMethod.POST)
	public String savePelanggan(@ModelAttribute Pelanggan pelanggan, BindingResult result) {
		String[] paketPerawatanList = result.getFieldValue("paketPerawatan").toString().split(",");
		
		for (int i = 0; i < paketPerawatanList.length; i++){
			int idPaketPerawatan = Integer.parseInt(paketPerawatanList[i]);
			PaketPerawatan paketPerawatan = paketPerawatanService.getPaketPerawatanById(idPaketPerawatan);
			pelanggan.getPaketPerawatan().add(paketPerawatan);
		}
			
		pelangganService.save(pelanggan);
		return "redirect:list";
	}
	
	//FIND BY ID : Pelanggan
	@RequestMapping(value = "pelanggan/detail", method = RequestMethod.GET)
	public String openPelanggan(@ModelAttribute Pelanggan pelanggan, ModelMap modelMap) {
			
		List<PaketPerawatan> paketPerawatan = paketPerawatanService.listPaketPerawatan();
		modelMap.put("paketPerawatan",paketPerawatan);
		
		pelanggan = pelangganService.getPelangganById(pelanggan.getId());
		modelMap.put("pelanggan", pelanggan);
		return "/master/pelanggan/detail";
	}
	
	//UPDATE Pelanggan
	@RequestMapping(value = "pelanggan/detail", method = RequestMethod.POST)
	public String updatePelanggan(@RequestParam("id")int id, @RequestParam("nomorPelanggan")String nomorPelanggan,
			@RequestParam("namaAwal")String namaAwal, @RequestParam("namaAkhir")String namaAkhir, 
			@RequestParam("jnsKelamin")int jnsKelamin, @RequestParam("tmpLahir")String tmpLahir, 
			@RequestParam("tglLahir")Date tglLahir, @RequestParam("alamat")String alamat, 
			@RequestParam("telepon")String telepon,	@RequestParam("email")String email) {
			
		pelangganService.update(id, nomorPelanggan, namaAwal, namaAkhir, jnsKelamin, tmpLahir, tglLahir, alamat, telepon, email);
		return "redirect:list";
	}
	
	//DELETE Pelanggan
	@RequestMapping(value = "pelanggan/delete")
	public String deletePelanggan(@ModelAttribute Pelanggan pelanggan){
		pelangganService.delete(pelanggan);
		return "redirect:list";
	}

}
