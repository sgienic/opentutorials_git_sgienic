package kr.co.hecorea.common.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import kr.co.hecorea.common.dao.UserDAO;
import kr.co.hecorea.common.util.CommonUtil;
import kr.co.hecorea.common.util.ParameterUtil;


@Controller
//@RequestMapping("swg/*")
@RequestMapping("common/*")
public class CommonController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private  Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "/user/login";
	}
	
	@RequestMapping(value = "/proc_login", method = RequestMethod.GET)
	public String proc_login(HttpServletRequest req,HttpServletResponse rep) {
		String userIdCheck = (req.getParameter("checkUserId")==null)?"":req.getParameter("checkUserId");
		
		try{ 
			HashMap<String, String> params = ParameterUtil.getRequestMap(req);
			UserDAO userDAO = sqlSession.getMapper(UserDAO.class);
			
			HashMap<String, String> result = userDAO.select_loginYn(params); //로그인 출력.
			
			

			logger.info(result+":-1");
			
			if(result == null || result.size() == 0) { //아이디 또는 패스워드가 잘못 됐을때
				
			} else if(result != null && result.get("USER_FLAG").equals("N") ) { //사용불가 아이디 일때
				CommonUtil.printOut(rep, 1);
			} else {
				CommonUtil.addCookie(rep, "loginUserId", CommonUtil.ProcEncode(result.get("USER_ID")), -1);
				CommonUtil.addCookie(rep, "loginAKA", CommonUtil.ProcEncode(result.get("AKA")), -1);
				CommonUtil.addCookie(rep, "loginUserName", CommonUtil.ProcEncode(result.get("AKA")), -1);

				if(userIdCheck != "" && userIdCheck.equals("on")) {
					CommonUtil.addCookie(rep, "saveUserId", result.get("user_id"), 60*60*24*365);
				} else {
					CommonUtil.removeCookie(rep, "saveUserId");
				}
				params.put("user_log_ip_addr", req.getRemoteAddr());
				userDAO.insert_contact_log(params); //접속로그 입력

				return "redirect:/adm/";
			} 
			
		}catch(Exception e) {
			logger.error(e.toString());
		}
		return null;
	}
	
	@RequestMapping(value = "/logOut", method = RequestMethod.GET)
	public String logOut(HttpServletRequest req,HttpServletResponse rep) {
		CommonUtil.removeCookie(rep, "loginUserId");
		CommonUtil.removeCookie(rep, "loginAKA");
		CommonUtil.removeCookie(rep, "loginUserName");
		return "/user/login";
	}
}
