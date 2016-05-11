package kr.co.hecorea.adm.dao;

import java.util.HashMap;
import java.util.List;

//import org.springframework.stereotype.Repository;

import kr.co.hecorea.adm.dto.AdmDTO;
//@Repository 
public interface AdmDAO {
	
	public List<HashMap<String, String>> getTableInfo(HashMap<String, String> params) throws Exception;
	public HashMap<String, String> getTableInfoByUserTable(HashMap<String, String> params) throws Exception;
	
	public List<AdmDTO> getOracleInfo() throws Exception;
	public AdmDTO getOracleInfo1() throws Exception;
}
