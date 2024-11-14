package com.example.demo.Asm.Controller;

import com.example.demo.Asm.Model.SanPhamAsm;
import com.example.demo.Asm.Reponsitory.SanPhamAsmReponsitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/asm")
public class SanPhamController {
    @Autowired
    SanPhamAsmReponsitory sanPhamAsmReponsitory;

    @GetMapping("/sp/hien-thi")
    public String loadData(Model model) {
        model.addAttribute("dsSP", sanPhamAsmReponsitory.findAll());
        return "/asm/sp/hien-thi";
    }

    @GetMapping("/sp/delete")
    public String deleteSanPham(@RequestParam("id") Integer id) {
        sanPhamAsmReponsitory.deleteById(id);
        return "redirect:/asm/sp/hien-thi";
    }


    @GetMapping("/sp/add")
    public String loadFormAdd() {
        return "/asm/sp/add";
    }


    @PostMapping("/sp/add")
    public String addSanPham(SanPhamAsm sanPham) {
        sanPhamAsmReponsitory.save(sanPham);
        return "redirect:/asm/sp/hien-thi";
    }


    @GetMapping("/sp/update")
    public String showUpdateForm(Model model, @RequestParam("id") Integer id) {
        model.addAttribute("sp", sanPhamAsmReponsitory.findById(id).get());
        return "/asm/sp/update";
    }

    // Xử lý cập nhật sản phẩm
    @PostMapping("/sp/update")
    public String updateSanPham(SanPhamAsm sanPham) {
        sanPhamAsmReponsitory.save(sanPham);
        return "redirect:/asm/sp/hien-thi";
    }
}
