package kr.ohora.sl;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/member/mypage/")
public class MypageController {
	
    @GetMapping("mypage.htm")
    public String joinPage() {
    	
        System.out.println("마이페이지 접근");
        
        return "member/mypage/mypage";
    }


	
}
