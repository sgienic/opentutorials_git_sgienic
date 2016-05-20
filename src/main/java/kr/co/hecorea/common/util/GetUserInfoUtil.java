package kr.co.hecorea.common.util;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class GetUserInfoUtil {

	public static HashMap<String, String> selectUserInfo(HttpServletRequest req) throws Exception {
		HashMap<String, String> map = null;
		
		String userId = CommonUtil.getCookie(req, "loginUserId");
		String userName = CommonUtil.getCookie(req, "loginUserName");
		String userGrade = CommonUtil.getCookie(req, "loginUserGrade");
		
		if((userId == null || userId.equals("")) || (userName == null || userName.equals("")) || (userGrade == null || userGrade.equals(""))) {
			map = null;
			
		} else {
			String resultUserId = CommonUtil.ProcDecode(CommonUtil.getCookie(req, "loginUserId"));
			String resultUserName = CommonUtil.ProcDecode(CommonUtil.getCookie(req, "loginUserName"));
			String resultUserGrade = CommonUtil.ProcDecode(CommonUtil.getCookie(req, "loginUserGrade"));
			
			map = new HashMap<String, String>();
			
			map.put("UserId", resultUserId);
			map.put("UserName", resultUserName);
			map.put("UserGrade", resultUserGrade);
		}
		
		return map;
	}
	
	public static ArrayList<HashMap<String, String>> getUserInfoChange(ArrayList<HashMap<String, String>> list) throws Exception {
		for(int i=0; i<list.size(); i++) {
			
			if(list.get(i).get("user_sex").equals("M")) {
				list.get(i).put("user_sex", "남");
			} else {
				list.get(i).put("user_sex", "여");
			}
			
			if(list.get(i).get("user_flag").equals("Y")) {
				list.get(i).put("user_flag", "정상");
			} else {
				list.get(i).put("user_flag", "불량");
			}
			
			if(list.get(i).get("user_grade").equals("A")) {
				list.get(i).put("user_grade", "관리자");
			} else if(list.get(i).get("user_grade").equals("B")) {
				list.get(i).put("user_grade", "우수");
			} else {
				list.get(i).put("user_grade", "일반");
			}
		}
		
		return list;
	}
}
