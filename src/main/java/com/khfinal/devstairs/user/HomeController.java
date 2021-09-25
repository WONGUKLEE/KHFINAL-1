package com.khfinal.devstairs.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.khfinal.devstairs.user.biz.TeamBiz;
import com.khfinal.devstairs.user.biz.UserBiz;
import com.khfinal.devstairs.user.dto.InviteTeamDto;
import com.khfinal.devstairs.user.dto.TeamCodeDto;
import com.khfinal.devstairs.user.dto.UserDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private UserBiz biz;
	@Autowired
	private TeamBiz teambiz;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	
	
	
	@RequestMapping(value="/sendEmail.do",method = RequestMethod.POST)
	public void signup(HttpServletRequest requeset, String email, Model model,HttpServletResponse response) throws IOException {
		
		Random r = new Random();
		String dice = Integer.toString(r.nextInt(4589362)+49311);
		UserDto dto = new UserDto();
		dto.setUserid(email);
		dto.setAuthkey(dice);
		int res = biz.testlogin(dto);
		System.out.println("임시가입 성공여부 : " + res);
		String setfrom="nma2195@gmail.com";
		String tomail = email;
		String title = "회원가입 인증 이메일 입니다";
		String content = 
				"<h1>[이메일 인증]</h1><br><p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"
	                    + "<a href='http://localhost:8787/devstairs/email_link.do?email=" 
	                    + email + "&authKey=" + dice + "'>이메일 인증 확인</a>";
		
		try {
            MimeMessage message = mailSender.createMimeMessage();
//            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
//                    true, "UTF-8");
//
//            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
//            messageHelper.setTo(tomail); // 받는사람 이메일
//            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
//            messageHelper.setText(content); // 메일 내용
            message.setFrom(setfrom);
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject(title);
            message.setContent(content,"text/html;charset=euc-kr");
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
//        response.setContentType("text/html; charset=UTF-8");
//        PrintWriter out_email = response.getWriter();
//        out_email.println("<script>alert('이메일이 발송되었습니다..');</script>");
//        out_email.flush();
	}
	
	@RequestMapping(value="/findpw.do", method= RequestMethod.POST)
	public void findpw(HttpServletRequest requeset, String email, Model model,HttpServletResponse response) throws IOException {
		Random r = new Random();
		String dice = Integer.toString(r.nextInt(4589362)+49311);
		UserDto dto = new UserDto();
		dto.setAuthkey(dice);
		dto.setUserid(email);
		int res = biz.authkeyUpdate(dto);
		if(res>0) {
			String setfrom="nma2195@gmail.com";
			String tomail = email;
			String title = "[Devstairs] 비밀번호 찾기 링크 입니다";
			String content = 
					"<h1>[이메일 인증]</h1><br><p>아래 링크를 클릭하시면 비밀번호변경을 위한 페이지로 이동합니다..</p>"
							+ "<a href='http://localhost:8787/devstairs/email_link.do?email=" 
							+ email + "&authKey=" + dice + "'>이메일 인증 확인</a>";
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				//            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
				//                    true, "UTF-8");
				//
				//            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				//            messageHelper.setTo(tomail); // 받는사람 이메일
				//            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				//            messageHelper.setText(content); // 메일 내용
				message.setFrom(setfrom);
				message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
				message.setSubject(title);
				message.setContent(content,"text/html;charset=euc-kr");
				
				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response.getWriter();
            out_equals.println("<script>alert('잘못된 접근입니다. 다시 시도해주세요.');</script>");
            out_equals.flush();
		}
        
//        response.setContentType("text/html; charset=UTF-8");
//        PrintWriter out_email = response.getWriter();
//        out_email.println("<script>alert('이메일이 발송되었습니다..');</script>");
//        out_email.flush();
		
	}
	
	
	
	
	
	@RequestMapping("/email_link.do")
	public ModelAndView test(String email, String authKey,HttpServletResponse response) throws IOException {
		System.out.println("아아아아 테스트");
		System.out.println("email : " + email + " / authKey : " + authKey);
		ModelAndView mv = new ModelAndView();
		UserDto a = new UserDto();
		a.setAuthkey(authKey);
		a.setUserid(email);
		UserDto dto = biz.selectOne(a);
		System.out.println("가입링크 타고 select : " + dto.getAuthkey());
		
		if(dto.getAuthkey().equals(authKey)) {
			int res = biz.testupdate(dto);
			if(res>0) {
				mv.setViewName("signup");
				mv.addObject("email",dto.getUserid());
				response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out_equals = response.getWriter();
	            out_equals.println("<script>alert('회원가입창으로 이동합니다.');</script>");
	            out_equals.flush();
			}else {
				mv.setViewName("registform");
				response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out_equals = response.getWriter();
	            out_equals.println("<script>alert('잘못된 접근입니다. 홈페이지에서 이용해주세요.');</script>");
	            out_equals.flush();
			}
		}
		
		return mv;
	}
	
	@RequestMapping("/emailCheck.do")
	@ResponseBody
	public Map<String,Boolean> emailCheck(String email){
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		int res = biz.emailCheck(email);
		System.out.println(res);
		if(res>0) {
			map.put("check", false);
		}else {
			map.put("check", true);
		}
		
		return map;
	}
	
	@RequestMapping("/regist.do")
	public String regist(UserDto dto,HttpServletResponse response) throws IOException {
		dto.setUserpw(passwordEncoder.encode(dto.getUserpw()));
		int res = biz.regist(dto);
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
	@RequestMapping(value="/ajaxlogin.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Boolean> ajaxlogin(@RequestBody UserDto dto,HttpSession session){
		
		UserDto res = biz.login(dto);
		boolean check = false;
		if(res!=null) {
			//db에 저장되어 있는 password와 화면에서 넘어온 password가 일치하는지 확인
			if(passwordEncoder.matches(dto.getUserpw(), res.getUserpw())) {
				session.setAttribute("login", res);
				check=true;
			}
		}
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		return map;
	}
	
	@RequestMapping(value="/pastpwcheck.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Boolean> passwordCheck(String userpw, HttpSession session){
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		boolean check = false;
		UserDto login = (UserDto) session.getAttribute("login");
		
		if(passwordEncoder.matches(userpw, login.getUserpw())) {
			check=true;
		}
		map.put("check", check);
		
		return map;
	}
	
	@RequestMapping(value="/passwordUpdate.do", method=RequestMethod.POST)
	public String passwordUpdate(String userpw,HttpSession session,HttpServletResponse response) throws IOException{
		UserDto login = (UserDto) session.getAttribute("login");
		UserDto dto = new UserDto();
		dto.setUserid(login.getUserid());
		dto.setUserpw(passwordEncoder.encode(userpw));
		int res = biz.pwUpdate(dto);
		
		if(res>0) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response.getWriter();
            out_equals.println("<script>alert('비밀번호 변경이 완료되었습니다. 다시 로그인 해주세요.');</script>");
            out_equals.flush();
			return "../../index";
		}else {
			session.invalidate();
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response.getWriter();
            out_equals.println("<script>alert('비밀번호 변경 실패');</script>");
            out_equals.flush();
			return "../../index";
		}
		
		
	}
	
	
	@RequestMapping("start.do")
	public String success(HttpSession session,Model model) {
		UserDto login = (UserDto) session.getAttribute("login");
		List<TeamCodeDto> list = teambiz.getTeamList(login.getUserid());
		List<InviteTeamDto> invitelist = biz.inviteList(login.getUserid());
		System.out.println(list);
		model.addAttribute("login",session.getAttribute("login"));
		model.addAttribute("list",list);
		model.addAttribute("invite",invitelist);
		return "start";
	}
	
	@RequestMapping(value="/logout.do",method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Boolean> logOut(HttpSession session) {
		boolean check = false;
		session.removeAttribute("login");
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		if(session.getAttribute("login")==null) {
			map.put("check", true);
		}
		
		return map;
	}
	
	@RequestMapping(value="/userUpdate.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Integer> UserUpdate(@RequestBody UserDto dto,HttpSession session) throws IOException {
		System.out.println("여기오는지 확인 일단.");
		int res = biz.UserUpdate(dto);
		
		Map<String,Integer> map = new HashMap<String, Integer>();
		int check = 0;
		if(res>0) {
			UserDto pastdto = (UserDto) session.getAttribute("login");
			String pastname = pastdto.getUsername();
			String newname = dto.getUsername();
			Map<String, String> map2 = new HashMap<String, String>();
			map2.put("pastname", pastname);
			map2.put("newname", newname);
			int res2 = biz.AdminNameUpdate(map2);
			System.out.println("res2 : " + res2);
			check=1;
		}
		map.put("check", check);
		session.removeAttribute("login");
		session.setAttribute("login", biz.login(dto));
		
		return map;
		
	}
	
	@RequestMapping(value="/secession.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Boolean> secession(HttpSession session){
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		boolean check = false;
		UserDto login = (UserDto) session.getAttribute("login");
		int res = biz.secession(login.getUserid());
		
		if(res>0) {
			check=true;
		}
		
		map.put("check",check);
		return map;
	}
	
	
	
	
}
