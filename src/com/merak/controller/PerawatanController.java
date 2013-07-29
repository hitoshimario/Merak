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

import com.merak.entity.Dokter;
import com.merak.entity.PelangganPaketPerawatan;
import com.merak.entity.Perawatan;
import com.merak.entity.Suster;
import com.merak.service.DokterService;
import com.merak.service.PelangganPaketPerawatanService;
import com.merak.service.PerawatanService;
import com.merak.service.SusterService;

@Controller
@RequestMapping(value="master/*")
public class PerawatanController {

	@Autowired
	protected PerawatanService perawatanService;
	
	@Autowired
	protected PelangganPaketPerawatanService pelangganPaketPerawatanService;
	
	@Autowired
	protected DokterService dokterService;
	
	@Autowired
	protected SusterService susterService;
	
	//LIST Perawatan
	@RequestMapping("perawatan/list")
	public String list(@ModelAttribute PelangganPaketPerawatan pelangganPaketPerawatan, ModelMap modelMap){
		
		List<Perawatan> perawatan = perawatanService.getAllByPPP(pelangganPaketPerawatan);
		modelMap.put("perawatan", perawatan);
		
		pelangganPaketPerawatan = pelangganPaketPerawatanService.getPelangganPaketPerawatanById(pelangganPaketPerawatan.getId());
		modelMap.put("pelangganPaketPerawatan", pelangganPaketPerawatan);
		
		/*pelanggan = pelangganService.getPelangganById(pelanggan.getId());
		modelMap.put("pelanggan", pelanggan);*/
		
		return "/master/perawatan/list";
	}
		
	//ADD Perawatan
	@RequestMapping(value = "perawatan/add")
	public String add(@ModelAttribute PelangganPaketPerawatan pelangganPaketPerawatan, ModelMap modelMap) {
		
		List<Dokter> dokter  = dokterService.listDokter();
		modelMap.put("dokter", dokter);
		
		List<Suster> suster = susterService.listSuster();
		modelMap.put("suster", suster);
		
		pelangganPaketPerawatan = pelangganPaketPerawatanService.getPelangganPaketPerawatanById(pelangganPaketPerawatan.getId());
		modelMap.put("pelangganPaketPerawatan", pelangganPaketPerawatan);
		
		return "/master/perawatan/add";
	}
		
	//SAVE Perawatan
	@RequestMapping(value = "perawatan/add", method = RequestMethod.POST)
	public String save(@ModelAttribute Perawatan perawatan, BindingResult result) {
		int idPpp = Integer.parseInt(result.getFieldValue("pelangganPaketPerawatan").toString());
		
		PelangganPaketPerawatan ppp = pelangganPaketPerawatanService.getPelangganPaketPerawatanById(idPpp);
		perawatan.setPelangganPaketPerawatan(ppp);
		
		String[] dokterList = result.getFieldValue("dokter").toString().split(",");
		String[] susterList = result.getFieldValue("suster").toString().split(",");
			
		for (int i = 0; i < dokterList.length; i++){
			int idDokter = Integer.parseInt(dokterList[i]);
			Dokter d = dokterService.getDokterById(idDokter);
			perawatan.getDokter().add(d);
		}
		
		for (int i = 0; i < susterList.length; i++){
			int idSuster = Integer.parseInt(susterList[i]);
			Suster s = susterService.getSusterById(idSuster);
			perawatan.getSuster().add(s);
		}
		perawatanService.save(perawatan);
		return "redirect:list?id="+idPpp;
	}
		
	//FIND BY ID : Perawatan
	@RequestMapping(value = "perawatan/detail", method = RequestMethod.GET)
	public String open(@ModelAttribute Perawatan perawatan, ModelMap modelMap) {
		
		List<Dokter> dokter  = dokterService.listDokter();
		modelMap.put("dokter", dokter);
		
		List<Suster> suster = susterService.listSuster();
		modelMap.put("suster", suster);
		
		perawatan = perawatanService.getPerawatanById(perawatan.getId());
		modelMap.put("perawatan", perawatan);
		return "/master/perawatan/detail";
	}
		
	// UPDATE Perawatan
	@RequestMapping(value = "perawatan/detail", method = RequestMethod.POST)
	public String update(@ModelAttribute Perawatan perawatan) {
		perawatanService.save(perawatan);
		return "redirect:list";
	}
		
	//DELETE Perawatan
	@RequestMapping(value = "perawatan/delete")
	public String delete(@ModelAttribute Perawatan perawatan, @RequestParam("idPpp")int idPpp){
		perawatanService.delete(perawatan);
		return "redirect:list?id="+idPpp;
	}
		
}
