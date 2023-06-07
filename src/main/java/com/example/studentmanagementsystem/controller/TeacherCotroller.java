package com.example.studentmanagementsystem.controller;

import com.example.studentmanagementsystem.mapper.teacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
public class TeacherCotroller {

    @Autowired
    private teacherMapper teacherMapper;

    @PostMapping("/teacher/info")
    public List<Map<String, Object>> GetTeacherInfo(@RequestBody Map<String, Object> request){
        String tno = (String) request.get("account");
        return teacherMapper.getTeacherInfo(tno);
    }


}
