package kr.co.hecorea.adm.controller;

import java.util.HashMap;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hecorea.adm.dao.AdmDAO;
import kr.co.hecorea.adm.dto.AdmDTO;
import kr.co.hecorea.adm.service.AdmService;
import kr.co.hecorea.monitor.dao.MonitorDAO;


@Controller
@RequestMapping("swg/adm/*")
public class AdmController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private  Logger logger = LoggerFactory.getLogger(AdmController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "/adm/a1000";
	}
	
	//@Inject
	//AdminDAO dao;
	@RequestMapping(value = "/a1000", method = RequestMethod.GET)
	public String a1000() {
		return "/adm/a1000";
	}
	
	/*
	@RequestMapping(value = "a1000", method = RequestMethod.GET)
	public String a1000Index(Locale locale, Model model) throws Exception {
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("param", "1");
		
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		HashMap<String, String> result = dao.getOraclSize();
		model.addAttribute("result", result);
		return "/adm/a1000";
	}
	)/
	
//	@Inject
//	AdmServiceImpl service;
	/*
	@Resource(name="AdmServiceImp")
	private AdmService AdmService;
	@RequestMapping(value="/a1000_0.xml", 
			method = RequestMethod.GET ,
			headers="Accept=application/xml",
			produces = {MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody AdmDTO listXML1()throws Exception{
		
		logger.info("list xml..............");
		
		
		//return service.list().get(0);
		//return "test";
		//AdmService.list();
		
		return AdmService.list();
		
	}		
	*/
	
	@RequestMapping(value = "/b1000", method = RequestMethod.GET)
	public String b1000() {
		return "/adm/b1000";
	}
	@RequestMapping(value = "/c1000", method = RequestMethod.GET)
	public String c1000() {
		return "/adm/c1000";
	}
	@RequestMapping(value = "/d1000", method = RequestMethod.GET)
	public String d1000() {
		return "/adm/d1000";
	}
}
