package com.rubinimart.service;

import com.rubinimart.dto.LoginRequestDTO;
import com.rubinimart.dto.RegisterRequestDTO;
import com.rubinimart.dto.UserResponseDTO;
import com.rubinimart.model.User;
import java.util.List;

public interface UserService {
    UserResponseDTO register(RegisterRequestDTO request);
    User login(LoginRequestDTO request);
    UserResponseDTO getUserById(Long id);
    List<UserResponseDTO> getAllUsers();
    int getTotalUserCount();
}
