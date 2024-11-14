package com.example.demo.Asm.Controller;

import com.example.demo.Asm.Model.KichThuoc;
import com.example.demo.Asm.Reponsitory.KichThuocResponsitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/asm")
public class KichThuocController {
    @Autowired
    KichThuocResponsitory kichThuocResponsitory;

    @GetMapping("/tt/hien-thi-kichthuoc")
    public String hienThiKichThuoc(Model model) {
        model.addAttribute("dsKichThuoc", kichThuocResponsitory.findAll());
        return "/asm/tt/hien-thi-kichthuoc";
    }

    @GetMapping("/tt/addkt")
    public String loadFormAdd() {
        return "/asm/tt/addkt"; // Path to addkt.jsp
    }

    @PostMapping("/tt/addkt")
    public String addKichThuoc(KichThuoc kichThuoc) {
        kichThuocResponsitory.save(kichThuoc);
        return "redirect:/asm/tt/hien-thi-kichthuoc";
    }

    @GetMapping("/tt/deletekt")
    public String deleteKichThuoc(@RequestParam("id") Integer id) {
        kichThuocResponsitory.deleteById(id);
        return "redirect:/asm/tt/hien-thi-kichthuoc";
    }

    @GetMapping("/tt/updatekt")
    public String showUpdate(Model model, @RequestParam("id") Integer id) {
        model.addAttribute("kichThuoc", kichThuocResponsitory.findById(id).get());
        return "/asm/tt/updatekt";
    }

    @PostMapping("/tt/updatekt")
    public String updateKichThuoc(KichThuoc kichThuoc) {
        kichThuocResponsitory.save(kichThuoc);
        return "redirect:/asm/tt/hien-thi-kichthuoc";
    }
}
