package kr.co.hecorea.adm.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.hecorea.adm.dto.AdmDTO;

public interface AdmDAO {
	public HashMap<String, String> getOraclSize() throws Exception;
	public List<AdmDTO> getOracleInfo() throws Exception;
	public AdmDTO getOracleInfo1() throws Exception;
}
