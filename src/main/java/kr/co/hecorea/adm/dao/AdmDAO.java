package kr.co.hecorea.adm.dao;

import java.util.HashMap;
import java.util.List;

//import org.springframework.stereotype.Repository;

import kr.co.hecorea.adm.dto.AdmDTO;
//@Repository 
public interface AdmDAO {
	public HashMap<String, String> getOracleSize() throws Exception;
	public List<AdmDTO> getOracleInfo() throws Exception;
	public AdmDTO getOracleInfo1() throws Exception;
}
