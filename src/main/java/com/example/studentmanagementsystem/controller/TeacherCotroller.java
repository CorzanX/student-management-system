package com.example.studentmanagementsystem.controller;

import com.example.studentmanagementsystem.mapper.teacherMapper;
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
public class TeacherCotroller {

    @Autowired
    private teacherMapper teacherMapper;

    @PostMapping("/teacher/info")
    public List<Map<String, Object>> GetTeacherInfo(@RequestBody Map<String, Object> request){
        String tno = (String) request.get("account");
        return teacherMapper.getTeacherInfo(tno);
    }

    @PostMapping("/teacher/crs")
    public List<Map<String, Object>> getTeacherCrs(@RequestBody Map<String, Object> request){
        String tno = (String) request.get("account");
        String term = (String) request.get("term");
        if(term.equals("所有")){
            term = "";
        }
        return teacherMapper.getTeacherCrs(tno,term);
    }

    @PostMapping("/teacher/rpt")
    public List<Map<String, Object>> getTeacherRpt(@RequestBody Map<String, Object> request){
        String tno = (String) request.get("account");
        String term = (String) request.get("term");
        if(term.equals("所有")){
            term = "";
        }
        return teacherMapper.getTeacherRpt(tno,term);
    }


    @PostMapping("/teacher/update")
    public Map<String, Object> updateTeacherPassword(@RequestBody Map<String, String> requestData) {
        String tno = requestData.get("tno");
        String newPassword = requestData.get("newPassword");

        Map<String, Object> response = new HashMap<>();

        // 执行更新操作
        int updateResult = teacherMapper.updateTeacherPassword(tno,newPassword);

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
