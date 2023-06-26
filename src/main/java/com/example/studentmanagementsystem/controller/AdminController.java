package com.example.studentmanagementsystem.controller;


import com.example.studentmanagementsystem.entity.Student;
import com.example.studentmanagementsystem.entity.Teacher;
import com.example.studentmanagementsystem.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@CrossOrigin
public class AdminController {
    @Autowired
    private AdminMapper adminMapper;


    @PostMapping("/admin/studentInfo")
    public List<Map<String, Object>> getStudentInfo(@RequestBody Map<String, String> requestData){
        String clsname = requestData.get("Clsname");
        return adminMapper.getStudentInfo(clsname);
    }

    @PostMapping("/admin/studentInsert")
    public int insertStudent(@RequestBody Map<String,String> requestData){
        String Sno = requestData.get("Sno");
        String Sname = requestData.get("Sname");
        Integer Sage = Integer.parseInt(requestData.get("Sage"));
        String Ssex = requestData.get("Ssex");
        String Sarea = requestData.get("Sarea");
        String Clsno = requestData.get("Clsno");
        return adminMapper.insertStudent(Sno,Sname,Ssex,Sage,Sarea,Clsno);
    }

    @PostMapping("/admin/studentDelete")
    public int deleteStudent(@RequestBody Map<String,String> requestData){
        String Sno = requestData.get("Sno");
        return adminMapper.deleteStudent(Sno);
    }
    @PostMapping("/admin/teacherInfo")
    public List<Map<String, Object>> getTeacherInfo(@RequestBody Map<String, String> requestData){
        String Tjobtitle = requestData.get("Tjobtitle");

        return adminMapper.getTeacherInfo(Tjobtitle);
    }

    @PostMapping("/admin/teacherInsert")
    public int insertTeacher(@RequestBody Map<String,String> requestData){
        String Tno = requestData.get("Tno");
        String Tname = requestData.get("Tname");
        Integer Tage = Integer.parseInt(requestData.get("Tage"));
        String Tsex = requestData.get("Tsex");
        String Tjobtitle = requestData.get("Tjobtitle");
        String Tphone = requestData.get("Tphone");
        return adminMapper.insertTeacher(Tno,Tname,Tsex,Tage,Tjobtitle,Tphone);
    }

    @GetMapping("/admin/majorInfo")
    public List<Map<String, Object>> getMajorInfo(){ return adminMapper.getMajorInfo();}

    @PostMapping("/admin/majorInsert")
    public int insertMajor(@RequestBody Map<String,String> requestData){
        String Mno = requestData.get("Mno");
        String Mname = requestData.get("Mname");
        return adminMapper.insertMajor(Mno,Mname);
    }

    @PostMapping("/admin/classInfo")
    public List<Map<String,Object>> getClassInfo(@RequestBody Map<String, String> requestData){
        String Mname = requestData.get("Mname");
        return adminMapper.getClassInfo(Mname);
    }

    @PostMapping("/admin/classInsert")
    public int insertClass(@RequestBody Map<String,String> requestData){
        String Clsno = requestData.get("Clsno");
        String Clsname = requestData.get("Clsname");
        String Mno = requestData.get("Mno");
        return adminMapper.insertClass(Clsno,Clsname,Mno);
    }

    @PostMapping("/admin/courseInfo")
    public List<Map<String, Object>> getCourseInfo(@RequestBody Map<String,String> requestData){
        String Castmd = requestData.get("Castmd");
        String Cterm = requestData.get("Cterm");
        String Tname = requestData.get("Tname");
        if(Cterm.equals("所有")){
            Cterm = "";
        }
        return adminMapper.getCourseInfo(Tname,Castmd,Cterm);
    }

    @PostMapping("/admin/courseInsert")
    public int insertCourse(@RequestBody Map<String,String> requestData){
        String Cno = requestData.get("Cno");
        String Cname = requestData.get("Cname");
        String Cterm = requestData.get("Cterm");
        Integer Cduration = Integer.parseInt( requestData.get("Cduration"));
        String Casmtd = requestData.get("Casmtd");
        Float Ccredits = Float.parseFloat(requestData.get("Cduration"));
        String Tname = requestData.get("Tname");
        return adminMapper.insertCourse(Cno,Cname,Cterm,Cduration,Casmtd,Ccredits,Tname);
    }

    @PostMapping("/admin/reportInfo")
    public List<Map<String, Object>> getReportInfo(@RequestBody Map<String,String> requestData) {
        String Cno = requestData.get("Cno");
        String Sno = requestData.get("Sno");
        String sort = requestData.get("sort");
        if(sort.equals("无")){
            sort = "s.Sno";
        } else if (sort.equals("升序")) {
            sort = "score";
        } else {
            sort = "score DESC";
        }
        System.out.println(sort);
        return adminMapper.getReportInfo(Cno,Sno,sort);
    }

    @PostMapping("/admin/reportInsert")
    public int insertReport(@RequestBody Map<String,String> requestData){
        String Sno = requestData.get("Sno");
        String Cno = requestData.get("Cno");
        String term = requestData.get("term");
        Integer score = Integer.parseInt( requestData.get("score"));
        String Tname = requestData.get("Tname");
        return adminMapper.insertReport(Sno,Cno,term,score,Tname);
    }

    @PostMapping("/admin/update")
    public Map<String, Object> updateAdminPassword(@RequestBody Map<String, String> requestData) {
        String Admno = requestData.get("Admno");
        String newPassword = requestData.get("newPassword");

        Map<String, Object> response = new HashMap<>();

        // 执行更新操作
        int updateResult = adminMapper.updateAdminPassword(Admno,newPassword);

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
