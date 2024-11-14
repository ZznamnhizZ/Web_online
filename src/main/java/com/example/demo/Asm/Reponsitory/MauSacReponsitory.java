package com.example.demo.Asm.Reponsitory;

import com.example.demo.Asm.Model.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MauSacReponsitory extends JpaRepository<MauSac, Integer> {
}
