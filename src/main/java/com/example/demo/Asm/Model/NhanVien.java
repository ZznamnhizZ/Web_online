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
@Table(name = "nhan_vien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    Integer idNhanVien;
    @Column(name = "ten")
    String tenNV;
    @Column(name = "ma_nv")
    String maNV;
    @Column(name = "ten_dang_nhap")
    String username;
    @Column(name = "mat_khau")
    String password;
    @Column(name = "trang_thai")
    Boolean trangThai;
}
