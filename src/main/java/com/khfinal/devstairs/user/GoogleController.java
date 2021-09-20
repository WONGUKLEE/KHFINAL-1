package com.khfinal.devstairs.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.khfinal.devstairs.user.biz.UserBiz;
import com.khfinal.devstairs.user.dto.UserDto;
import com.khfinal.devstairs.user.oauth.GoogleLoginBo;

@Controller
public class GoogleController {

	@Autowired
	private GoogleLoginBo googleLoginBo;
	private String apiResult = null;
	@Autowired
	private UserBiz biz;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	
	@RequestMapping("/getgoogleUrl.do")
	@ResponseBody
	public String getGoogleUrl(HttpSession session) {
		String reqUrl = googleLoginBo.getAuthorizationUrl(session);
		System.out.println(reqUrl);
		return reqUrl;
	}
	
	
	@RequestMapping(value = "/GoogleCallback.do",method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		System.out.println("구글 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = googleLoginBo.getAccessToken(session, code, state);
		System.out.println(oauthToken.toString());
		apiResult = googleLoginBo.getUserProfile(oauthToken);
		System.out.println(apiResult);
		JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject)parser.parse(apiResult);
        System.out.println(jsonObject.toString());
        String userid=(String) jsonObject.get("email");
        String userpw =(String)jsonObject.get("id");
        System.out.println("userpw  : " + userpw);
        UserDto dto = new UserDto();
        dto.setUserid(userid);
        dto.setUserpw(userpw); 
        System.out.println("dto.id : "+dto.getUserid()+" / dto.getuserpw : " + dto.getUserpw());
        UserDto res = biz.selectOne(dto);
        
        if(res!=null) {
        	session.setAttribute("login", res);
        	return "redirect:start.do";
        }else {
        	model.addAttribute("user",dto);
        	return "socialsignup";
        }
	}
	
	
	@RequestMapping(value = "/socialregist.do", method=RequestMethod.POST)
	public String socialregist(UserDto dto,HttpServletResponse response) throws IOException {
		System.out.println(dto.toString());
		int res = biz.naverRegist(dto);
		if(res>0) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response.getWriter();
            out_equals.println("<script>alert('회원가입성공.');</script>");
            out_equals.flush();
			return "welcome";
		}else {
			biz.testDelete(dto);
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response.getWriter();
            out_equals.println("<script>alert('회원가입 실패 다시하슈.');</script>");
            out_equals.flush();
			return "index";
		}
	}
	
}
