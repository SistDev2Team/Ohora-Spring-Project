package kr.ohora.sl.controller.boardhowtoevent;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/howto/*")
@Log4j
public class HowtoController {

	@RequestMapping("/howto_detail01.htm")
	public String howto_detail01() {
		log.info("> HowtoController howto_detail01()...");
		return "howto.howto_detail01";
	}

	@RequestMapping("/howto_detail02.htm")
	public String howto_detail02() {
		log.info("> HowtoController howto_detail02()...");
		return "howto.howto_detail02";
	}

	@RequestMapping("/howto_detail03.htm")
	public String howto_detail03() {
		log.info("> HowtoController howto_detail03()...");
		return "howto.howto_detail03";
	}

	@RequestMapping("/howto_detail04.htm")
	public String howto_detail04() {
		log.info("> HowtoController howto_detail04()...");
		return "howto.howto_detail04";
	}

	@RequestMapping("/howto_detail05.htm")
	public String howto_detail05() {
		log.info("> HowtoController howto_detail05()...");
		return "howto.howto_detail05";
	}

	@RequestMapping("/howto_detail06.htm")
	public String howto_detail06() {
		log.info("> HowtoController howto_detail06()...");
		return "howto.howto_detail06";
	}

	@RequestMapping("/howto_detail07.htm")
	public String howto_detail07() {
		log.info("> HowtoController howto_detail07()...");
		return "howto.howto_detail07";
	}

	@RequestMapping("/howto_detail08.htm")
	public String howto_detail08() {
		log.info("> HowtoController howto_detail08()...");
		return "howto.howto_detail08";
	}

	@RequestMapping("/howto_detail09.htm")
	public String howto_detail09() {
		log.info("> HowtoController howto_detail09()...");
		return "howto.howto_detail09";
	}

	@RequestMapping("/howto_detail10.htm")
	public String howto_detail10() {
		log.info("> HowtoController howto_detail10()...");
		return "howto.howto_detail10";
	}
	
	@RequestMapping("/howto.htm")
	public String howto() {
		log.info("> HowtoController howto()...");
		return "howto.howto";
	}
}
