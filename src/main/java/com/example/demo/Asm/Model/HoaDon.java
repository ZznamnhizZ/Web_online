package com.example.demo.Asm.Model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "hoa_don")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer idHoaDon;

    @Column(name = "ngay_mua_hang", nullable = false)
    private LocalDate ngayMuaHang;

    @Column(name = "trang_thai", nullable = false)
    private Boolean trangThai;

    @ManyToOne
    @JoinColumn(name = "id_nv", referencedColumnName = "id", nullable = false)
    private NhanVien nhanVien;

    @ManyToOne
    @JoinColumn(name = "id_kh", referencedColumnName = "id", nullable = false)
    private KhachHang khachHang;
}
