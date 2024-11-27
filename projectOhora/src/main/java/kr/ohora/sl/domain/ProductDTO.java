package kr.ohora.sl.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("ProductDTO")
public class ProductDTO {
	private int pdt_id;					// ��ǰ ID
	private int cat_id;					// ī�װ� ID
	private int scat_id;				// ����ī�װ� ID
	private int pdt_number;				// �ɼǰ���
	private String pdt_name;			// ��ǰ��
	private int pdt_amount;				// ��ǰ����
	private int pdt_discount_rate;		// ������
	private String pdt_img_url;			// �̹������
	private int pdt_count;				// ������
	private int pdt_review_count;		// ���� ��
	private int pdt_sales_count;		// �Ǹ� ����
	private Date pdt_adddate;			// ��ǰ �����
	private int pdt_viewcount;			// ��ȸ��
	private String pdt_description;		// ��ǰ ���� ( �߰� ���� ��ǰ �κи� ���� )
	
	private int pdt_discount_amount;	// ���ε� ���� ( �Ʒ��� ���� ���� )
	/* pdt_amount - (int)(pdt_amount * pdt_discount_rate / 100.0f ) // ������ ���� */	
	
	
	
	
	private int opt_id;				// �ɼ� ID
	private String opt_name;		// �ɼ� ID
	private int opt_amount;			// �ɼ� ����
	private int opt_count;			// �ɼ� ����
}
