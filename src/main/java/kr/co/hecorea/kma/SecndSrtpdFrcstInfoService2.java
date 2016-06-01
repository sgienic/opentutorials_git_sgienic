package kr.co.hecorea.kma;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hecorea.kma.dao.kmaDAO;
import kr.co.hecorea.util.DateUtil;

public class SecndSrtpdFrcstInfoService2 {
	/*
	 * 
	 * 초단기실황조회	getForecastGrib			getForecastGribRequest
	 * 초단기예보조회	getForecastTimeData		getForecastTimeDataRequest
	 * 동네예보조회	getForecastSpaceData	getForecastSpaceDataRequest
	 * 예보버전조회	getForecastVersionCheck	getForecastVersionCheckRequest
	 */
	static String apiBaseUrl = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/";
	static String ServiceKey = "v31dsUC8rkWpHV9DjClDBykTI4HYJkAquc%2FC%2B4Qw7dmNuabg9z6sHXADnUb4QB0LIEZQCjui1p4GjT7ne0Hrng%3D%3D";
	
	public static void main(String[] args) throws Exception {
		getApi("1");
	}	

	@Autowired
	private static SqlSession sqlSession;
	static String getApiUrl(String type){
		if(type.equals("1")){
			return "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib";
		}else if (type.equals("2")){
			return "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/getForecastTimeData";
		}else if (type.equals("3")){
			return "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/getForecastSpaceData";
		}else if (type.equals("4")){
			return "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/getForecastVersionCheck";
		}else{
			return null;
		}
		
	}
	
	//
	public static void getApi(String strType){
		String apiUrl = getApiUrl(strType); //apiBaseUrl + getApiName(strType);

		DateUtil dateUtil = new DateUtil();
		String base_date  = dateUtil.getCurrentYyyymmdd();//발표일자 (필수)
		String base_time = "0900";//발표시각(필수)
		
		
		base_time = dateUtil.getCurrentTime00();
		// 00시에 생성된된 자료는 00시40분에 발표됨 
		// 41~에서 59분사이 배치 하기
		if(Integer.parseInt(dateUtil.getCurrentTimeMm()) < 40  ){
			base_time = dateUtil.getCurrentTime00();
			base_time = (Integer.parseInt(base_time)-100)+"";
		}
		
		String nx = "54";//예보지점 X 좌표(필수)
		String ny = "125";//예보지점 Y 좌표(필수)
		String numOfRows = "1";//한 페이지 결과 수
		String pageNo = "1";//페이지 번호
		String _type = "json"; //json  or  xml

		kmaDAO dao = sqlSession.getMapper(kmaDAO.class);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("basedate", base_date);
		params.put("basetime", base_time);
		params.put("nx", nx);
		params.put("ny", ny);
		params.put("resultcode", "");
		params.put("resultmsg", "");
		params.put("t1h", "");
		params.put("rn1", "");
		params.put("sky", "");
		params.put("reh", "");
		
		try {
	        StringBuilder urlBuilder = new StringBuilder(apiUrl); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+ServiceKey); /*Service Key*/
	        
	        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(base_date, "UTF-8")); /**/
	        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(base_time, "UTF-8")); /**/
	        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); /**/
	        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); /**/
	        
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); /*검색건수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
	        
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode(_type, "UTF-8")); /*페이지 번호*/
	        URL url = new URL(urlBuilder.toString());
	        
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        
	       //json 파싱 
	        String json = sb.toString();
	        JSONParser parser = new JSONParser();
	       try{
	    	   JSONObject obj = (JSONObject)parser.parse(json);
	    	   System.out.println("오프젝트 수" + obj.size());
	    	   
	    	   //파싱하기 
	    	   //response 가져오기
	    	   JSONObject parse_response = (JSONObject) obj.get("response");

	    	   JSONObject parse_body = (JSONObject) parse_response.get("body");
	    	   JSONObject parse_items = (JSONObject) parse_body.get("items");
	    	   
	    	   JSONArray itemlist = (JSONArray) parse_items.get("item");
		      for(int i = 0 ; i < itemlist.size(); i ++)
		      {
	    	  	JSONObject imsi = (JSONObject) itemlist.get(i);
	    	  	String category = (String) imsi.get("category");
		        String obsrValue = (String) imsi.get("obsrValue").toString();
	            System.out.println("배열의 "+i+" 번째 요소 : " + category +"/" +obsrValue);
	            
	            
	            dao.insert_kma_fcstgrib(params);
		       }

	       }catch(ParseException e){
	    	   e.printStackTrace();
	    	   System.out.println("ParseException : " + e);
	       }
	        
		} catch (IOException e) {
			e.printStackTrace();
	    	   System.out.println("IOException : " + e);
		}
	}
	

}
