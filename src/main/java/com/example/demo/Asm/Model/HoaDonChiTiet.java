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
@Table(name = "hoa_don_chi_tiet")
public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    Integer idHDCT;

    @ManyToOne
    @JoinColumn(name = "id_hoa_don", referencedColumnName = "id")
    HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "id_sp_ct", referencedColumnName = "id")
    SPChiTiet sanPhamChiTiet;

    @Column(name = "so_luong")
    Integer soLuong;

    @Column(name = "don_gia")
    float donGia;

    @Column(name = "trang_thai")
    boolean trangThai;
}
