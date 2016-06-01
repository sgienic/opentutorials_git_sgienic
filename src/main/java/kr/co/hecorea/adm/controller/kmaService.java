package kr.co.hecorea.adm.controller;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import kr.co.hecorea.adm.dao.AdmDAO;

//@Service("kmaService")

public class kmaService {
	@Autowired
	private SqlSession sqlSession;
	
	
	public void create()  {
		HashMap<String, String> params = new HashMap<String, String>();
		try {
			AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
			e.printStackTrace();
		}
		params.put("basedate", "2016");		
		System.out.println("create : end ");
	}
	
	public static void main(String[] args)  {
		System.out.println("..0");
		kmaService kmssvc = new kmaService();
		System.out.println("..1");
		kmssvc.create();
		System.out.println("..2");
	}		
}
