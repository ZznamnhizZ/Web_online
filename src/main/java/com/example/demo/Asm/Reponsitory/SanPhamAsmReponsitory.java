package com.example.demo.Asm.Reponsitory;

import com.example.demo.Asm.Model.SanPhamAsm;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SanPhamAsmReponsitory extends JpaRepository<SanPhamAsm, Integer> {
}
