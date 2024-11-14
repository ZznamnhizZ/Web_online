package com.example.demo.Asm.Model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "san_pham")
public class SanPhamAsm {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    Integer idSanPham;
    @Column(name = "ma_sp")
    String maSanPham;
    @Column(name = "ten_sp")
    String tenSanPham;
    @Column(name = "trang_thai")
    Boolean trangThai;
}
