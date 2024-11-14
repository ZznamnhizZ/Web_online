package com.example.demo.Asm.Controller;

import com.example.demo.Asm.Model.MauSac;
import com.example.demo.Asm.Reponsitory.MauSacReponsitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/asm")
public class MauSacController {
    @Autowired
    MauSacReponsitory mauSacReponsitory;

    @GetMapping("/tt/hien-thi-mausac")
    public String hienThiMauSac(Model model) {
        model.addAttribute("dsMs", mauSacReponsitory.findAll());
        return "/asm/tt/hien-thi-mausac";
    }

    @GetMapping("/tt/addms")
    public String loadFormAdd() {
        return "/asm/tt/addms";
    }


    @PostMapping("/tt/addms")
    public String addMauSac(MauSac mauSac) {
        mauSacReponsitory.save(mauSac);
        return "redirect:/asm/tt/hien-thi-mausac";
    }


    @GetMapping("/tt/delete")
    public String deleteMauSac(@RequestParam("id") Integer id) {
        mauSacReponsitory.deleteById(id);
        return "redirect:/asm/tt/hien-thi-mausac";
    }


    @GetMapping("/tt/update")
    public String showUpdate(Model model, @RequestParam("id") Integer id) {
        model.addAttribute("mauSac", mauSacReponsitory.findById(id).get());
        return "/asm/tt/updatems";
    }


    @PostMapping("/tt/updatems")
    public String updateMauSac(MauSac mauSac) {
        mauSacReponsitory.save(mauSac);
        return "redirect:/asm/tt/hien-thi-mausac";
    }

}
