package com.rubinimart.service;

import com.rubinimart.dto.CartDTO;

public interface CartService {
    CartDTO getCart(Long buyerId);
    CartDTO addToCart(Long buyerId, Long productId, int quantity);
    CartDTO updateCartItemQuantity(Long buyerId, Long productId, int quantity);
    CartDTO removeFromCart(Long buyerId, Long productId);
    void clearCart(Long buyerId);
    int getCartItemCount(Long buyerId);
}
