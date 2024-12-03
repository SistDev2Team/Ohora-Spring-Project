package kr.ohora.sl.service.member;

import java.sql.SQLException;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ohora.sl.domain.AddrDTO;
import kr.ohora.sl.domain.OrderDTO;
import kr.ohora.sl.domain.OrderDetailDTO;
import kr.ohora.sl.domain.UserDTO;
import kr.ohora.sl.repository.member.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;
    
    private final PasswordEncoder passwordEncoder;
  
    @Override
    public boolean isDuplicate(String type, String value) throws SQLException{
        return this.memberMapper.isDuplicate(type, value) > 0;
    }

    @Transactional
	@Override
	public void registerUser(UserDTO user) throws SQLException {
		
    	
    	String password = user.getPassword();
    	user.setPassword(passwordEncoder.encode(password));
    	
    	int rowCount = memberMapper.insertUser(user); //회원정보삽입
    	
    	if(rowCount > 0) { 		
            memberMapper.insertUserAuthority(user.getUserid(), "ROLE_USER"); // 권한 삽입          
            memberMapper.issueWelcomeCoupon(user.getUserid()); //웰컴쿠폰    		
    	}else {
    		log.error("회원가입 처리 실패: 사용자 정보를 데이터베이스에 삽입하지 못했습니다.");
    	    throw new SQLException("회원가입 처리 중 오류 발생");
		}	
	}

	@Override
	public String findUsername(String name, String contact, String contactType) throws SQLException {
						
		return memberMapper.findUsername(name, contact, contactType);
	}

	@Override
	public boolean checkUser(String username, String contact, String name, String contactType) {
		
		 int rowCount = memberMapper.checkUser(username, contact, name, contactType);
	     return rowCount > 0; // 1 == true
	}

	@Override
	public boolean changePassword(String username, String newPassword) {
		
		 String encodedPassword = passwordEncoder.encode(newPassword);
		 
		 int rowCount = memberMapper.updatePassword(username, encodedPassword);
		
		return rowCount > 0; // 1 == true
	}

	@Override
	public void sendVerificationEmail(String email, String verificationCode) throws AddressException, MessagingException {
		
		 String host = "smtp.naver.com";
	     String from = "rlatjsdn6259@naver.com"; // 발신자 이메일 주소
	     String password = "kkok4829#";

        // SMTP 서버 설정
        Properties props = new Properties();
        props.put("mail.smtp.host", host); // SMTP 서버 주소
        props.put("mail.smtp.port", "587");             // SMTP 포트
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // 인증 설정
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        // 이메일 작성
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        message.setSubject("인증번호 안내");
        message.setText("인증번호는 다음과 같습니다: " + verificationCode);

        // 이메일 전송
        Transport.send(message);
    }

	@Override
	public List<Map<String, Object>> getOrderStateCounts(int userid) {
		
		return memberMapper.getOrderStateCounts(userid);
	}

	@Override
	public Map<String, List<Map<String, Object>>> getOrderDetailsGroupedByDate(int userid) {
		
		List<Map<String, Object>> orders =  memberMapper.getOrderDetails(userid);
				
		// 날짜별로 그룹화
	    return orders.stream()
	        .collect(Collectors.groupingBy(order -> order.get("ORDORDERDATE").toString()));
  
	}

	// 주문 기본 정보 조회
	@Override
	public OrderDTO getOrderById(int ordpk) {
		
		return memberMapper.getOrderById(ordpk);
	}
    
    // 주문 상세 정보 조회
	@Override
	public List<OrderDetailDTO> getOrderDetailsByOrderId(int ordpk) {
		
		return memberMapper.getOrderDetailsByOrderId(ordpk);
	}

	//3개월 주문내역
	@Override
	public List<OrderDTO> getOrderList(int userid) {
		
		return memberMapper.getOrderList(userid);
	}

	@Override
	public int getAvailableCoupons(int userid) {
		
		
		return memberMapper.getAvailableCoupons(userid);
	}

	@Override
	public List<Map<String, Object>> getAvailableCouponDetails(int userid) {
		
		return memberMapper.getAvailableCouponDetails(userid);
	}

	@Override
	public AddrDTO getAddresses(int userid) {
		
		
		return memberMapper.getAddresses(userid);
	}

	@Transactional
	@Override
	public boolean changeinfo(UserDTO user, AddrDTO address) {
		
		//비번 암호화
		String password = user.getPassword();
    	user.setPassword(passwordEncoder.encode(password));
		
		// 회원 정보 업데이트
	    int userUpdateResult = memberMapper.updateUser(user);

	    // 주소 정보 업데이트(있을 때만)
	    int addressUpdateResult = 0;
	    if (address != null && address.getAddrid() != 0) {
	        addressUpdateResult = memberMapper.updateAddress(address);
	    }

	    // 두 업데이트가 모두 성공했는지 확인
	    return userUpdateResult > 0 && (address == null || addressUpdateResult > 0);
		
	}

	@Override
	public List<AddrDTO> getAllAddresses(int userid) {
		
		return memberMapper.addressList(userid);
	}

	@Transactional
	@Override
	public boolean registerAddress(AddrDTO address, int userid) {
		
        AddrDTO adrrmain = memberMapper.getAddresses(userid); //대표배송지조회
        
        if (adrrmain != null) { // 있으면
        	memberMapper.resetDefaultAddress(userid);
		}
		
		return memberMapper.insertAddress(address)>0;
	}




    
    
}//class

