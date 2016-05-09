package kr.co.hecorea.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("swg/*")
@Controller
public class TestController {
	
	private  Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@RequestMapping(value="/list.do")
	public String user_agree() {
		return "list";
	}
	
	@RequestMapping(value = "/bb", method = RequestMethod.GET)
	public String home(String id) {
		logger.info("id : "+ id);  
		return "list"; 
	}

	@RequestMapping(value = "/htmlAdmin", method = RequestMethod.GET)
	public String htmlAdmin() {
		return "html/admin";
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "../index";
	}
}
