package kr.co.hecorea.monitor.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.hecorea.HomeController;
import kr.co.hecorea.monitor.dao.MonitorDAO;

@Controller
@RequestMapping("/monitor/*")
public class MonitorController {
	
	@Autowired
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(MonitorController.class);
	
	
	@RequestMapping(value = "intro", method = RequestMethod.GET)
	public String intro(Locale locale, Model model) {
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("param", "1");
		logger.info(" params : "+ params);
		MonitorDAO monitorDAO = sqlSession.getMapper(MonitorDAO.class);
		HashMap<String, String> result = monitorDAO.select_three(params); //로그인 출력
		
		model.addAttribute("result", result);
		return "/monitor/intro";
	}
	
}
