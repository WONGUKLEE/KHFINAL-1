package com.khfinal.devstairs.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khfinal.devstairs.board.biz.BoardBiz;
import com.khfinal.devstairs.board.biz.BoardReplyBiz;
import com.khfinal.devstairs.board.dto.BoardReplyDto;

@Controller
public class BoardController {
	
	//private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardBiz biz;
	@Autowired
	private BoardReplyBiz brReplybiz;
	@RequestMapping("/boardlist.do")
	public String list(Model model, HttpSession session, int b_teamcode) {
		//logger.info("boardlist");
		
		model.addAttribute("list", biz.selectList(b_teamcode));
		
		return "workspace-board";
		
	}
	
//	@RequestMapping("/boarddetail.do")
//	public String detail() {
//		//logger.info("boarddetail");
//		
//		return null;
//		
//	}
	
//	@RequestMapping("/writeform.do")
//	public String writeForm() {
//		//logger.info("writeform");
//		
//		return null;
//		
//	}
//	
//	@RequestMapping("/boardwrite.do")
//	public String write() {
//		//logger.info("boardwirte");
//		
//		return null;
//		
//	}
//	
//	
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
//	@RequestMapping("/boarddetail.do")
//	public String delete() {
//		//logger.info("boarddetail");
//		
//		return null;
//		
//	}
//	
//	@RequestMapping("/replywrite.do")
//	public String replyWrite() {
//		//logger.info("replywrite");
//		
//		return null;
//		
//	}
//	
//	@RequestMapping("/replyupdate.do")
//	public String replyUpdate() {
//		//logger.info("replyupdate");
//		
//		return null;
//		
//	}
//	
//	@RequestMapping("/replydelete.do")
//	public String replyDelete() {
//		//logger.info("replydelete");
//		
//		return null;
//	}
//	
//	
	@RequestMapping("/replyupdate")
	public String ReplyUpdate(BoardReplyDto dto) {
		System.out.println("index : " + dto.getBr_index() + " / content : " + dto.getBr_content());
		//brReplybiz.ReplyUpdate(dto);

		return "redirect:detail.do?b_no=" + dto.getBr_no();

	}

	@RequestMapping("/replydelete")
	public String replydelete(BoardReplyDto dto, int b_no) {
		//brReplybiz.ReplyDelete(dto);

		return "redirect:detail.do?b_no=" + b_no;
	}
	
	@RequestMapping("/replywrite")
	public String ReplyWrite(BoardReplyDto dto) {
		System.out.println("요청 넘어왔다다 : " + dto.getBr_no() + "/ " + dto.getBr_userid() + " / " + dto.getBr_content());
		//brReplybiz.ReplyWrite(dto);

		return "redirect:detail.do?b_no=" + dto.getBr_no();

	}
}
