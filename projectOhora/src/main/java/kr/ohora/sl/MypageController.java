package kr.ohora.sl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ohora.sl.domain.AddrDTO;
import kr.ohora.sl.domain.OrderDTO;
import kr.ohora.sl.domain.OrderDetailDTO;
import kr.ohora.sl.domain.UserDTO;
import kr.ohora.sl.domain.security.CustomUser;
import kr.ohora.sl.service.member.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/member/mypage/")
public class MypageController {

    private final MemberService memberService;

    @GetMapping("mypage.htm")
    public String myPage(Authentication authentication, Model model) {
        log.info("마이페이지 접근");

        CustomUser customUser = (CustomUser) authentication.getPrincipal();

        int userid = customUser.getUser().getUserid();
        int memid = customUser.getUser().getMemid();
        log.info("마이페이지 userid: " + userid);
        log.info("마이페이지 memid: " + memid);
        
        //보유쿠폰호출
        int availableCoupons = memberService.getAvailableCoupons(userid);
        model.addAttribute("availableCoupons", availableCoupons);
        
        //구매상태호출
        List<Map<String, Object>> stateCounts = memberService.getOrderStateCounts(userid);
        log.info("stateCounts: " + stateCounts);
        model.addAttribute("stateCounts", stateCounts);
        
        //6개월구매이력호출
        Map<String, List<Map<String, Object>>> groupedOrders =  memberService.getOrderDetailsGroupedByDate(userid);
        log.info("groupedOrders: " + groupedOrders);
        model.addAttribute("groupedOrders", groupedOrders);

        return "member/mypage/mypage";
    }
    
    @PostMapping("orderdetail.htm")
    public String orderdetail(@RequestParam("ORDPK") int ordpk, Model model) {
    	log.info("마이페이지 자세히보기 접근");
    	
    	
    	OrderDTO order = memberService.getOrderById(ordpk);
    	List<OrderDetailDTO> orderDetails =  memberService.getOrderDetailsByOrderId(ordpk);
    	
        model.addAttribute("order", order);
        model.addAttribute("orderDetails", orderDetails);

		return "member/mypage/orderdetail";   	
    }
    
    @GetMapping("orderlist.htm")
    public String orderlist(Authentication authentication, Model model) {
    	
        CustomUser customUser = (CustomUser) authentication.getPrincipal();

        int userid = customUser.getUser().getUserid();
        log.info("마이페이지 주문내역 userid: " + userid);
        
        List<OrderDTO> orderList = memberService.getOrderList(userid);
        model.addAttribute("orderList", orderList);  	
        
    	return "member/mypage/orderlist";   	
    }
    
    @GetMapping("coupon.htm")
    public String coupon(Authentication authentication, Model model) {
    	
    	log.info("쿠폰조회페이지 접근");
    	CustomUser customUser = (CustomUser) authentication.getPrincipal();
    	int userid = customUser.getUser().getUserid();
    	List<Map<String, Object>> couponList = memberService.getAvailableCouponDetails(userid);
        model.addAttribute("couponList", couponList);

        
    	return "member/mypage/coupon";   	
    }
    
    @GetMapping("meminfo.htm")
    public String meminfo(Authentication authentication, Model model) {
    	
    	log.info("회원정보페이지 접근");
    	CustomUser customUser = (CustomUser) authentication.getPrincipal();
    
    	Date userbirth = customUser.getUser().getUserbirth();
    	int userid = customUser.getUser().getUserid();
    	
        	
    	AddrDTO address = memberService.getAddresses(userid);
  	
    	log.info(userbirth); 
    
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String formattedDate = sdf.format(userbirth);
    	
    	String[] birthParts = formattedDate.split("-");
    	String birthYear = birthParts[0];
    	String birthMonth = birthParts[1];
    	String birthDay =birthParts[2];    	
    	String usertel = customUser.getUser().getUsertel();
    	
    	if(address != null) {   		
    		String htel =  address.getAddrhtel();
    		String[] htelParts = htel.split("-");
    		String htel1 = htelParts[0]; // "010"
    		String htel2 = htelParts[1]; // "1111"
    		String htel3 = htelParts[2]; // "2222"
    		log.info("집전화" + htel);
    		model.addAttribute("htel1", htel1);
    		model.addAttribute("htel2", htel2);
    		model.addAttribute("htel3", htel3);    		
    	}
    	  	
    	String[] mobileParts = usertel.split("-");
 

    	String mobile1 = mobileParts[0]; // "010"
    	String mobile2 = mobileParts[1]; // "1111"
    	String mobile3 = mobileParts[2]; // "2222"
    	
    	
    	log.info("폰전화" + usertel);
    	    	
    	model.addAttribute("mobile1", mobile1);
    	model.addAttribute("mobile2", mobile2);
    	model.addAttribute("mobile3", mobile3);
    	
    	
    	model.addAttribute("birthYear", birthYear);
    	model.addAttribute("birthMonth", birthMonth);
    	model.addAttribute("birthDay", birthDay);
    	
    	if(address != null) {
    	model.addAttribute("address", address);
    	}
  	
    	return "member/mypage/meminfo";   	
    }
    
