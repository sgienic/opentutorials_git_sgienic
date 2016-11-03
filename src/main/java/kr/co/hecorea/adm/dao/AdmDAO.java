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

	//로그인기록
	public List<HashMap<String,String>> getLoginLog() throws Exception;
	
	//오라클 세션정보 
	public List<HashMap<String,String>> getOracleSession() throws Exception;	
	
	//오라클 DB 롹 정보 확인
	public List<HashMap<String,String>> getOracleLock() throws Exception;

	//오라클 Rocl SQL 조회
	public List<HashMap<String,String>> getOracleLock02() throws Exception;
	//오라클 Rocl kill SQL 생성
	public List<HashMap<String,String>> getOracleLock03() throws Exception;
	

	//오라클Info v$instance
	public List<HashMap<String,String>> getOracleInfo01() throws Exception;
	//오라클Info v$database
	public List<HashMap<String,String>> getOracleInfo02() throws Exception;
	
	
	//DB comment 조회
	public List<HashMap<String,String>> getTablebyComments(HashMap<String, String> params) throws Exception;
	
	//백오피스,레오텍, 수용가 마스터 
	public List<HashMap<String,String>> getE3101_1() throws Exception;	
	public List<HashMap<String,String>> getE3102_1(HashMap<String, String> params) throws Exception;	
	public List<HashMap<String,String>> getE3103_1() throws Exception;
	public List<HashMap<String,String>> getE3104_1(HashMap<String, String> params) throws Exception;	
	public List<HashMap<String,String>> getE3105_1(HashMap<String, String> params) throws Exception;	
	
	//2-1 세부 지하수 실시간
	public List<HashMap<String,String>> e2101Sub01(HashMap<String, String> params) throws Exception;
	
	//헥코리아 기상처 open api 동네예보 중기 예보
	public List<HashMap<String,String>> e2301Sub01(HashMap<String, String> params) throws Exception;	
	public List<HashMap<String,String>> e2301Sub02(HashMap<String, String> params) throws Exception;	
	
	
	
	
	
}
