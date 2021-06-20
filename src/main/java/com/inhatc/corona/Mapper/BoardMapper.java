package com.inhatc.corona.Mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.HashMap;

public interface BoardMapper {
    List<?> TodayList(String name) throws Exception;
    List<?> YesterdayList(String name) throws Exception;
    String getCount1(String name) throws Exception;
    String getCount2(String name) throws Exception;
    List<?> getCount() throws Exception;
    List<?> getVaccine(String name) throws Exception;
}
