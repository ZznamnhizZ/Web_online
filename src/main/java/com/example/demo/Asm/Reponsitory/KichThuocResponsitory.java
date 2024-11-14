package com.example.demo.Asm.Reponsitory;

import com.example.demo.Asm.Model.KichThuoc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface KichThuocResponsitory extends JpaRepository<KichThuoc, Integer> {
}
