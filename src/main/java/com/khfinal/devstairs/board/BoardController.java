package com.khfinal.devstairs.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khfinal.devstairs.board.biz.BoardReplyBiz;
import com.khfinal.devstairs.board.dto.BoardReplyDto;

@Controller
public class BoardController {
	
	
	@Autowired
	private BoardReplyBiz brReplybiz;

	@RequestMapping("/replywrite")
	public String ReplyWrite(BoardReplyDto dto) {
		System.out.println("요청 넘어왔다다 : " + dto.getBr_no() + "/ " + dto.getBr_userid() + " / " + dto.getBr_content());
		brReplybiz.ReplyWrite(dto);

		return "redirect:detail.do?b_no=" + dto.getBr_no();

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

		return "redirect:detail.do?b_no=" + dto.getBr_no();

	}

	@RequestMapping("/replydelete")
	public String replydelete(BoardReplyDto dto, int b_no) {
		brReplybiz.ReplyDelete(dto);

		return "redirect:detail.do?b_no=" + b_no;
	}

}
