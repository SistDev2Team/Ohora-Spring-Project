package kr.ohora.sl.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int pdtId;					// ��ǰ ID
	private int catId;					// ī�װ� ID
	private int scatId;				// ����ī�װ� ID
	private int pdtNumber;				// �ɼǰ���
	private String pdtName;			// ��ǰ��
	private int pdtAmount;				// ��ǰ����
	private int pdtDiscountRate;		// ������
	private String pdtImgUrl;			// �̹������
	private int pdtCount;				// ������
	private int pdtReviewCount;		// ���� ��
	private int pdtSalesCount;		// �Ǹ� ����
	private Date pdtAdddate;			// ��ǰ �����
	private int pdtViewcount;			// ��ȸ��
	private String pdtDescription;		// ��ǰ ���� ( �߰� ���� ��ǰ �κи� ���� )
	
	private int pdtDiscountAmount;	// ���ε� ���� ( �Ʒ��� ���� ���� )
	/* pdt_amount - (int)(pdt_amount * pdt_discount_rate / 100.0f ) // ������ ���� */	
	
	
	private int optId;				// �ɼ� ID
	private String optName;		// �ɼ� ID
	private int optAmount;			// �ɼ� ����
	private int optCount;			// �ɼ� ����
}
