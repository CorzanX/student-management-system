package com.example.studentmanagementsystem.controller;


import com.example.studentmanagementsystem.entity.Student;
import com.example.studentmanagementsystem.entity.Teacher;
import com.example.studentmanagementsystem.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


@RestController
@CrossOrigin
public class AdminController {
    @Autowired
    private AdminMapper adminMapper;


    @GetMapping("/admin/findAllStudents")
    public List<Student> findAllStudents() {return adminMapper.selectAllStudents();}

    @GetMapping("/admin/findAllTeachers")
    public List<Teacher> findAllTeachers() {return adminMapper.selectAllTeachers();}

    @PostMapping("/admin/findTermReports")
    public List<Map<String, Object>> findTermReports(Integer year) {return adminMapper.getTermReports(year);}


}
