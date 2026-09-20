package com.rubinimart.dao;

import com.rubinimart.model.CartItem;
import com.rubinimart.model.Order;
import com.rubinimart.model.OrderStatus;
import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

public interface OrderDAO {
    Order createOrderWithItems(Long buyerId, String shippingAddress, BigDecimal totalAmount, List<CartItem> cartItems);
    Optional<Order> findById(Long orderId);
    List<Order> findByBuyerId(Long buyerId);
    List<Order> findBySellerId(Long sellerId);
    List<Order> findAll();
    boolean updateStatus(Long orderId, OrderStatus newStatus);
    int countAll();
    BigDecimal calculateTotalRevenue();
}
