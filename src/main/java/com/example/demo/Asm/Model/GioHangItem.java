package com.example.demo.Asm.Model;

public class GioHangItem {
    private SPChiTiet sanPhamCt;
    private int soLuong;
    private float thanhTien;

    public GioHangItem(SPChiTiet sanPhamCt, int soLuong, float thanhTien) {
        this.sanPhamCt = sanPhamCt;
        this.soLuong = soLuong;
        this.thanhTien = thanhTien;
    }

    public SPChiTiet getSanPhamCt() {
        return sanPhamCt;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public float getThanhTien() {
        return thanhTien;
    }
}
