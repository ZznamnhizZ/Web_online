package com.example.demo.Asm.Controller;

import com.example.demo.Asm.Model.KhachHang;
import com.example.demo.Asm.Reponsitory.KhachHangResponsitory;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/asm")
public class KhachHangController {

    @Autowired
    private KhachHangResponsitory khachHangResponsitory;

    private static final int PAGE_SIZE = 3; // Số lượng bản ghi mỗi trang

    @GetMapping("/kh/hien-thi")
    public String loadData(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model) {

        Pageable pageable = PageRequest.of(page - 1, PAGE_SIZE);
        Page<KhachHang> khachHangPage;

        if (keyword != null && !keyword.trim().isEmpty()) {
            khachHangPage = khachHangResponsitory.findByTenKHContainingIgnoreCaseOrMaKHContainingIgnoreCase(keyword, keyword, pageable);
            model.addAttribute("keyword", keyword);
        } else {
            khachHangPage = khachHangResponsitory.findAll(pageable);
        }
        model.addAttribute("dsKH", khachHangPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", khachHangPage.getTotalPages());

        return "/asm/kh/hien-thi";
    }

    @GetMapping("/kh/delete")
    public String XoaKH(@RequestParam("id") Integer id) {
        khachHangResponsitory.deleteById(id);
        return "redirect:/asm/kh/hien-thi";
    }

    @GetMapping("/kh/add")
    public String loadFormAdd(Model model) {
        model.addAttribute("khachHang", new KhachHang());
        return "/asm/kh/add";
    }

    @PostMapping("/kh/add")
    public String addKH(@Valid @ModelAttribute("khachHang") KhachHang khachHang, BindingResult result) {
        if (result.hasErrors()) {
            return "/asm/kh/add";
        }
        khachHangResponsitory.save(khachHang);
        return "redirect:/asm/kh/hien-thi";
    }

    @GetMapping("/kh/update")
    public String showUpdate(Model model, @RequestParam("id") Integer id) {
        KhachHang khachHang = khachHangResponsitory.findById(id).orElse(null);
        if (khachHang != null) {
            model.addAttribute("khachHang", khachHang);
            return "/asm/kh/update";
        }
        return "redirect:/asm/kh/hien-thi";
    }

    @PostMapping("/kh/update")
    public String updateKH(@Valid @ModelAttribute("khachHang") KhachHang khachHang, BindingResult result) {
        if (result.hasErrors()) {
            return "/asm/kh/update";
        }
        khachHangResponsitory.save(khachHang);
        return "redirect:/asm/kh/hien-thi";
    }

}
