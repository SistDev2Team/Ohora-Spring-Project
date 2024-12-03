package kr.ohora.sl.repository.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kr.ohora.sl.domain.AddrDTO;
import kr.ohora.sl.domain.OrderDTO;
import kr.ohora.sl.domain.OrderDetailDTO;
import kr.ohora.sl.domain.UserDTO;

@Repository
public interface MemberMapper {
	
    // 사용자 정보 + 권한 
    UserDTO getUserInfo(@Param("username") String username) throws ClassNotFoundException, SQLException;
    
    //아이디 중복 체크
    int isDuplicate(@Param("type") String type, @Param("value") String value)throws SQLException;
       
    //회원가입
    int insertUser(UserDTO user); // 회원 정보 삽입
    void insertUserAuthority(@Param("userId") int userId, @Param("authority") String authority); // 권한 삽입
    void issueWelcomeCoupon(@Param("userId") int userId); // 웰컴 쿠폰 발급
    
    //아이디 찾기
    String findUsername(
    	    @Param("name") String name,
    	    @Param("contact") String contact,
    	    @Param("contactType") String contactType
    	) throws SQLException;
    
    //비밀번호 찾기 용 유저 확인
    int checkUser(
        @Param("username") String username,
        @Param("contact") String contact,
        @Param("name") String name,
        @Param("contactType") String contactType
    );
    
    // 비밀번호 변경
    int updatePassword(
        @Param("username") String username, 
        @Param("newPassword") String newPassword
    );
        
    // 주문 상태별 카운트 조회
    List<Map<String, Object>> getOrderStateCounts(@Param("userid") int userid);
    
    //6개월이내 구매이력 가져오기
    List<Map<String, Object>> getOrderDetails(@Param("userid") int userid);
    
     // 특정 주문의 기본 정보 조회
    OrderDTO getOrderById(@Param("ordpk") int ordpk);

    // 특정 주문의 상세 정보 조회
    List<OrderDetailDTO> getOrderDetailsByOrderId(@Param("ordpk") int ordpk);
    
    //3개월 주문내역 조회
    List<OrderDTO> getOrderList(@Param("userid") int userid);
    
    //보유쿠폰 조회
    int getAvailableCoupons(@Param("userid") int userid);
    
    // 사용 가능 쿠폰 조회
    List<Map<String, Object>> getAvailableCouponDetails(@Param("userid") int userid);
    
    //해당 회원의 대표주소 가져오기
    AddrDTO getAddresses(@Param("userid") int userid);
    
    //해당 회원의 모든주소 가져오기
    List<AddrDTO> addressList(@Param("userid") int userid);
    
    //회원 정보 변경
    int updateUser(UserDTO user);
    
    //주소 변경
    int updateAddress(AddrDTO address);
    
    //회원정보 등록
    int insertAddress(AddrDTO address);
    
    //기본배송지해제
    void resetDefaultAddress(@Param("userid") int userid);
   
}//class


