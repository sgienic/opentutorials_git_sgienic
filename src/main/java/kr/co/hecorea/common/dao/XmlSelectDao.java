package kr.co.hecorea.common.dao;

import java.util.HashMap;


public interface XmlSelectDao {
	
	public String commonSelect(String selectId, HashMap<String, String> paramMap) throws Exception;

}
