package com.example.demo.Asm.Controller;

import com.example.demo.Asm.Model.NhanVien;
import com.example.demo.Asm.Reponsitory.NhanVienResponsitory;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/asm")
public class DangNhap {

    @Autowired
    private NhanVienResponsitory nhanVienResponsitory;

    @GetMapping("/trangchu")
    public String TrangChu() {
        return "asm/trangchu";
    }

    @GetMapping("/login")
    public String FormDangNhap() {
        return "asm/login";
    }

    @PostMapping("/login")
    public String DangNhap(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           Model model,
                           HttpSession session) {
        // Sử dụng repository để tìm kiếm nhân viên hợp lệ
        NhanVien nvHopLe = nhanVienResponsitory.findByUsernameAndPassword(username, password).orElse(null);

        if (nvHopLe != null) {
            // Lưu thông tin người dùng vào Session
            session.setAttribute("user", nvHopLe);
            return "redirect:/asm/admin"; // Chuyển hướng sau khi đăng nhập thành công
        }
        model.addAttribute("error", "Sai thông tin đăng nhập");
        return "asm/login";
    }


    @GetMapping("/admin")
    public String adminPage(Model model, HttpSession session) {
        // Kiểm tra nếu người dùng chưa đăng nhập thì chuyển hướng về trang đăng nhập
        if (session.getAttribute("user") == null) {
            return "redirect:/asm/login";
        }
        // Thêm dữ liệu cần thiết vào model nếu cần
        return "asm/admin"; // Đảm bảo bạn đã tạo tệp admin.jsp
    }

    // Phương thức xử lý Log Out
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // Invalidate session để đăng xuất người dùng
        session.invalidate();
        // Chuyển hướng về trang đăng nhập
        return "redirect:/asm/login";
    }

}
