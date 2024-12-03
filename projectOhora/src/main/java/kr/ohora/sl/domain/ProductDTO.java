package kr.ohora.sl.domain;

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductDTO {
	private int pdtid;
	private int catid;
	private int scatid;
	private int pdtnumber;
	private String pdtname;
	private int pdtamount;
	private int pdtdiscountrate;
	private String pdtimgurl;
	private int pdtcount;
	private int pdtreviewcount;
	private int pdtsalescount;
	private Date pdtadddate;
	private int pdtviewcount;
	private String pdtdescription;
	
	private int pdtdiscountamount;
	
	private int optid;				// 옵션 ID
	private String optname;		// 옵션 ID
	private int optamount;			// 옵션 가격
	private int optcount;			// 옵션 수량
	
	private int clistpdtcount;
	
	private CommonsMultipartFile file; // 파일업로드
	
	public void calcDiscountAmount() {
		if (this.pdtdiscountrate != 0) {
			this.pdtdiscountamount = this.pdtamount - (int)(this.pdtamount * this.pdtdiscountrate / 100.0f);
		} else {
			this.pdtdiscountamount = this.pdtamount;
		}
	}
	
}
