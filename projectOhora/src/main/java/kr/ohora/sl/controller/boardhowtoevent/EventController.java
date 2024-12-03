package kr.ohora.sl.controller.boardhowtoevent;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/event/*")
@Log4j
public class EventController {

	@RequestMapping("/event_dazedayz_2.htm")
	public String event_dazedayz_2() {
		log.info("> BoardController event_dazedayz_2()...");
		return "event.event_dazedayz_2";
	}
	@RequestMapping("/event_event6.htm")
	public String event_event6() {
		log.info("> BoardController event_event6()...");
		return "event.event_event6";
	}
	@RequestMapping("/event_eventchoa.htm")
	public String event_eventchoa() {
		log.info("> BoardController event_eventchoa()...");
		return "event.event_eventchoa";
	}
	@RequestMapping("/event_gelnailtip.htm")
	public String event_gelnailtip() {
		log.info("> BoardController event_gelnailtip()...");
		return "event.event_gelnailtip";
	}
	@RequestMapping("/event_index.htm")
	public String event_index() {
		log.info("> BoardController event_index()...");
		return "event.event_index";
	}
	@RequestMapping("/event_lesserafim.htm")
	public String event_lesserafim() {
		log.info("> BoardController event_lesserafim()...");
		return "event.event_lesserafim";
	}
	@RequestMapping("/event_vipgift06.htm")
	public String event_vipgift06() {
		log.info("> BoardController event_vipgift06()...");
		return "event.event_vipgift06";
	}
	@RequestMapping("/event_vipgift07.htm")
	public String event_vipgift07() {
		log.info("> BoardController event_vipgift07()...");
		return "event.event_vipgift07";
	}
	@RequestMapping("/event_vipgift08.htm")
	public String event_vipgift08() {
		log.info("> BoardController event_vipgift08()...");
		return "event.event_vipgift08";
	}
}