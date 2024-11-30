package kr.ohora.sl.service.order;

import java.sql.SQLException;

import kr.ohora.sl.domain.OrderDTO;

public interface OrderService {
	String orderProcess(OrderDTO orderDTO) throws SQLException;
}
