package com.example.demo.Asm.Controller;

import com.example.demo.Asm.Model.*;
import com.example.demo.Asm.Reponsitory.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/asm")
public class BanHangController {
    private static final Logger logger = LoggerFactory.getLogger(BanHangController.class);

    @Autowired
    BanHangResponsitory banHangResponsitory;

    @Autowired
    SanPhamCtReponsitory sanPhamCtReponsitory;

    @Autowired
    NhanVienResponsitory nhanVienResponsitory;

    @Autowired
    KhachHangResponsitory khachHangResponsitory;

    @Autowired
    HoaDonChiTietReponsitory hoaDonChiTietReponsitory;

    private List<GioHangItem> gioHang = new ArrayList<>(); // Danh sách giỏ hàng

    /**
     * Tải dữ liệu ban đầu khi vào trang bán hàng
     */
    @GetMapping("/bh/ban-hang")
    public String loadData(Model model) {
        model.addAttribute("danhSachHD", banHangResponsitory.findAll());
        model.addAttribute("danhSachSPCT", sanPhamCtReponsitory.findAll());
        model.addAttribute("gioHang", gioHang); // Thêm giỏ hàng vào model

        // Lấy danh sách nhân viên
        List<NhanVien> danhSachNhanVien = nhanVienResponsitory.findAll();
        model.addAttribute("danhSachNhanVien", danhSachNhanVien); // Add employee list to model

        // Lấy danh sách khách hàng
        List<KhachHang> danhSachKhachHang = khachHangResponsitory.findAll();
        model.addAttribute("danhSachKhachHang", danhSachKhachHang); // Add customer list to model

        return "/asm/bh/ban-hang";
    }

    /**
     * Thêm sản phẩm vào giỏ hàng
     */
    @GetMapping("/bh/add-to-cart")
    public String addToCart(@RequestParam("idSPCT") Integer idSPCT,
                            @RequestParam("soLuong") Integer soLuong,
                            Model model) {
        SPChiTiet sanPhamCt = sanPhamCtReponsitory.findById(idSPCT).orElse(null);
        if (sanPhamCt != null && soLuong != null && soLuong > 0) {
            // Trừ số lượng sản phẩm trong cơ sở dữ liệu
            int updatedQuantity = sanPhamCt.getSoLuong() - soLuong;
            if (updatedQuantity >= 0) { // Kiểm tra để tránh số lượng âm
                sanPhamCt.setSoLuong(updatedQuantity);
                sanPhamCtReponsitory.save(sanPhamCt); // Lưu lại thay đổi vào DB

                float thanhTien = sanPhamCt.getDonGia() * soLuong;
                gioHang.add(new GioHangItem(sanPhamCt, soLuong, thanhTien));
                logger.info("Thêm vào giỏ hàng: SPCT ID {}, số lượng {}", idSPCT, soLuong);
            } else {
                // Xử lý lỗi nếu số lượng không đủ
                model.addAttribute("error", "Số lượng sản phẩm không đủ");
                logger.warn("Số lượng sản phẩm không đủ cho SPCT ID {}", idSPCT);
            }
        } else {
            // Xử lý lỗi nếu cần thiết
            model.addAttribute("error", "Sản phẩm không hợp lệ hoặc số lượng không hợp lệ");
            logger.warn("Thêm vào giỏ hàng thất bại: SPCT ID {} với số lượng {}", idSPCT, soLuong);
        }
        return "redirect:/asm/bh/ban-hang"; // Quay lại trang bán hàng
    }

