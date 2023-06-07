package com.example.studentmanagementsystem.mapper;


import com.example.studentmanagementsystem.entity.Student;
import com.example.studentmanagementsystem.entity.Teacher;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminMapper {
    @Select("select * from CZ_Students")
    @Results(
            {
                    @Result(column = "Sno",property = "Sno"),
                    @Result(column = "Sname",property = "Sname"),
                    @Result(column = "Ssex",property = "Ssex"),
                    @Result(column = "Sarea",property = "Sarea"),
                    @Result(column = "Sage",property = "Sage"),
                    @Result(column = "Scredits",property = "Scredits"),
                    @Result(column = "Clsno",property = "Clsno")

            }
    )
    List<Student> selectAllStudents();

    @Select("select * from CZ_Teachers")
    @Results(
            {
                    @Result(column = "Tno",property = "Tno"),
                    @Result(column = "Tname",property = "Tname"),
                    @Result(column = "Tsex",property = "Tsex"),
                    @Result(column = "Tjobtitle",property = "Tjobtitle"),
                    @Result(column = "Tphone",property = "Tphone")
            }
    )
    List<Teacher> selectAllTeachers();

    @Select("SELECT r.Sno, s.Sname, c.Cname, r.term, r.Tname, r.score " +
            "FROM CZ_Reports r, CZ_Students s, CZ_Courses c " +
            "WHERE s.Sno = r.Sno AND r.Cno = c.Cno AND r.term LIKE CONCAT(#{year}, '%')")
    List<Map<String, Object>> getTermReports(Integer year);




}
