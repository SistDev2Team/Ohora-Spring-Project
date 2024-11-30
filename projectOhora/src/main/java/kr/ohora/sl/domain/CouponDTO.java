package kr.ohora.sl.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CouponDTO {
	private int icpnid;
	private int userid;
	private int cpnid;
	private Date icpnissuedate;
	private String icpnisused;
	
	private String cpninfo;
	private int cpndiscountrate;
	private int cpnmaxamount;
	private int cpnconvalue;
	private String cpnapply;
	private String cpncontype;
	private String cpndiscounttype;
	private Date cpnstartdate;
	private Date cpnenddate;
	
}
