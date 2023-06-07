package com.example.studentmanagementsystem.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.studentmanagementsystem.entity.login.*;
import com.example.studentmanagementsystem.mapper.login.AdminAccountMapper;
import com.example.studentmanagementsystem.mapper.login.StudentAccountMapper;
import com.example.studentmanagementsystem.mapper.login.TeacherAccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;
@RestController
@CrossOrigin
public class LoginController {

    @Autowired
    private AdminAccountMapper AdminAccountMapper;
    @Autowired
    private StudentAccountMapper StudentAccountMapper;
    @Autowired
    private TeacherAccountMapper TeacherAccountMapper;
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest request) {
        String identity = request.getIdentity();
        String account = request.getAccount();
        String password = request.getPassword();

        boolean success = false;

        // 根据身份判断使用哪个表进行验证
        if (identity.equals("student")) {
            StudentAccount student = StudentAccountMapper.selectOne(new QueryWrapper<StudentAccount>()
                    .eq("Sno", account)
                    .eq("Spwd", password));
            success = (student != null);
        } else if (identity.equals("teacher")) {
            TeacherAccount teacher = TeacherAccountMapper.selectOne(new QueryWrapper<TeacherAccount>()
                    .eq("Tno", account)
                    .eq("Tpwd", password));
            success = (teacher != null);
        } else if (identity.equals("admin")) {
            AdminAccount admin = AdminAccountMapper.selectOne(new QueryWrapper<AdminAccount>()
                    .eq("Admno", account)
                    .eq("Admpwd", password));
            success = (admin != null);
        }

        return ResponseEntity.ok(new LoginResponse(success));
    }
}

