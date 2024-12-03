package kr.ohora.sl.service.order;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ohora.sl.domain.OrderPageDTO;
import kr.ohora.sl.repository.order.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper dao;
	
	@Transactional
	@Override
	public String orderProcess(OrderPageDTO orderDTO) throws SQLException {
		orderDTO.settings();
		int userPk = orderDTO.getUserPk();
		// System.out.println(orderDTO);
		
		// 주문 INSERT
		dao.insertOrder(orderDTO);
		
		// 사용된 쿠폰 처리
		if (orderDTO.getIcpnId() != 0) {
			dao.updateCoupon(userPk, orderDTO.getIcpnId());
		}
		
		// 적립금 사용 처리
		if (userPk != 0) {
			if (orderDTO.getInputPoint() >= 3000) {
				int point = dao.checkPoint(userPk);
				if (point >= 3000 && point >= orderDTO.getInputPoint()) {
					point -= orderDTO.getInputPoint();
					dao.updateUsePoint(userPk, point);
				}
			}
		}
		
		// 회원 장바구니 구매항목 삭제 처리
		if (userPk != 0) {
			List<String> pdtIdArr = orderDTO.getPdtId();
			System.out.println(pdtIdArr.toString());
			dao.deleteCart(userPk, pdtIdArr);
		}
		
		// 재고 처리
		
		for (int i = 0; i < orderDTO.getPdtName().size(); i++) {
			dao.updatePdtCount(orderDTO.getPdtId().get(i), orderDTO.getPdtCount().get(i));
		}
		
		
		// 주문상세 INSERT
		for (int i = 0; i < orderDTO.getPdtName().size(); i++) {
			dao.insertOrdDetail(orderDTO.getOrdPk(), orderDTO.getPdtName().get(i), orderDTO.getPdtAmount().get(i)
					, orderDTO.getPdtDcAmount().get(i), orderDTO.getPdtCount().get(i));
		}
		
		String orderId = dao.selectOrdId(orderDTO.getOrdPk());
		return orderId;
	}
	
	
}
