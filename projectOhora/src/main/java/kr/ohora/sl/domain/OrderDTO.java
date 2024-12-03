package kr.ohora.sl.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO {
	
    private int ordpk; // 주문 PK
    private String ordid; // 주문 ID
    private int userid; // 회원 ID
    private Integer icpnid; // 발급쿠폰 ID
    private String ordname; // 주문자명
    private String ordaddress; // 배송주소
    private String ordzipcode; // 우편번호
    private String ordtel; // 전화번호
    private String ordemail; // 이메일
    private String ordpassword; // 주문 비밀번호
    private Date ordorderdate; // 주문일
    private int ordtotalamount; // 총 주문금액
    private int ordcpndiscount; // 쿠폰 할인금액
    private int ordpdtdiscount; // 추가 할인금액
    private int ordusepoint; // 적립금사용
    private String ordpayoption; // 결제 수단
    private int orddeliveryfee; // 배송비
    
    private List<OrderDetailDTO> orderdetails;
    
}
