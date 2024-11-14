package com.example.demo.Asm.Reponsitory;

import com.example.demo.Asm.Model.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BanHangResponsitory extends JpaRepository<HoaDon, Integer> {
}
