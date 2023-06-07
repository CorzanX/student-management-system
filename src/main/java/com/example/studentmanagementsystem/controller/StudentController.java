package com.example.studentmanagementsystem.controller;

import com.example.studentmanagementsystem.mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
public class StudentController {
    @Autowired
    private StudentMapper studentMapper;

    @PostMapping("/student/info")
    public List<Map<String, Object>> GetStudentInfo(@RequestBody Map<String, Object> request){
        String sno = (String) request.get("account");
        return studentMapper.getStudentInfo(sno);
    }

    @PostMapping("/student/rpt")
    public List<Map<String, Object>> GetStudentRpt(@RequestBody Map<String, Object> request){
        String sno = (String) request.get("account");
        String term = (String) request.get("Cterm");
        String astmd = (String) request.get("Castmd");
        if(term.equals("所有")){
            term = "";
        }
        return studentMapper.getStudentRpt(sno,term,astmd);
    }

    @PostMapping("/student/crs")
    public List<Map<String,Object>> getStudentCrs(@RequestBody Map<String,Object> request){
        String sno = (String) request.get("account");
        String term = (String) request.get("Cterm");
        if(term.equals("所有")){
            term = "";
        }
        return studentMapper.getStudentCrs(sno,term);
    }

    @PostMapping("/student/update")
    public Map<String, Object> updateStudentPassword(@RequestBody Map<String, String> requestData) {
        String sno = requestData.get("sno");
        String newPassword = requestData.get("newPassword");

        Map<String, Object> response = new HashMap<>();

        // 执行更新操作
        int updateResult = studentMapper.updateStudentPassword(sno,newPassword);

        if (updateResult > 0) {
            response.put("success", true);
            response.put("message", "密码更新成功");
        } else {
            response.put("success", false);
            response.put("message", "密码更新失败");
        }

        return response;
    }
}
