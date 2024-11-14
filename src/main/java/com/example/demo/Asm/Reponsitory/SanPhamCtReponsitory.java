package com.example.demo.Asm.Reponsitory;

import com.example.demo.Asm.Model.SPChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamCtReponsitory extends JpaRepository<SPChiTiet, Integer> {
    List<SPChiTiet> findBySanPhamAsm_IdSanPham(Integer idSanPham);
}
