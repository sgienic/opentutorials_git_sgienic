package kr.co.hecorea.common.controller;

import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hecorea.common.service.XmlSelectService;
import kr.co.hecorea.common.util.AjaxUtil;


@Controller
@RequestMapping("/xml/*")
public class XmlSelectController {
	
	private Logger log = Logger.getLogger(getClass());
	
	@Autowired
	private XmlSelectService xmlSelectService;
	
	
	@RequestMapping("simpleSelect")
	public ModelAndView simpleSelect(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String result = null;
		HashMap<String, String> resultMap = null;
		
		String[] selectId = null; 
		HashMap<String, String> paramMap = null;

		try {
			result = new String();
			resultMap = new HashMap<String, String>();
			
			selectId = req.getParameterValues("selectId");
			paramMap = new HashMap<String, String>();
			
			Enumeration<String> paramEnum = req.getParameterNames();
			
			for (; paramEnum.hasMoreElements();) {
				String parameterName = (String) paramEnum.nextElement();
				String parameterValue = req.getParameter(parameterName);

				if (!parameterName.equals("selectId")) {
					paramMap.put(parameterName, parameterValue);
				}
			}
			
			result = xmlSelectService.commonSelect(selectId, paramMap);
			
			resultMap.put("ErrorCode", "0");
			resultMap.put("ErrorMsg", "");
		} catch(Exception e) {
			log.error(e.toString());
			
			resultMap.put("ErrorCode", "-1");
			resultMap.put("ErrorMsg", e.toString());
		}
		
		AjaxUtil.callXmlAjax(res, resultMap, result, "utf-8", "utf-8");
		
		return null;
	}

}
