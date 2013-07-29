package com.merak.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merak.entity.Dokter;
import com.merak.entity.PaketPerawatan;
import com.merak.entity.Pelanggan;
import com.merak.entity.PelangganPaketPerawatan;
import com.merak.entity.Perawatan;
import com.merak.entity.Suster;
import com.merak.service.DokterService;
import com.merak.service.PelangganPaketPerawatanService;
import com.merak.service.PelangganService;
import com.merak.service.PerawatanService;
import com.merak.service.SusterService;

@Controller
@RequestMapping(value="master/*")
public class PerawatanController{
	
	@Autowired
	protected PelangganService pelangganService;
	
	@Autowired
	protected PerawatanService perawatanService;
	
	@Autowired
	protected DokterService dokterService;
	
	@Autowired
	protected SusterService susterService;
		
	public PerawatanController(){}
	
	//ListPerawatan
	@RequestMapping("perawatan/list")
	public String listPerawatan(@ModelAttribute Pelanggan pelanggan, ModelMap modelMap){
		List<Perawatan> perawatanList = perawatanService.listByPelangganPaketPerawatan(pelanggan.getId());
		modelMap.put("perawatan", perawatanList);
		pelanggan = pelangganService.getPelangganById(pelanggan.getId());
		modelMap.put("pelanggan", pelanggan);
		List<Dokter> dokter = dokterService.listDokter();
		modelMap.put("dokter", dokter);
		List<Suster> suster = susterService.listSuster();
		modelMap.put("suster", suster);
		return "master/perawatan/list";
		
	}
	
	//AddPerawatan
	@RequestMapping(value = "perawatan/add")
	public String addPerawatan(ModelMap modelMap){
		
		List<Dokter> dokter = dokterService.listDokter();
		modelMap.put("dokter", dokter);
		
		List<Suster> suster = susterService.listSuster();
		modelMap.put("suster", suster);
		
		SimpleDateFormat format = new SimpleDateFormat("yy-mm-dd");
		return "/master/perawatan/add";
	}
	
	//SavePerawatan
	@RequestMapping(value = "perawatan/add", method = RequestMethod.POST)
	public String savePerawatan(@ModelAttribute Perawatan perawatan, PelangganPaketPerawatan pelangganPaketPerawatan, BindingResult result){
		String[] dokterList = result.getFieldValue("suster").toString().split(",");
		String[] susterList = result.getFieldValue("dokter").toString().split(",");

		for (int i = 0; i < dokterList.length; i++){
			int idDokter = Integer.parseInt(dokterList[i]);
			Dokter d = dokterService.getDokterById(idDokter);
//			produk.add(p);
			perawatan.getDokter().add(d);
		}
		
//		Set<Alat> alat = new HashSet<Alat>();
		for (int i = 0; i < susterList.length; i++){
			int idSuster = Integer.parseInt(susterList[i]);
			Suster s = susterService.getSusterById(idSuster);
//			produk.add(p);
			perawatan.getSuster().add(s);
		}
		
//		paketPerawatan.setAlat(alat);
		perawatanService.save(perawatan);
		return "redirect:list";
	}
	
	@RequestMapping(value = "perawatan/detail", method = RequestMethod.GET)
	public String openPerawatan(@ModelAttribute Perawatan perawatan, ModelMap modelMap){
		List<Dokter> dokter = dokterService.listDokter();
		modelMap.put("dokter", dokter);
		
		List<Suster> suster = susterService.listSuster();
		modelMap.put("suster", suster);
		
		perawatan = perawatanService.getPerawatanById(perawatan.getId());
		modelMap.put("perawatan", perawatan);
		
		return "/master/perawatan/detail";
	}
	
	//UpdatePerawatan
	@RequestMapping(value = "perawatan/detail", method = RequestMethod.POST)
	public String updatePerawatan(@ModelAttribute Perawatan perawatan, BindingResult result){
		String[] dokterList = result.getFieldValue("suster").toString().split(",");
		String[] susterList = result.getFieldValue("dokter").toString().split(",");

		for (int i = 0; i < dokterList.length; i++){
			int idDokter = Integer.parseInt(dokterList[i]);
			Dokter d = dokterService.getDokterById(idDokter);
//			produk.add(p);
			perawatan.getDokter().add(d);
		}
		
//		Set<Alat> alat = new HashSet<Alat>();
		for (int i = 0; i < susterList.length; i++){
			int idSuster = Integer.parseInt(susterList[i]);
			Suster s = susterService.getSusterById(idSuster);
//			produk.add(p);
			perawatan.getSuster().add(s);
		}
		
//		paketPerawatan.setAlat(alat);
		perawatanService.save(perawatan);
		return "redirect:list";
	}
	
	//DeletePerawatan
	@RequestMapping(value="perawatan/delete")
	public String deletePerawatan(@ModelAttribute Perawatan perawatan){
		perawatanService.delete(perawatan);
		return "redirect:list";
	}
}
