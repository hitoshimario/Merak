package com.merak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.merak.entity.Produk;
import com.merak.entity.Stok;
import com.merak.service.ProdukService;
import com.merak.service.StokService;


@Controller
@RequestMapping(value="master/*")
public class StokController {
	
	@Autowired
	private StokService stokService;
	
	@Autowired
	private ProdukService produkService;
	
	@RequestMapping(value="stok/list")
	public String listing(ModelMap modelMap){
		List<Stok> list = stokService.getAll();
		List<Produk> listt = produkService.listProduk();
		
		modelMap.put("produk", listt);
		modelMap.put("stok", list.toArray());		
		return "/master/stok/list";
		
	}

}
