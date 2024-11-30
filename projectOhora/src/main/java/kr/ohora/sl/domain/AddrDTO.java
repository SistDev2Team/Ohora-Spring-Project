package kr.ohora.sl.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AddrDTO {

	private int addrid;
	private int userid;
	private String addrnick;
	private String addrname;
	private String addrhtel;
	private String addrtel;         // 휴대전화
	private String addraddressmain; // 기본 주소
	private String addraddressdetail; // 나머지 주소
	private String addrzipcode;
	private String addrmain;       // 대표 배송지 (기본값 'N')
}
