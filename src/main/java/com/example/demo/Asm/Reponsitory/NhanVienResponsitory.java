package com.example.demo.Asm.Reponsitory;

import com.example.demo.Asm.Model.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface NhanVienResponsitory extends JpaRepository<NhanVien, Integer> {
    // Phương thức tìm kiếm nhân viên theo username và password
    Optional<NhanVien> findByUsernameAndPassword(String username, String password);

    // Tìm kiếm theo tên chứa từ khóa (không phân biệt hoa thường)
    Page<NhanVien> findByTenNVContainingIgnoreCaseOrMaNVContainingIgnoreCase(String tenNV, String maNV, Pageable pageable);

    Optional<NhanVien> findByMaNV(String maNV);
}

