package com.khfinal.devstairs.user;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.devstairs.user.biz.UserBiz;
import com.khfinal.devstairs.user.dto.UserDto;
import com.khfinal.devstairs.user.oauth.KakaoLoginBo;

@Controller
public class KakaoController {

	@Autowired
	private KakaoLoginBo kakaoLoginBo;
	private String apiResult = null;
	@Autowired
	private UserBiz biz;
	
	private final static String CLIENT_ID = "c130156f4877ee7e7fe91161316088a3";
    private final static String CLIENT_SECRET = "cAnTG2hPV6ESRTNlYRzGC0ph19VgGxoA";
    private final static String REDIRECT_URI = "http://localhost:8787/devstairs/KakaoCallback.do";
    private final static String SESSION_STATE = "oauth_state";
    /* ������ ��ȸ API URL */
    private final static String PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me";
	
    @RequestMapping("/getkakaoUrl.do")
	@ResponseBody
	public String getKakaoAuthUrl(HttpSession session) {
		String reqUrl = kakaoLoginBo.getAuthorizationUrl(session);
		System.out.println(reqUrl);
		return reqUrl;
	}
    
    @RequestMapping(value="/KakaoCallback.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		System.out.println("카카오 callback");
		System.out.println("code : " + code);
		String reqURL = "https://kauth.kakao.com/oauth/token";
		URL url;
		String accessToken="";
		try {
			url = new URL(reqURL);
			HttpsURLConnection conn = (HttpsURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=c130156f4877ee7e7fe91161316088a3");
			sb.append("&redirect_uri=http://localhost:8787/devstairs/KakaoCallback.do");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			JSONParser parser = new JSONParser();
			JSONObject jsob = (JSONObject) parser.parse(result);
			accessToken = (String) jsob.get("access_token");
			String refreshToken = (String) jsob.get("refresh_token");
			
			System.out.println("access : " + accessToken);
			System.out.println("refresh : " + refreshToken);
			
			br.close();
			bw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        HashMap<String, Object> userInfo = new HashMap<String,Object>();	
        URL apiURL;
	
			apiURL = new URL(PROFILE_API_URL);
			HttpsURLConnection connec = (HttpsURLConnection) apiURL.openConnection();
			connec.setRequestMethod("POST");
			connec.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			int responsecode = connec.getResponseCode();
			System.out.println("responsecode : " + responsecode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(connec.getInputStream()));
			String line = "";
  	        String result = "";
  	        
  	        while ((line = br.readLine()) != null) {
  	            result += line;
  	        }
  	        System.out.println("response body : " + result);
  	        JSONParser parser = new JSONParser();
  	        JSONObject jsob = (JSONObject) parser.parse(result);
  	        System.out.println(jsob.toString());
  	        JSONObject jsob2 = (JSONObject) jsob.get("kakao_account");
  	        System.out.println(jsob2.toString());
  	        String userid = (String) jsob2.get("email");
  	        int random = (int) ((Math.random() * (99999999 - 11111111)) + 11111111);
  	        UserDto dto = new UserDto();
  	        dto.setUserid(userid);
  	        dto.setUserpw(Integer.toString(random));
//  	        dto.setUserpw(userpw);
  	        UserDto res = biz.selectOne(dto);
  	        if(res!=null) {
          	   session.setAttribute("login", res);
          	   return "redirect:start.do";
            }else {
          	   model.addAttribute("user",dto);
          	   return "socialsignup";
            }
  	        
	}
    
    
}
