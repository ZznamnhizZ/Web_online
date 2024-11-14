package com.example.demo.Asm.Controller;

import com.example.demo.Asm.Model.KichThuoc;
import com.example.demo.Asm.Model.MauSac;
import com.example.demo.Asm.Model.SPChiTiet;
import com.example.demo.Asm.Model.SanPhamAsm;
import com.example.demo.Asm.Reponsitory.KichThuocResponsitory;
import com.example.demo.Asm.Reponsitory.MauSacReponsitory;
import com.example.demo.Asm.Reponsitory.SanPhamAsmReponsitory;
import com.example.demo.Asm.Reponsitory.SanPhamCtReponsitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/asm")
public class SanPhamCTController {
    @Autowired
    private SanPhamCtReponsitory sanPhamCtReponsitory;

    @Autowired
    private SanPhamAsmReponsitory sanPhamAsmReponsitory;

    @Autowired
    private MauSacReponsitory mauSacReponsitory;

    @Autowired
    private KichThuocResponsitory kichThuocResponsitory;

    @GetMapping("/spct/hien-thi")
    public String loadData(Model model, @RequestParam(value = "id", required = false) Integer id) {
        if (id != null) {
            SanPhamAsm sanPham = sanPhamAsmReponsitory.findById(id).orElse(null);
            if (sanPham != null) {
                List<SPChiTiet> dsSPCT = sanPhamCtReponsitory.findBySanPhamAsm_IdSanPham(id);
                model.addAttribute("dsSPCT", dsSPCT);
                model.addAttribute("sanPham", sanPham);
            } else {
                model.addAttribute("dsSPCT", sanPhamCtReponsitory.findAll());
                model.addAttribute("error", "Không tìm thấy sản phẩm với ID: " + id);
            }
        } else {
            model.addAttribute("dsSPCT", sanPhamCtReponsitory.findAll());
        }
        return "/asm/spct/hien-thi";
    }

    @GetMapping("/spct/add")
    public String loadFormAdd(Model model) {
        SPChiTiet spct = new SPChiTiet();
        model.addAttribute("spct", spct);
        model.addAttribute("dsSanPham", sanPhamAsmReponsitory.findAll());
        model.addAttribute("dsMauSac", mauSacReponsitory.findAll());
        model.addAttribute("dsKichThuoc", kichThuocResponsitory.findAll());
        return "/asm/spct/add";
    }

    @PostMapping("/spct/add")
    public String addSanPhamCT(@ModelAttribute SPChiTiet spct) {
        sanPhamCtReponsitory.save(spct);
        return "redirect:/asm/spct/hien-thi?id=" + spct.getSanPhamAsm().getIdSanPham();
    }

    @GetMapping("/spct/update")
    public String showUpdateForm(Model model, @RequestParam("id") Integer id) {
        Optional<SPChiTiet> optionalSPCT = sanPhamCtReponsitory.findById(id);
        if (optionalSPCT.isPresent()) {
            SPChiTiet spct = optionalSPCT.get();

            List<SanPhamAsm> dsSanPham = sanPhamAsmReponsitory.findAll();
            List<MauSac> dsMauSac = mauSacReponsitory.findAll();
            List<KichThuoc> dsKichThuoc = kichThuocResponsitory.findAll();

            model.addAttribute("spct", spct);
            model.addAttribute("dsSanPham", dsSanPham);
            model.addAttribute("dsMauSac", dsMauSac);
            model.addAttribute("dsKichThuoc", dsKichThuoc);

            return "/asm/spct/update";
        } else {
            return "redirect:/asm/spct/hien-thi?error=Không tìm thấy chi tiết sản phẩm với ID: " + id;
        }
    }

    @PostMapping("/spct/update")
    public String updateSanPhamCT(@ModelAttribute SPChiTiet spct) {
        sanPhamCtReponsitory.save(spct);
        return "redirect:/asm/spct/hien-thi?id=" + spct.getSanPhamAsm().getIdSanPham();
    }

    @GetMapping("/spct/delete")
    public String deleteSanPhamCT(@RequestParam("id") Integer id) {
        Optional<SPChiTiet> optionalSPCT = sanPhamCtReponsitory.findById(id);
        if (optionalSPCT.isPresent()) {
            SPChiTiet spct = optionalSPCT.get();
            Integer sanPhamId = spct.getSanPhamAsm().getIdSanPham();
            sanPhamCtReponsitory.deleteById(id);
            return "redirect:/asm/spct/hien-thi?id=" + sanPhamId;
        } else {
            return "redirect:/asm/spct/hien-thi?error=Không tìm thấy chi tiết sản phẩm với ID: " + id;
        }
    }
}
