package com.example.demo.Asm.Model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "khach_hang")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer idKhachHang;

    @NotBlank(message = "Không được để trống tên khách hàng")
    @Column(name = "ten")
    private String tenKH;

    @Pattern(regexp = "^\\d{10}$", message = "Số điện thoại phải gồm 10 chữ số")
    @Column(name = "sdt")
    private String sdt;

    @NotBlank(message = "Không được để trống mã khách hàng")
    @Pattern(regexp = "^KH\\d{4}$", message = "Mã khách hàng phải bắt đầu bằng 'KH' theo sau là 4 chữ số")
    @Column(name = "ma_kh")
    private String maKH;

    @Column(name = "trang_thai")
    private boolean trangThai;
}
