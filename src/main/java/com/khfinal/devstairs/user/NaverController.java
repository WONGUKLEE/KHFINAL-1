package com.khfinal.devstairs.user;

import java.io.IOException;
import java.util.HashMap;

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

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.khfinal.devstairs.user.biz.UserBiz;
import com.khfinal.devstairs.user.dto.UserDto;
import com.khfinal.devstairs.user.oauth.NaverLoginBo;

@Controller
public class NaverController {
	
	@Autowired
	private NaverLoginBo naverLoginBo;
	private String apiResult = null;
	@Autowired
	private UserBiz biz;
	
	@RequestMapping("/getnaverUrl.do")
	@ResponseBody
	public String getNaverAuthUrl(HttpSession session) {
		String reqUrl = naverLoginBo.getAuthorizationUrl(session);
		System.out.println(reqUrl);
		return reqUrl;
	}
	
    @RequestMapping(value = "/NaverCallback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException, ParseException{
        System.out.println("네이버 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBo.getAccessToken(session, code, state);
        apiResult = naverLoginBo.getUserProfile(oauthToken);
        System.out.println(apiResult);
        UserDto dto = new UserDto();
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject)parser.parse(apiResult);
        jsonObject = (JSONObject) jsonObject.get("response");
        System.out.println("api조회값 : " + jsonObject);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("username", jsonObject.get("name"));
        System.out.println("이름만 뽑은거: " + jsonObject.get("name"));
        map.put("userid", jsonObject.get("email"));
        map.put("userpw", jsonObject.get("id"));
        System.out.println(map.get("userid").toString());
        dto.setUserid(map.get("userid").toString());
        dto.setUserpw(map.get("userpw").toString());
        dto.setUsername(map.get("username").toString());
        dto.setGrade("USER");
        if(biz.selectOne(dto)==null) {
        	int res = biz.naverRegist(dto);
        	if(res>0) {
        		System.out.println("naver 회원가입 성공");
        	}
        	return "welcome";
        }else {
        	session.setAttribute("login", dto);
        	return "redirect:start.do";
        }
    }
	
}
