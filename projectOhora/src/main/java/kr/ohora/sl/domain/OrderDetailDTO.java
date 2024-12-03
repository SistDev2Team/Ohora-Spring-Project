package kr.ohora.sl.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailDTO {
   
    private int opdtid; // 주문상세 ID
    private int ordpk; // 주문 ID
    private String opdtname; // 상품명
    private int opdtamount; // 주문상품 가격
    private int opdtdcamount; // 할인상품 가격
    private String opdtopname; // 옵션명
    private int opdtopamount; // 옵션 가격
    private int opdtcount; // 주문 갯수
    private String opdtstate; // 주문처리상태
    private String opdtrefund; // 취소교환반품
    private String opdtdelcompany; // 택배사
    private String opdtdelnumber; // 송장번호
    private char opdtconfirm; // 구매확정

}