package kr.ohora.sl.controller.boardhowtoevent;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {

	@RequestMapping("/faq_list.htm")
	public String faq_list() {
		log.info("> BoardController faq_list()...");
		return "board.faq_list";
	}

	@RequestMapping("/faq_view.htm")
	public String faq_view() {
		log.info("> BoardController faq_view()...");
		return "board.faq_view";
	}

	@RequestMapping("/magazine.htm")
	public String magazine() {
		log.info("> BoardController magazine()...");
		return "board.magazine";
	}

	@RequestMapping("/membership.htm")
	public String membership() {
		log.info("> BoardController membership()...");
		return "board.membership";
	}

	@RequestMapping("/notice_list.htm")
	public String notice_list() {
		log.info("> BoardController notice_list()...");
		return "board.notice_list";
	}

	@RequestMapping("/notice_view.htm")
	public String notice_view() {
		log.info("> BoardController notice_view()...");
		return "board.notice_view";
	}
	
	@RequestMapping("/notice_write.htm")
	public String notice_write() {
		log.info("> BoardController notice_write()...");
		return "board.notice_write";
	}
	
	@RequestMapping("/ohora_Fend_brand4.htm")
	public String ohora_Fend_brand4() {
		log.info("> BoardController ohora_Fend_brand4()...");
		return "board.ohora_Fend_brand4";
	}
	
}

