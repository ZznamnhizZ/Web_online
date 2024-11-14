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
@Table(name = "san_pham_ct")
public class SPChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    Integer id;
    @Column(name = "ma_sp_ct")
    String maSPCT;
    @ManyToOne
    @JoinColumn(name = "id_san_pham", referencedColumnName = "id")
    SanPhamAsm sanPhamAsm;
    @Column(name = "so_luong")
    Integer soLuong;
    @Column(name = "don_gia")
    Float donGia;
    @Column(name = "trang_thai")
    Boolean trangThai;
    @ManyToOne
    @JoinColumn(name = "id_mau_sac", referencedColumnName = "id")
    MauSac mauSac;
    @ManyToOne
    @JoinColumn(name = "id_kich_thuoc", referencedColumnName = "id")
    KichThuoc kichThuoc;
    @Column(name = "hinh_anh")
    String image;
}
