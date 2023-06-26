package com.example.studentmanagementsystem.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

@Mapper
public interface teacherMapper {
    @Select("SELECT * " +
            " FROM CZ_Teachers" +
            " WHERE  Tno = CONCAT(#{Tno}, '') ")
    List<Map<String, Object>> getTeacherInfo(String Tno);

    @Select("SELECT Cname, Cterm, Casmtd, Ccredits, Cduration, COUNT(sno) AS sno_count " +
            "FROM CZ_Courses c, CZ_Class_Course cls, CZ_Students s,CZ_Teachers t " +
            "WHERE Cterm LIKE CONCAT(#{term}, '%') " +
            "  AND s.Clsno = cls.Clsno " +
            "  AND cls.Cno = c.Cno " +
            " AND t.Tname = c.Tname " +
            " AND t.Tno = CONCAT(#{tno}, '') " +
            "GROUP BY Cname, Cterm,  Casmtd, Ccredits, Cduration")
    List<Map<String, Object>> getTeacherCrs(String tno,String term);

    /*
    @Select("SELECT Cname, c.Cterm, Ccredits,Clsname, AVG(score) AS score_avg " +
            "FROM CZ_Courses c, CZ_Class_Course cls_c,CZ_Teachers t,CZ_Class cls,CZ_Reports r " +
            "WHERE Cterm LIKE CONCAT(#{term}, '%') " +
            "AND cls_c.clsno = cls.clsno " +
            "  AND cls_c.Cno = c.Cno " +
            " AND t.Tname = c.Tname " +
            " AND t.Tno = CONCAT(#{tno}, '') " +
            " AND r.cno = c.Cno " +
            "GROUP BY Cname, c.Cterm, Ccredits, Clsname ")
    List<Map<String, Object>> getTeacherRpt(String tno,String term);
    */
    @Select("SELECT c.Cname, c.Cterm, c.Ccredits, cls.Clsname, AVG(r.score) AS score_avg " +
            "FROM CZ_Courses c " +
            "JOIN CZ_Class_Course cls_c ON cls_c.Cno = c.Cno " +
            "JOIN CZ_Teachers t ON t.Tname = c.Tname " +
            "JOIN CZ_Reports r ON r.cno = c.Cno " +
            "JOIN CZ_Students s ON s.Sno = r.Sno " +
            "JOIN CZ_Class cls ON cls.clsno = s.clsno " +
            "WHERE c.Cterm LIKE CONCAT(#{term}, '%') " +
            "AND t.Tno = CONCAT(#{tno}, '') " +
            "GROUP BY c.Cname, c.Cterm, c.Ccredits, cls.Clsname")
    List<Map<String, Object>> getTeacherRpt(String tno, String term);


    @Update("UPDATE CZ_Teacher_account SET Tpwd = #{newPassword} WHERE Tno = #{tno}")
    int updateTeacherPassword(@Param("tno") String tno, @Param("newPassword") String newPassword);


}
