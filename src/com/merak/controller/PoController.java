package com.merak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merak.entity.Distributor;
import com.merak.entity.Po;
import com.merak.entity.PoDetail;
import com.merak.entity.Produk;
import com.merak.entity.Stok;
import com.merak.service.DistributorService;
import com.merak.service.KategoriService;
import com.merak.service.PoDetailService;
import com.merak.service.PoService;
import com.merak.service.ProdukService;
import com.merak.service.SatuanService;
import com.merak.service.StokService;


@Controller
@RequestMapping("master/*")
public class PoController {
	
	@Autowired
	private PoDetailService poDetailService;
	
	@Autowired
	private PoService poService;
	
	@Autowired
	private DistributorService distributorService;
	
	@Autowired
	private ProdukService produkService;
	
	@Autowired
	private SatuanService satuanService;
	
	@Autowired
	private KategoriService kategoriService;
	
	@Autowired
	private StokService stokService;
	
	
//	listing
	@RequestMapping(value="po/list")
	public String addPo(ModelMap modelMap){
		List<Po> listPo = poService.getAll();
		List<Distributor> listDistributor = distributorService.getAll();
		
        modelMap.put("po", listPo.toArray());
		modelMap.put("distributor", listDistributor);
		return "master/po/list";
	}
	
//   save Add
	@RequestMapping(value="po/add", method = RequestMethod.POST)
	public String save (@ModelAttribute Po po, BindingResult result){
		int idDistributor = Integer.parseInt(result.getFieldValue("distributor").toString());	
		Distributor d = distributorService.getDistributorById(idDistributor);
		
		po.setDistributor(d);
		poService.save(po);
		return "redirect:list";
	}
	
	@RequestMapping(value="po/add")
	public String add(ModelMap modelMap){
//		List<Po> listPo = poService.getAll();
		List<Distributor> listDistributor = distributorService.getAll();
		
//        modelMap.put("po", listPo.toArray());
		modelMap.put("distributor", listDistributor);
		return "/master/po/add";
	}
		
	@RequestMapping("po/delete")
	public String delete(@ModelAttribute Po po){
		poService.delete(po);
		return "redirect:list";
	}
		
//	listing poDetail
	@RequestMapping(value="po/addDetail", method = RequestMethod.GET)
	public String listing(@ModelAttribute Po po ,ModelMap modelMap){
		List<Distributor> listDistributor = distributorService.getAll();
		List<Produk> listProduk = produkService.listProduk();
	    List<Po> listpo = poService.getAll();
		
		modelMap.put("produk", listProduk);		
		modelMap.put("distributor", listDistributor);
		modelMap.put("poo", listpo);
		 po = poService.getPoById(po.getId());		
			modelMap.put("po", po);
		return "/master/po/addDetail";
	}
	
//	save poDetail
	@RequestMapping(value="po/addDetail",method = RequestMethod.POST)
	public String save (@ModelAttribute PoDetail poDetail, BindingResult result){
		
		
//		String [] listPoDetail = result.getFieldValue("poDetail").toString().split(",");
		String [] produkList = result.getFieldValue("produk").toString().split(",");
		String [] poList = result.getFieldValue("po").toString().split(",");
						
		
		for (int i = 0 ; i < produkList.length ; i++){
			int idProduk = Integer.parseInt(produkList[i]);
			Produk p = produkService.getProdukById(idProduk);
			poDetail.setProduk(p);
			i++;
		}
		
		for (int i = 0 ; i < poList.length ; i++){
			int idPo = Integer.parseInt(poList[i]);
			Po po = poService.getPoById(idPo);
			poDetail.setPo(po);
			i++;
		}
		
			poDetail.setHarga(((Produk) poDetail.getProduk()).getHarga());
			poDetail.setTotal(((Produk) poDetail.getProduk()).getHarga() * poDetail.getStok());					
			poDetailService.save(poDetail);		
						
//		untuk save stok
		Stok st = new Stok();
//		st.setId_stok(poDetail.getProduk().getId());
		st.setProduk(poDetail.getProduk());
		st.setStok(poDetail.getStok());
		st.setTglStok(((Po) poDetail.getPo()).getTglPo());
		stokService.save(st);
		
//		untuk update produk
		Produk pp = new Produk();
		pp.setId(((Produk) poDetail.getProduk()).getId());
		pp.setNamaProduk(((Produk) poDetail.getProduk()).getNamaProduk());
		pp.setJmlProduk(poDetail.getStok() + ((Produk) poDetail.getProduk()).getJmlProduk());
		pp.setHarga(((Produk) poDetail.getProduk()).getHarga());
		pp.setKategori(((Produk) poDetail.getProduk()).getKategori());
		pp.setSatuan(((Produk) poDetail.getProduk()).getSatuan());
		produkService.save(pp);
		return "redirect:list";
		
	}
	
//	listing
	@RequestMapping(value="po/listLaporanPo")
	public String listinghh (ModelMap modelMap){
		List<PoDetail> list = poDetailService.getAll();
		modelMap.put("poDetail", list.toArray());
		return "master/po/listLaporanPo";
	
	}
}
