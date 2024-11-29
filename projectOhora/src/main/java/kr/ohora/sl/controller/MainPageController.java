package kr.ohora.sl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ohora.sl.service.MainPageService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class MainPageController {
	
	private MainPageService mainPageService;

	@RequestMapping("/oho_main")
	public String main() {
		log.info("> MainPageController main()...");
		
		return "oho_main";
	}
}
