package kr.ohora.sl.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int pdtId;					// 상품 ID
	private int catId;					// 카테고리 ID
	private int scatId;					// 하위카테고리 ID
	private int pdtNumber;				// 옵션갯수
	private String pdtName;				// 상품명
	private int pdtAmount;				// 상품가격
	private int pdtDiscountRate;		// 할인율
	private String pdtImgUrl;			// 이미지경로
	private int pdtCount;				// 재고수량
	private int pdtReviewCount;			// 리뷰 수
	private int pdtSalesCount;			// 판매 수량
	private Date pdtAdddate;			// 상품 등록일
	private int pdtViewcount;			// 조회수
	private String pdtDescription;		// 상품 설명 ( 추가 구성 상품 부분만 적용 )
	
	private int pdtDiscountAmount;	// 할인된 가격 ( 아래와 같이 적용 )
	/* pdt_amount - (int)(pdt_amount * pdt_discount_rate / 100.0f ) // 할인율 적용 */	
	
	private int optId;				// 옵션 ID
	private String optName;			// 옵션 ID
	private int optAmount;			// 옵션 가격
	private int optCount;			// 옵션 수량
}