    @PostMapping("meminfo.htm")
    public String updatememinfo(UserDTO user,
    		                    AddrDTO address,
					            @RequestParam String birth_year,
					            @RequestParam String birth_month,
					            @RequestParam String birth_day,
					            @RequestParam("mobile[]") String[] mobile,
					            @RequestParam("is_sms") String smsAgree,
					            @RequestParam("is_news_mail") String emailAgree,
					            Authentication authentication) {   	
    	  CustomUser customUser = (CustomUser) authentication.getPrincipal();
          int userid = customUser.getUser().getUserid();       
          user.setUserid(userid); //userid 저장 
          
    	try {
			user.setBirthDate(birth_year, birth_month, birth_day); // 생일 저장
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:/member/mypage/meminfo.htm?error=true";
		}   	
        if ("Y".equals(smsAgree) || "Y".equals(emailAgree)) {
            user.setUsersnsagree("Y");
        } else {
            // 둘 다 "N"인 경우 usersnsagree를 "N"으로 설정
            user.setUsersnsagree("N");
        }
   	
    	// 전화번호 배열을 합쳐 usertel에 저장
        String usertel = String.join("-", mobile);
        user.setUsertel(usertel);

        // 확인 로그
        log.info("전화번호 저장: " + user.getUsertel()); 	
    	log.info(user.getUserbirth()); 
        log.info("받은 주소 정보: " + address);
        log.info("받은 유저 정보: " + user);
        
        //업데이트 호출
        boolean isUpdated = memberService.changeinfo(user, address);
          	
        if (isUpdated) {
        	
            log.info(" 업데이트 성공"); 
            
            // 새로운 인증 정보 설정
            customUser.getUser().setUsertel(user.getUsertel());
            customUser.getUser().setUserbirth(user.getUserbirth());
            customUser.getUser().setUsersnsagree(user.getUsersnsagree());
            
            // 새로운 Authentication 객체 생성
            Authentication currentAuth = SecurityContextHolder.getContext().getAuthentication();
            Authentication newAuth = new UsernamePasswordAuthenticationToken(
                customUser,                         // 업데이트된 사용자 정보
                currentAuth.getCredentials(),       // 기존 인증 정보 유지
                currentAuth.getAuthorities()        // 권한 정보 유지
            );

            // SecurityContextHolder에 업데이트된 Authentication 설정
            SecurityContextHolder.getContext().setAuthentication(newAuth);
                       
            return "redirect:/member/mypage/meminfo.htm?updateSuccess=true";
        } else {
            log.error(" 업데이트 실패");
            return "redirect:/member/mypage/meminfo.htm?error=true";
        }
    	   	
    }
    
    @GetMapping("addr.htm")
    public String addr(Authentication authentication, Model model) {
        log.info("배송지 페이지 접근");

   
        CustomUser customUser = (CustomUser) authentication.getPrincipal();
        int userid = customUser.getUser().getUserid();
        int memid = customUser.getUser().getMemid();

        log.info("배송지 userid: " + userid);
        log.info("마이페이지 memid: " + memid);

        int availableCoupons = memberService.getAvailableCoupons(userid);
        model.addAttribute("availableCoupons", availableCoupons);

        List<AddrDTO> addressList = memberService.getAllAddresses(userid);

        if (addressList != null && !addressList.isEmpty()) {
           
            addressList.sort((addr1, addr2) -> "Y".equals(addr1.getAddrmain()) ? -1 : "Y".equals(addr2.getAddrmain()) ? 1 : 0);
    
            model.addAttribute("addressList", addressList);
        } else {
            log.info(addressList);
        }

        return "member/mypage/addr";
    }
    
    @GetMapping("addrmanage.htm")
    public String addrmanage(Authentication authentication, Model model) {
    	
        log.info("배송지관리페이지 접근");

        CustomUser customUser = (CustomUser) authentication.getPrincipal();

        int userid = customUser.getUser().getUserid();
    
        log.info("배송지 관리 userid: " + userid);
        
        List<AddrDTO> addressList = memberService.getAllAddresses(userid);
        
        if(addressList != null) {
        	model.addAttribute("addressList",addressList);
        }
     
        return "member/mypage/addrmanage";
    }
    
    @PostMapping("addrmanage.htm")
    public String regaddr(@RequestParam("ADDR_TEL1") String tel1, 
    		                       @RequestParam("ADDR_TEL2") String tel2,
    		                       @RequestParam("ADDR_TEL3") String tel3,
    		                       @RequestParam("ADDR_HTEL1")String htel1, 
    		                       @RequestParam("ADDR_HTEL2")String htel2,
    		                       @RequestParam("ADDR_HTEL3")String htel3,    		                       
     		                       Model model,
     		                       AddrDTO address,
     		                       Authentication authentication) {
    	
    	log.info("배송지 수정 접근");
    	log.info("받아온 addrmain" + address.getAddrmain());
    	
		 CustomUser customUser = (CustomUser) authentication.getPrincipal();
	     int userid = customUser.getUser().getUserid();
    	
    	// 번호 조합
        String tel = String.join("-", tel1, tel2, tel3);
        address.setAddrtel(tel);       
        String htel = String.join("-", htel1, htel2, htel3);
        address.setAddrhtel(htel);
                              
        String addrMainFlag = address.getAddrmain(); //받아온 N,Y값  
        AddrDTO adrrmain = memberService.getAddresses(userid); //대표배송지조회
        
        if (adrrmain == null && "N".equals(addrMainFlag)) { // 없고 N 이면
        	addrMainFlag = "Y";
		}
                
        address.setAddrmain(addrMainFlag); // 설정
        address.setUserid(userid);
        
        log.info(address);
        
        //insert 호출
        boolean isreg = memberService.registerAddress(address, userid);
        
        if(isreg) {
        	log.info("배송지 등록 성공");
        	return "redirect:/member/mypage/addrmanage.htm?updateSuccess=true";
        }else {
        	return "redirect:/member/mypage/addrmanage.htm?error=true";
		}
    	
    }
    
}//class









