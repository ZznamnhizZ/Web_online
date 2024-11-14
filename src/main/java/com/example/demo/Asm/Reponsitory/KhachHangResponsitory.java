package com.example.demo.Asm.Reponsitory;

import com.example.demo.Asm.Model.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface KhachHangResponsitory extends JpaRepository<KhachHang, Integer> {
    // Tìm kiếm theo tên hoặc mã khách hàng
    Page<KhachHang> findByTenKHContainingIgnoreCaseOrMaKHContainingIgnoreCase(String tenKH, String maKH, Pageable pageable);

    Optional<KhachHang> findByTenKH(String tenKH);
}
