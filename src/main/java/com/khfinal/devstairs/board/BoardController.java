package com.khfinal.devstairs.board;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khfinal.devstairs.board.biz.BoardBiz;
import com.khfinal.devstairs.board.dto.BoardDto;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardBiz biz;
	//@Autowired
	//private BoardReplyBiz brReplybiz;
	@RequestMapping("/boardlist.do")
	public String list(Model model, HttpSession session, int b_teamcode) {
		logger.info("boardlist");
		
		model.addAttribute("list", biz.selectList(b_teamcode));
		
		return "workspace-board";
		
	}
	
	@RequestMapping("/boarddetail.do")
	public String detail(Model model, int b_no) {
		logger.info("boarddetail");
		
		model.addAttribute("dto", biz.selectOne(b_no));
		
		return "boarddetail";
		
	}
	
	@RequestMapping("/writeform.do")
	public String writeForm() {
		logger.info("writeform");
		
		
		return "boardwrite";
		
	}
	
	@RequestMapping("/boardwrite.do")
	public String write(BoardDto dto) {
		logger.info("boardwrite");
		
		int res = biz.insert(dto);
		
		if(res > 0) {
			return "redirect:boardlist.do?b_teamcode" + dto.getB_teamcode();
		} else {
			return "redirect:writeform.do";
		}
	
	}
	
	
//	@RequestMapping("/updateform.do")
//	public String updateForm() {
//		//logger.info("updateform");
//		
//		return null;
//		
//	}
//	
//	@RequestMapping("/boardupdate.do")
//	public String update() {
//		//logger.info("boardupdate");
//		
//		return null;
//		
//	}
//	
	@RequestMapping("/boarddelete.do")
	public String delete(BoardDto dto) {
		logger.info("boarddetail");
		
		int res = biz.delete(dto); 
		
		if(res > 0) {
			return "redirect:boardlist.do?b_teamcode=" + dto.getB_teamcode();
		} else {
			return "redirect:boarddetail.do?b_no=" + dto.getB_no();
		}
		
		
		
	}

}