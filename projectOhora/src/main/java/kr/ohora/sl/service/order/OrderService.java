package kr.ohora.sl.service.order;

import java.sql.SQLException;

import kr.ohora.sl.domain.OrderPageDTO;

public interface OrderService {
	String orderProcess(OrderPageDTO orderDTO) throws SQLException;
}
