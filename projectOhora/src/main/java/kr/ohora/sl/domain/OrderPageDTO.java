package kr.ohora.sl.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OrderPageDTO {
	private Long ordPk;
	private int userPk;
	private String rname;
	private String rzipcode1;
	private String raddr1;
	private String raddr2;
	private String addr;
	private String rphone2_1;
	private String rphone2_2;
	private String rphone2_3;
	private String phone;
	private String email1;
	private String direcEmail;
	private String email;
	private String paymethod;
	
	private List<String> pdtName;
	private List<Integer> pdtCount;
	private List<Integer> pdtAmount;
	private List<Integer> pdtDcAmount;
	private List<String> pdtId;
	
	private int totalSum;
	private int discountSum;
	private int icpnId;
	private int icpnDc;
	private int inputPoint;
	private int deliveryfee;
	
	public void settings() {
		this.addr = this.raddr1 + this.raddr2;
		this.phone = this.rphone2_1 + "-" + this.rphone2_2 + "-" + this.rphone2_3;
		this.email = this.email1 + "@" + this.direcEmail;
		this.deliveryfee = ((this.totalSum - this.discountSum) > 50000 ) ? 0 : 3000;
	}
}
