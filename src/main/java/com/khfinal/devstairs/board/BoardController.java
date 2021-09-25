package com.khfinal.devstairs.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khfinal.devstairs.board.biz.BoardBiz;
import com.khfinal.devstairs.board.biz.BoardReplyBiz;
import com.khfinal.devstairs.board.dto.BoardDto;
import com.khfinal.devstairs.board.dto.BoardReplyDto;
import com.khfinal.devstairs.board.dto.CategoryDto;
import com.khfinal.devstairs.user.dto.UserDto;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardBiz biz;

	@RequestMapping("/boardlist.do")
	public String list(Model model, HttpSession session, int b_teamcode) {
		logger.info("boardlist");
		
		UserDto dto = (UserDto) session.getAttribute("login");
		String b_userid = dto.getUserid();
	
		
		model.addAttribute("b_userid", b_userid);
		model.addAttribute("b_teamcode", b_teamcode);
		model.addAttribute("list", biz.selectList(b_teamcode));
		System.out.println(biz.selectList(b_teamcode).get(0).getB_title());
		model.addAttribute("mylist", biz.myList(b_userid, b_teamcode));
		
	
		
		 
		return "workspace-board";
		
	}
	
	@RequestMapping("/categorylist.do")
	public String categorylist(Model model, HttpSession session, int b_teamcode, int c_no) {
		logger.info("boardlist");
		
		UserDto dto = (UserDto) session.getAttribute("login");
		String b_userid = dto.getUserid();
		
		
		
		model.addAttribute("b_userid", b_userid);
		model.addAttribute("b_teamcode", b_teamcode);
		//model.addAttribute("list", biz.selectList(b_teamcode));
		//System.out.println(biz.selectList(b_teamcode).get(0).getB_title());
		
	
		
		 model.addAttribute("c_no", c_no); 
		 System.out.println(c_no);
		 model.addAttribute("categorylist", biz.CategoryList(c_no, b_userid, b_teamcode));
		 
		 return "workspace-board";
		
	
	
	}
	 
	
	@RequestMapping("/boarddetail.do")
	public String detail(Model model, HttpSession session ,int b_no) {
		logger.info("boarddetail");
		
		UserDto dto = (UserDto) session.getAttribute("login");
		String b_userid = dto.getUserid();
		
		
		model.addAttribute("b_userid", b_userid);
		model.addAttribute("dto", biz.selectOne(b_no));
		
		
		model.addAttribute("reply", brReplybiz.ReplyList(b_no));
		
		
		return "boarddetail";
		
	}
	
	@RequestMapping("/writeform.do")
	public String writeForm(Model model, HttpSession session, int b_teamcode) {
		logger.info("writeform");
		
		UserDto dto = (UserDto) session.getAttribute("login");
		
		model.addAttribute("b_userid", dto.getUserid());
		model.addAttribute("b_teamcode", b_teamcode);

		
		return "boardwrite";
		
	}
	
	@RequestMapping("/boardwrite.do")
	public String write(BoardDto dto) {
		logger.info("boardwrite");
		
		int res = biz.insert(dto);
		
		if(res > 0) {
			return "redirect:boardlist.do?b_teamcode=" + dto.getB_teamcode();
		} else {
			return "redirect:writeform.do";
		}
	
	}
	
	
	@RequestMapping("/updateform.do")
	public String updateForm(Model model, int b_no) {
		logger.info("updateform");
		
		model.addAttribute("dto", biz.selectOne(b_no));
		
		return "boardupdate";
		
	}
	
	@RequestMapping("/boardupdate.do")
	public String update(BoardDto dto) {
		logger.info("boardupdate");
		
		int res = biz.update(dto);
		
		if(res > 0) {
			return "redirect:boardlist.do?b_teamcode=" + dto.getB_teamcode();
		} else {
			return "redriect:boarddetail.do?b_no=" + dto.getB_no();
		}
		
		
		
	}
	
	@RequestMapping("/boarddelete.do")
	public String delete(int b_no, int b_teamcode) {
		logger.info("boarddetail");
		
		int res = biz.delete(b_no); 
		
		if(res > 0) {
			return "redirect:boardlist.do?b_teamcode=" + b_teamcode;
		} else {
			return "redirect:boarddetail.do?b_no=" + b_no;
		}
		
		
		
	}
	@Autowired
	private BoardReplyBiz brReplybiz;

	@RequestMapping("/replywrite")
	public String ReplyWrite(BoardReplyDto dto) {
		System.out.println("요청 넘어왔다다 : " + dto.getBr_no() + "/ " + dto.getBr_userid() + " / " + dto.getBr_content());
		brReplybiz.ReplyWrite(dto);

		return "redirect:boarddetail.do?b_no=" + dto.getBr_no();
		/*
		 * return "redirect:boarddetail.do?b_no=" + dto.getBr_no();
		 */
	}

	/*
	 * @RequestMapping("/replyupdate") public String ReplyUpdate(BoardReplyDto dto)
	 * { brReplybiz.ReplyUpdate(dto);
	 * 
	 * return "redirect:detail.do?b_no=" + dto.getBr_no(); }
	 */

	@RequestMapping("/replyupdate")
	public String ReplyUpdate(BoardReplyDto dto) {
		System.out.println("index : " + dto.getBr_index() + " / content : " + dto.getBr_content());
		brReplybiz.ReplyUpdate(dto);

		return "redirect:boarddetail.do?b_no=" + dto.getBr_no();
		/*
		 * return "redirect:boarddetail.do?b_no=" + dto.getBr_no();
		 */
	}

	@RequestMapping("/replydelete")
	public String replydelete(BoardReplyDto dto, int b_no) {
		brReplybiz.ReplyDelete(dto);

		return "redirect:boarddetail.do?b_no=" + b_no;
	}


}