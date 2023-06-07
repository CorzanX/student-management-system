package com.example.studentmanagementsystem.mapper;


import com.example.studentmanagementsystem.entity.Student;
import com.example.studentmanagementsystem.entity.Teacher;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminMapper {






    @Select("SELECT Sno,Sname,Ssex,Sage,Sarea,Scredits,Clsname  " +
            "FROM CZ_Students,CZ_Class " +
            "WHERE CZ_Students.Clsno = CZ_Class.Clsno " +
            "AND CZ_Class.Clsname LIKE CONCAT('%',#{clsname}, '%')")
    List<Map<String, Object>> getStudentInfo(String clsname);

    @Insert("INSERT INTO CZ_Students (Sno, Sname, Ssex, Sage, Sarea, Scredits, Clsno) " +
            "VALUES (#{Sno}, #{Sname}, #{Ssex}, #{Sage}, #{Sarea}, 0, #{Clsno})")
    int insertStudent(String Sno,String Sname,String Ssex,Integer Sage,String Sarea,String Clsno);

    @Delete("DELETE FROM CZ_Students\n" +
            "WHERE Sno = #{Sno}")
    int deleteStudent(String Sno);

    @Select("SELECT t.Tno,Tname,Tsex,Tage,Tjobtitle,Tphone,COUNT(Cno) as crs_count " +
            "FROM CZ_Teachers t, CZ_Teacher_course tc " +
            "WHERE t.Tno = tc.Tno  " +
            "GROUP BY t.Tno,Tname,Tsex,Tage,Tjobtitle,Tphone ")
    List<Map<String, Object>> getTeacherInfo();

    @Insert("INSERT INTO CZ_Teachers (Tno, Tname, Tsex, Tage, Tjobtitle, Tphone) " +
            "VALUES (#{Tno}, #{Tname}, #{Tsex}, #{Tage}, #{Tjobtitle}, #{Tphone})")
    int insertTeacher(String Tno,String Tname,String Tsex,Integer Tage,String Tjobtitle,String Tphone);

    @Select("SELECT m.Mno,m.Mname,COUNT(cls.Clsno) as cls_count " +
            "FROM CZ_Major m, CZ_Class cls " +
            "WHERE m.Mno = cls.Mno " +
            "GROUP BY m.Mno,m.Mname")
    List<Map<String, Object>> getMajorInfo();

    @Insert("INSERT INTO CZ_Major (Mno, Mname) " +
            "VALUES (#{Mno}, #{Mname})")
    int insertMajor(String Mno,String Mname);

    @Select("SELECT cls.Clsno,cls.Clsname,m.Mname,COUNT(s.sno) as stu_count " +
            "FROM CZ_Major m, CZ_Class cls,CZ_Students s " +
            "WHERE m.Mno = cls.Mno " +
            "AND s.Clsno = cls.Clsno " +
            "GROUP BY cls.Clsno,cls.Clsname,m.Mname")
    List<Map<String, Object>> getClassInfo();

    @Insert("INSERT INTO CZ_Class (Clsno, Clsname, Mno) " +
            "VALUES (#{Clsno}, #{Clsname}, #{Mno})")
    int insertClass(String Clsno,String Clsname,String Mno);

    @Select("SELECT * FROM CZ_Courses")
    List<Map<String, Object>> getCourseInfo();

    @Insert("INSERT INTO CZ_Courses (Cno, Cname, Cterm, Cduration, Casmtd, Ccredits, Tname) " +
            "VALUES (#{Cno}, #{Cname}, #{Cterm}, #{Cduration}, #{Casmtd}, #{Ccredits}, #{Tame})")
    int insertCourse(String Cno,String Cname,String Cterm,Integer Cduration,String Casmtd,float Ccredits,String Tame);

    @Select("SELECT s.Sno,s.Sname,c.Cname,c.Cterm,score,c.Tname " +
            "FROM CZ_Reports r, CZ_Courses c,CZ_Students s " +
            "WHERE r.Cno = c.Cno " +
            "AND s.Sno = r.Sno")
    List<Map<String, Object>> getReportInfo();

    @Insert("INSERT INTO CZ_Reports(Sno,Cno,term,score,Tname) " +
            "VALUES(#{Sno} , #{Cno}, #{term}, #{score}, #{Tname}) ")
    int insertReport(String Sno,String Cno,String term,Integer score,String Tname);

    @Update("UPDATE CZ_Admin_account SET Admpwd = #{newPassword} WHERE Admno = #{Admno}")
    int updateAdminPassword(@Param("Admno") String Admno, @Param("newPassword") String newPassword);
}
