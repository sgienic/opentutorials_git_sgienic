package kr.co.hecorea.adm.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.hecorea.adm.dao.AdmDAO;
import kr.co.hecorea.adm.dto.AdmDTO;

public class AdmServiceImpl implements AdmService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AdmDTO> list() throws Exception {
		// TODO Auto-generated method stub
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		
		System.out.println("start");
		System.out.println(dao.getOracleInfo());
		System.out.println("end");
		return dao.getOracleInfo();
	}

}
