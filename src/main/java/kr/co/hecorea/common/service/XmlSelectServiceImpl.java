package kr.co.hecorea.common.service;

import java.util.HashMap;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hecorea.common.dao.XmlSelectDao;

@Service("xmlSelectService")
public class XmlSelectServiceImpl implements XmlSelectService {

	private Logger log = Logger.getLogger(getClass());
	
	@Autowired
	private XmlSelectDao xmlSelectDao;
	
	@Override
	public String commonSelect(String[] selectId, HashMap<String, String> paramMap) throws Exception {
		StringBuffer result = new StringBuffer();
		
		try {
			for(int i=0; i<selectId.length; i++) {
				String resultData = xmlSelectDao.commonSelect(selectId[i], paramMap);
				result.append(resultData);
			}
		} catch(Exception e) {
			log.error(e.toString());
			throw e;
		}
		
		return result.toString();
	}

}