    /**
     * Tạo hóa đơn mới và lưu chi tiết hóa đơn
     */
    @PostMapping("/bh/create-invoice")
    public String createInvoice(@RequestParam("ngayMuaHang") String ngayMuaHangStr,
                                @RequestParam("maNV") String maNV,
                                @RequestParam("tenKH") String tenKH,
                                @RequestParam(value = "selectedProducts", required = false) List<Integer> selectedProducts,
                                Model model) {
        try {
            logger.info("Tạo hóa đơn mới với ngày mua hàng: {}, mã NV: {}, tên KH: {}", ngayMuaHangStr, maNV, tenKH);

            LocalDate ngayMuaHang = LocalDate.parse(ngayMuaHangStr);

            Optional<NhanVien> optionalNhanVien = nhanVienResponsitory.findByMaNV(maNV);
            if (!optionalNhanVien.isPresent()) {
                model.addAttribute("error", "Không tìm thấy nhân viên với mã: " + maNV);
                return loadData(model);
            }
            NhanVien nhanVien = optionalNhanVien.get();

            Optional<KhachHang> optionalKhachHang = khachHangResponsitory.findByTenKH(tenKH);
            if (!optionalKhachHang.isPresent()) {
                model.addAttribute("error", "Không tìm thấy khách hàng với tên: " + tenKH);
                return loadData(model);
            }
            KhachHang khachHang = optionalKhachHang.get();

            HoaDon hoaDon = new HoaDon();
            hoaDon.setNgayMuaHang(ngayMuaHang);
            hoaDon.setTrangThai(false); // Chưa thanh toán
            hoaDon.setNhanVien(nhanVien);
            hoaDon.setKhachHang(khachHang);

            banHangResponsitory.save(hoaDon);
            logger.info("Hóa đơn đã được lưu với ID: {}", hoaDon.getIdHoaDon());

            // Chuyển hướng đến cùng một trang và thêm danh sách sản phẩm đã chọn vào mô hình
            model.addAttribute("selectedProducts", selectedProducts); // Danh sách sản phẩm đã chọn
            model.addAttribute("hoaDonId", hoaDon.getIdHoaDon());

            return loadData(model); // Gọi lại phương thức loadData để tải lại trang với các sản phẩm đã chọn
        } catch (Exception e) {
            logger.error("Có lỗi xảy ra khi tạo hóa đơn: ", e);
            model.addAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            return loadData(model);
        }
    }

    /**
     * Hiển thị trang thanh toán cho hóa đơn
     */
    @GetMapping("/bh/process-payment")
    public String showPaymentPage(@RequestParam("hoaDonId") Integer hoaDonId, Model model) {
        // Tìm hóa đơn theo ID
        Optional<HoaDon> optionalHoaDon = banHangResponsitory.findById(hoaDonId);
        if (!optionalHoaDon.isPresent()) {
            model.addAttribute("error", "Không tìm thấy hóa đơn với ID: " + hoaDonId);
            return loadData(model); // Trở về trang bán hàng nếu không tìm thấy
        }

        HoaDon hoaDon = optionalHoaDon.get();
        model.addAttribute("hoaDon", hoaDon);
        model.addAttribute("gioHang", gioHang); // Thêm giỏ hàng vào model để hiển thị

        return "/asm/bh/payment"; // Chuyển đến trang thanh toán (tạo trang JSP tương ứng)
    }


    @PostMapping("/bh/process-payment")
    public String processPayment(@RequestParam("hoaDonId") Integer hoaDonId,
                                 @RequestParam("maNV") String maNV,
                                 @RequestParam("tenKH") String tenKH,
                                 @RequestParam("tienKhachDua") Float tienKhachDua,
                                 Model model) {
        try {
            Optional<HoaDon> optionalHoaDon = banHangResponsitory.findById(hoaDonId);
            if (!optionalHoaDon.isPresent()) {
                model.addAttribute("error", "Không tìm thấy hóa đơn với ID: " + hoaDonId);
                return loadData(model);
            }

            HoaDon hoaDon = optionalHoaDon.get();
            // Tính thành tiền từ giỏ hàng
            float thanhTien = (float) gioHang.stream()
                    .map(GioHangItem::getThanhTien)
                    .mapToDouble(Float::doubleValue) // Chuyển đổi về kiểu double
                    .sum();


            if (tienKhachDua < thanhTien) {
                model.addAttribute("error", "Số tiền khách đưa không đủ để thanh toán.");
                return loadData(model);
            }

            float tienThua = tienKhachDua - thanhTien;
            // Cập nhật trạng thái hóa đơn thành đã thanh toán
            hoaDon.setTrangThai(true); // Đánh dấu là đã thanh toán
            banHangResponsitory.save(hoaDon);

            model.addAttribute("tienThua", tienThua);
            model.addAttribute("success", "Thanh toán thành công!");

        } catch (Exception e) {
            model.addAttribute("error", "Có lỗi xảy ra khi thanh toán: " + e.getMessage());
            logger.error("Lỗi khi thanh toán: ", e);
        }
        return loadData(model);
    }

}
