package com.merak.util;

import java.sql.DriverManager;
import java.sql.ResultSet;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class IdGenerator {
	
    private Connection cn = null;
    private String nipDokter;
    private String nipSuster;
    private String nmrPelanggan;
    
	public IdGenerator() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			cn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db_merak", "root", "");
		} catch (Exception e){
			e.printStackTrace();
		}
	}
    
    public String getNipDokter () { //fungsi utk membuat nip dokter
        try {
            String sql = "select nip_dokter from dokter order by nip_dokter desc";
            PreparedStatement ps = (PreparedStatement) cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
	            nipDokter = rs.getString("nip_dokter");
	            nipDokter = nipDokter.substring(1);
	            int temp = Integer.parseInt(nipDokter)+ 1;
	            String j = String.valueOf(temp);
	            int h = j.length();
	            switch (h) {
					case 1: nipDokter = "D000" + j; break;
					case 2: nipDokter = "D00" + j; break;
					case 3: nipDokter = "D0" + j; break;
					case 4: nipDokter = "D" + j; break;
				}
            }else{
            	nipDokter = "D0001";
            }
            rs.close();
        }
        catch (Exception exc) {
            System.err.println(exc.getMessage());
        }
		return nipDokter; 
    }
    
    public String getNipSuster () { //fungsi utk membuat nip suster
        try {
            String sql = "select nip_suster from suster order by nip_suster desc";
            PreparedStatement ps = (PreparedStatement) cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
	            nipSuster = rs.getString("nip_suster");
	            nipSuster = nipSuster.substring(1);
	            int temp = Integer.parseInt(nipSuster)+ 1;
	            String j = String.valueOf(temp);
	            int h = j.length();
	            switch (h) {
					case 1: nipSuster = "S000" + j; break;
					case 2: nipSuster = "S00" + j; break;
					case 3: nipSuster = "S0" + j; break;
					case 4: nipSuster = "S" + j; break;
				}
            }else{
            	nipSuster = "S0001";
            }
            rs.close();
        }
        catch (Exception exc) {
            System.err.println(exc.getMessage());
        }
		return nipSuster; 
    }
    
    public String getNmrPelanggan () { //fungsi utk membuat nmr pelanggan
        try {
            String sql = "select nmr_pelanggan from pelanggan order by nmr_pelanggan desc";
            PreparedStatement ps = (PreparedStatement) cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
	            nmrPelanggan = rs.getString("nmr_pelanggan");
	            nmrPelanggan = nmrPelanggan.substring(1);
	            int temp = Integer.parseInt(nmrPelanggan)+ 1;
	            String j = String.valueOf(temp);
	            int h = j.length();
	            switch (h) {
					case 1: nmrPelanggan = "P000" + j; break;
					case 2: nmrPelanggan = "P00" + j; break;
					case 3: nmrPelanggan = "P0" + j; break;
					case 4: nmrPelanggan = "P" + j; break;
				}
            }else{
            	nmrPelanggan = "P0001";
            }
            rs.close();
        }
        catch (Exception exc) {
            System.err.println(exc.getMessage());
        }
		return nmrPelanggan; 
    }
    
    public String toString(){
    	return nipDokter;
    }
    
    public String toStringSuster(){
    	return nipDokter;
    }
    
    public String toStringPelanggan(){
    	return nmrPelanggan;
    }

}