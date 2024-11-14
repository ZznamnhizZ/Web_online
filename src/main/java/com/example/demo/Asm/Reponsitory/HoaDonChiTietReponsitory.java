package com.example.demo.Asm.Reponsitory;

import com.example.demo.Asm.Model.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HoaDonChiTietReponsitory extends JpaRepository<HoaDonChiTiet, Integer> {
}

