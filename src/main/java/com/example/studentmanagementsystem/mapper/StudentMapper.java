package com.example.studentmanagementsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.studentmanagementsystem.entity.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface StudentMapper extends BaseMapper<Student> {

    @Select("SELECT Sno,Sname,Ssex,Sage,Sarea,Scredits,Clsname" +
            " FROM CZ_Students,CZ_Class" +
            " WHERE  CZ_Class.Clsno = CZ_Students.Clsno AND Sno = CONCAT(#{Sno}, '') ")
    List<Map<String, Object>> getStudentInfo(String Sno);

    @Select("SELECT Cname,r.score,c.Cterm,c.Tname,c.Casmtd,c.Ccredits,c.Cduration " +
            "FROM CZ_Reports r,CZ_Courses c " +
            "WHERE r.Sno = CONCAT(#{Sno}, '') AND Cterm LIKE CONCAT(#{term}, '%') " +
            "AND c.Casmtd LIKE CONCAT('%', #{asmtd}, '%') AND c.Cno = r.Cno")
    List<Map<String,Object>> getStudentRpt(String Sno,String term,String asmtd);

}
