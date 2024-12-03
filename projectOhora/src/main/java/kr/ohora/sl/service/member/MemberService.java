package kr.ohora.sl.service.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.apache.ibatis.annotations.Param;

import kr.ohora.sl.domain.AddrDTO;
import kr.ohora.sl.domain.OrderDTO;
import kr.ohora.sl.domain.OrderDetailDTO;
import kr.ohora.sl.domain.UserDTO;

public interface MemberService {
	
	boolean isDuplicate(String type, String value) throws SQLException; // 중복 확인
	
	void registerUser(UserDTO user) throws SQLException; //회원가입
	
    String findUsername(String name, String contact, String contactType) throws SQLException; //아이디 찾기
    
    boolean checkUser(String username, String contact, String name, String contactType); // 비번 찾기 용 유저 확인
       
    boolean changePassword(String username, String newPassword); // 비밀번호 변경
    
    //이메일 전송
    public void sendVerificationEmail(String email, String verificationCode) throws AddressException, MessagingException;
    
    // 주문 상태별 카운트 조회
    public List<Map<String, Object>> getOrderStateCounts(int userid);
    
    //6개월이내 구매이력 가져오기
    public Map<String, List<Map<String, Object>>> getOrderDetailsGroupedByDate(int userid);
    
    // 특정 주문의 기본 정보 조회
   OrderDTO getOrderById(@Param("ordpk") int ordpk);

   // 특정 주문의 상세 정보 조회
   List<OrderDetailDTO> getOrderDetailsByOrderId(@Param("ordpk") int ordpk);
   
   //3개월 주문내역 조회
   List<OrderDTO> getOrderList(@Param("userid") int userid);
   
   //보유쿠폰 조회
   int getAvailableCoupons(int userid);
   
   //사용가능쿠폰 조회
   List<Map<String, Object>> getAvailableCouponDetails(int userid);
   
   //해당 회원의 대표주소 가져오기
   AddrDTO getAddresses(int userid);
   
   //해당 회원의 주소 가져오기 
   List<AddrDTO> getAllAddresses(int userid);
   
   //회원 정보 변경
   boolean changeinfo(UserDTO user, AddrDTO address);
   
   //회원 정보 등록
   boolean registerAddress(AddrDTO address,@Param("userid") int userid);
	
}
