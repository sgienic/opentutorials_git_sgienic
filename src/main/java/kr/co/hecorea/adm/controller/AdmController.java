package kr.co.hecorea.adm.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hecorea.adm.dao.AdmDAO;
import kr.co.hecorea.common.util.ParameterUtil;


@Controller
//@RequestMapping("swg/adm/*")
@RequestMapping("adm/*")
public class AdmController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private  Logger logger = LoggerFactory.getLogger(AdmController.class);
	
	public void create()  throws Exception{
		logger.info("create() 1 ");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		logger.info("create() 2");
	}
	public static void main(String[] args)  throws Exception{
		System.out.println("..0");
		AdmController AdmController = new AdmController();
		
		//AdmController.create();
		AdmController.create();

	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		logger.info("/");
		return "/adm/a1000";
	}
	
	//@Inject
	//AdminDAO dao;
	@RequestMapping(value = "/a1000", method = RequestMethod.GET)
	public String a1000() {
		return "/adm/a1000";
	}
	
	@RequestMapping(value = "/a1000LoginLog", method = RequestMethod.GET)
	public ModelAndView a1000LoginLog() throws Exception{
		ModelAndView mv = new ModelAndView("/adm/a1000LoginLog");
		//로그인기록을 조회합니다.
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		//AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.getLoginLog();
		mv.addObject("resultList", resultList);
		return mv;
	}
	
	@RequestMapping(value = "/a1000OracleSession", method = RequestMethod.GET)
	public ModelAndView a1000OracleSession() throws Exception{
		ModelAndView mv = new ModelAndView("/adm/a1000OracleSession");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.getOracleSession();
		mv.addObject("resultList", resultList);
		return mv;
	}	

	@RequestMapping(value = "/a1001", method = RequestMethod.GET)
	public String a1001() {
		return "/adm/a1001";
	}
	@RequestMapping(value = "/a1002", method = RequestMethod.GET)
	public String a1002() {
		return "/adm/a1002"; 
	}
	

	@RequestMapping(value = "/a1001Sub01", method = RequestMethod.GET)
	public ModelAndView a1001Sub01()throws Exception {
		ModelAndView mv = new ModelAndView("/adm/a1001Sub01");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.getOracleInfo01();
		mv.addObject("resultList", resultList);
		return mv;
	}	
	@RequestMapping(value = "/a1001Sub02", method = RequestMethod.GET)
	public ModelAndView a1001Sub02()throws Exception {
		ModelAndView mv = new ModelAndView("/adm/a1001Sub02");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.getOracleInfo02();
		mv.addObject("resultList", resultList);
		return mv;
	}
	
	@RequestMapping(value = "/a1002Sub01", method = RequestMethod.GET)
	public ModelAndView a1002Sub01()throws Exception {
		ModelAndView mv = new ModelAndView("/adm/a1002Sub01");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.getOracleLock();
		mv.addObject("resultList", resultList);
		return mv;
	}
	@RequestMapping(value = "/a1002Sub02", method = RequestMethod.GET)
	public ModelAndView a1002Sub02()throws Exception {
		ModelAndView mv = new ModelAndView("/adm/a1002Sub02");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.getOracleLock02();
		mv.addObject("resultList", resultList);
		return mv;
	}
	@RequestMapping(value = "/a1002Sub03", method = RequestMethod.GET)
	public ModelAndView a1002Sub03()throws Exception {
		ModelAndView mv = new ModelAndView("/adm/a1002Sub03");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.getOracleLock03();
		mv.addObject("resultList", resultList);
		return mv;
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
	*/
	
	@RequestMapping(value = "/b1000", method = RequestMethod.GET)
	public String b1000() {
		return "/adm/b1000";
	}
	@RequestMapping(value = "/c1000", method = RequestMethod.GET)
	public String c1000() {
		return "/adm/c1000";
	}
	@RequestMapping(value = "/c1001", method = RequestMethod.GET)
	public String c1001() {
		return "/adm/c1001";
	}
	@RequestMapping(value = "/d1000", method = RequestMethod.GET)
	public String d1000() {
		return "/adm/d1000";
	}

	@RequestMapping(value = "/d1001", method = RequestMethod.GET)
	public String d1001(String tableName,String userName) {
		//http://localhost:8080/swg/adm/d1002?tableName=aaaa&userName=aaa
		System.out.println(" tableName : " + tableName);
		System.out.println(" userName : " + userName);
		return "/adm/d1001";
	}
	@RequestMapping(value = "/d1001", method = RequestMethod.POST)
	public ModelAndView d1001byPost(String tableName,String userName) throws Exception {
		ModelAndView mv = new ModelAndView("/adm/d1001");
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("tableName", tableName);
		params.put("userName", userName);
		
		//table 관련정보
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		

		List resultList = dao.getTableInfo(params);
		HashMap tbInfo = dao.getTableInfoByUserTable(params);
		
		mv.addObject("resultList", resultList);
		mv.addObject("tableName", tableName);
		mv.addObject("userName", userName);
		mv.addObject("comments", tbInfo.get("COMMENTS"));
		mv.addObject("num_rows", tbInfo.get("NUM_ROWS"));
		mv.addObject("mb", tbInfo.get("MB"));
		
		
		return mv;
	}
	@RequestMapping(value = "/d1002", method = RequestMethod.GET)
	public String d1002(String tableName) {
		return "/adm/d1002";
	}
	@RequestMapping(value = "/d1002", method = RequestMethod.POST)
	public ModelAndView d1002byPost(String tableName,String userName,String rowNum) {
		ModelAndView mv = new ModelAndView("/adm/d1002");
		mv.addObject("tableName", tableName);
		mv.addObject("userName", userName);
		mv.addObject("rowNum", rowNum);
		return mv;
	}
	
	

	@RequestMapping(value = "/d1002Sub", method = RequestMethod.GET)
	public ModelAndView d1002SubbyGet(String tableName,String userName,String rowNum) {
		HashMap<String, String> params = new HashMap<String, String>();
		
		System.out.println(" params  : " + params);
		
		ModelAndView mv = new ModelAndView("/adm/d1002Sub");
		mv.addObject("tableName", tableName);
		mv.addObject("userName", userName);
		mv.addObject("rowNum", rowNum);
		return mv;
	}
	
	@RequestMapping(value = "/d1002Sub", method = RequestMethod.POST)
	public ModelAndView d1002SubbyPost(String tableName,String userName,String rowNum) {
		HashMap<String, String> params = new HashMap<String, String>();
		
		System.out.println(" params  : " + params);
		
		ModelAndView mv = new ModelAndView("/adm/d1002Sub");
		mv.addObject("tableName", tableName);
		mv.addObject("userName", userName);
		mv.addObject("rowNum", rowNum);
		return mv;
	}
	
	
	@RequestMapping(value = "/d1002SubPop", method = RequestMethod.GET)
	public ModelAndView d1002SubPopbyGet(String tableName,String userName,String rowNum) {
		HashMap<String, String> params = new HashMap<String, String>();
		
		System.out.println(" params  : " + params);
		
		ModelAndView mv = new ModelAndView("/adm/d1002SubPop");
		mv.addObject("tableName", tableName);
		mv.addObject("userName", userName);
		mv.addObject("rowNum", rowNum);
		return mv;
	}
	
	@RequestMapping(value = "/d1002SubPop", method = RequestMethod.POST)
	public ModelAndView d1002SubPopbyPost(String tableName,String userName,String rowNum) {
		HashMap<String, String> params = new HashMap<String, String>();
		
		System.out.println(" params  : " + params);
		
		ModelAndView mv = new ModelAndView("/adm/d1002SubPop");
		mv.addObject("tableName", tableName);
		mv.addObject("userName", userName);
		mv.addObject("rowNum", rowNum);
		return mv;
	}	
	

	@RequestMapping(value = "/d1003", method = RequestMethod.GET)
	public String d1003() {
		return "/adm/d1003";
	}
	
	//Table Comment 조회
	@RequestMapping(value = "/d1003SubSearch", method = RequestMethod.GET)
	public ModelAndView d1003SubSearch(HttpServletRequest req,HttpServletResponse rep) throws Exception {
		HashMap<String, String> params = ParameterUtil.getRequestMap(req);
		System.out.println(" params  : " + params);
		
		ModelAndView mv = new ModelAndView("/adm/d1003SubSearch");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.getTablebyComments(params);
		
		mv.addObject("resultList", resultList);
		return mv;
	}

	@RequestMapping(value = "/e1000", method = RequestMethod.GET)
	public String e1000() {
		return "/adm/e1000";
	}
	@RequestMapping(value = "/e1001", method = RequestMethod.GET)
	public String e1001() {
		return "/adm/e1001";
	}
	//백오피스, 계면공학연구원
	@RequestMapping(value = "/e1101", method = RequestMethod.GET)
	public ModelAndView e1101() {
		ModelAndView mv = new ModelAndView("/adm/e1101");
		return mv;
	}
	//백오피스, PSGLOBAL
	@RequestMapping(value = "/e1201", method = RequestMethod.GET)
	public ModelAndView e1201() {
		ModelAndView mv = new ModelAndView("/adm/e1201");
		return mv;
	}
	//백오피스, 국민대
	@RequestMapping(value = "/e1301", method = RequestMethod.GET)
	public ModelAndView e1301() {
		ModelAndView mv = new ModelAndView("/adm/e1301");
		return mv;
	}
	//백오피스,
	@RequestMapping(value = "/e2101", method = RequestMethod.GET)
	public ModelAndView e2101() {
		ModelAndView mv = new ModelAndView("/adm/e2101");
		return mv;
	}
	//
	@RequestMapping(value = "/e2101Sub01", method = RequestMethod.GET)
	public ModelAndView e2101Sub01(HttpServletRequest req,HttpServletResponse rep) throws Exception{
		ModelAndView mv = new ModelAndView("/adm/e2101Sub01");
		HashMap<String, String> params = ParameterUtil.getRequestMap(req);
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.e2101Sub01(params); 
		mv.addObject("resultList", resultList);
		return mv;
	}
	
	@RequestMapping(value = "/e2301", method = RequestMethod.GET)
	public ModelAndView e2301() {
		ModelAndView mv = new ModelAndView("/adm/e2301");
		return mv;
	}	
	//기상청 open api 동네예보 e2101Sub01  중기예보 e2301Sub02
	@RequestMapping(value = "/e2301Sub01", method = RequestMethod.GET)
	public ModelAndView e2301Sub01(HttpServletRequest req,HttpServletResponse rep) throws Exception{
		ModelAndView mv = new ModelAndView("/adm/e2301Sub01");
		HashMap<String, String> params = ParameterUtil.getRequestMap(req);
		System.out.println("params : " + params);
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.e2301Sub01(params); 
		
		System.out.println("e2301Sub01 resultList : " + resultList);
		
		mv.addObject("resultList", resultList);
		return mv;
	}
	@RequestMapping(value = "/e2301Sub02", method = RequestMethod.GET)
	public ModelAndView e2301Sub02(HttpServletRequest req,HttpServletResponse rep) throws Exception{
		ModelAndView mv = new ModelAndView("/adm/e2301Sub02");
		HashMap<String, String> params = ParameterUtil.getRequestMap(req);
		System.out.println("params : " + params);
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.e2301Sub02(params);
		System.out.println("e2301Sub02 resultList : " + resultList);
		mv.addObject("resultList", resultList);
		return mv;
	}
	
	//백오피스, 레오텍, 수용가 정보
	@RequestMapping(value = "/e3101", method = RequestMethod.GET)
	public ModelAndView e3101() {
		ModelAndView mv = new ModelAndView("/adm/e3101");
		return mv;
	}
	//백오피스, 레오텍, 수용가 정보 inc
	@RequestMapping(value = "/e3101Sub01", method = RequestMethod.GET)
	public ModelAndView e3101Sub01() throws Exception{
		ModelAndView mv = new ModelAndView("/adm/e3101Sub01");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.getE3101_1();
		mv.addObject("resultList", resultList);
		return mv;
	}
	//백오피스, 레오텍, 원격검침 일단위
	@RequestMapping(value = "/e3102", method = RequestMethod.GET)
	public ModelAndView e3102() {
		ModelAndView mv = new ModelAndView("/adm/e3102");
		return mv;
	}
	//백오피스, 레오텍,
	@RequestMapping(value = "/e3102Sub01", method = RequestMethod.GET)
	public ModelAndView e3102Sub01(HttpServletRequest req,HttpServletResponse rep) throws Exception{
		HashMap<String, String> params = ParameterUtil.getRequestMap(req);
		ModelAndView mv = new ModelAndView("/adm/e3102Sub01");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class); 
		List resultList = dao.getE3102_1(params);
		mv.addObject("resultList", resultList);
		return mv;
	}
	//백오피스, 레오텍, 계측장비정보
	@RequestMapping(value = "/e3103", method = RequestMethod.GET)
	public ModelAndView e3103() {
		ModelAndView mv = new ModelAndView("/adm/e3103");
		return mv;
	}


	//백오피스, 레오텍
	@RequestMapping(value = "/e3104", method = RequestMethod.GET)
	public ModelAndView e3104() {
		ModelAndView mv = new ModelAndView("/adm/e3104");
		return mv;
	}
	//백오피스, 레오텍,
	@RequestMapping(value = "/e3104Sub01", method = RequestMethod.GET)
	public ModelAndView e3104Sub01(HttpServletRequest req,HttpServletResponse rep) throws Exception{
		HashMap<String, String> params = ParameterUtil.getRequestMap(req);
		ModelAndView mv = new ModelAndView("/adm/e3104Sub01");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class); 
		List resultList = dao.getE3104_1(params);
		mv.addObject("resultList", resultList);
		return mv;
	}

	//백오피스, 레오텍, 
	@RequestMapping(value = "/e3105", method = RequestMethod.GET)
	public ModelAndView e3105() {
		ModelAndView mv = new ModelAndView("/adm/e3105");
		return mv;
	}
	//백오피스, 레오텍,
	@RequestMapping(value = "/e3105Sub01", method = RequestMethod.GET)
	public ModelAndView e3105Sub01(HttpServletRequest req,HttpServletResponse rep) throws Exception{
		HashMap<String, String> params = ParameterUtil.getRequestMap(req);
		ModelAndView mv = new ModelAndView("/adm/e3105Sub01");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class); 
		List resultList = dao.getE3105_1(params);
		mv.addObject("resultList", resultList);
		return mv;
	}
	
	@RequestMapping(value = "/e3103Sub01", method = RequestMethod.GET)
	public ModelAndView e3103Sub01(HttpServletRequest req,HttpServletResponse rep) throws Exception{
		ModelAndView mv = new ModelAndView("/adm/e3103Sub01");
		AdmDAO dao = sqlSession.getMapper(AdmDAO.class);
		List resultList = dao.getE3103_1();
		mv.addObject("resultList", resultList);
		return mv;
	}
	//인하대
	@RequestMapping(value = "/e3301", method = RequestMethod.GET)
	public ModelAndView e3301() {
		ModelAndView mv = new ModelAndView("/adm/e3301");
		return mv;
	}	
}
