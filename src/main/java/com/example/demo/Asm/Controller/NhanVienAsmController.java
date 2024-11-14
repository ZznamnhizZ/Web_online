package com.example.demo.Asm.Controller;

import com.example.demo.Asm.Model.NhanVien;
import com.example.demo.Asm.Reponsitory.NhanVienResponsitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/asm")
public class NhanVienAsmController {
    @Autowired
    NhanVienResponsitory nhanVienResponsitory;
    private static final int PAGE_SIZE = 3; // Số lượng bản ghi mỗi trang3

    @GetMapping("/nv/hien-thi")
    public String loadData(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model) {

        Pageable pageable = PageRequest.of(page - 1, PAGE_SIZE);
        Page<NhanVien> nhanVienPage;

        if (keyword != null && !keyword.trim().isEmpty()) {
            nhanVienPage = nhanVienResponsitory.findByTenNVContainingIgnoreCaseOrMaNVContainingIgnoreCase(keyword, keyword, pageable);
            model.addAttribute("keyword", keyword);
        } else {
            nhanVienPage = nhanVienResponsitory.findAll(pageable);
        }

        if (page > nhanVienPage.getTotalPages() && nhanVienPage.getTotalPages() > 0) {
            pageable = PageRequest.of(nhanVienPage.getTotalPages() - 1, PAGE_SIZE);
            nhanVienPage = nhanVienResponsitory.findByTenNVContainingIgnoreCaseOrMaNVContainingIgnoreCase(keyword, keyword, pageable);
            model.addAttribute("currentPage", nhanVienPage.getTotalPages());
        } else {
            model.addAttribute("currentPage", page);
        }

        model.addAttribute("dsNV", nhanVienPage.getContent());
        model.addAttribute("totalPages", nhanVienPage.getTotalPages());

        return "/asm/nv/hien-thi";
    }

    @GetMapping("/nv/delete")
    public String deleteNV(@RequestParam("id") Integer id) {
        nhanVienResponsitory.deleteById(id);
        return "redirect:/asm/nv/hien-thi";
    }

    @GetMapping("/nv/add")
    public String loadFormAdd() {
        return "/asm/nv/add";
    }

    @PostMapping("/nv/add")
    public String addNV(@ModelAttribute NhanVien nhanVien) {
        nhanVienResponsitory.save(nhanVien);
        return "redirect:/asm/nv/hien-thi";
    }

    @GetMapping("/nv/update")
    public String showUpdate(Model model, @RequestParam("id") Integer id) {
        model.addAttribute("nv", nhanVienResponsitory.findById(id).get());
        return "/asm/nv/update";
    }

    @PostMapping("/nv/update")
    public String updateNV(@ModelAttribute NhanVien nhanVien) {
        nhanVienResponsitory.save(nhanVien);
        return "redirect:/asm/nv/hien-thi";
    }

}
