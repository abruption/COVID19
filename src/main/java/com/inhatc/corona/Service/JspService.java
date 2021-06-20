package com.inhatc.corona.Service;

import com.inhatc.corona.Mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class JspService {

    @Autowired
    BoardMapper boardMapper;


    public List<?> TodayList(String name) throws Exception {
        return boardMapper.TodayList(name);
    }

    public List<?> YesterdayList(String name) throws Exception {
        return boardMapper.YesterdayList(name);
    }

    public List<?> getCount() throws Exception{
        return boardMapper.getCount();
    }

    public List<?> getVaccine(String name) throws Exception{
        return boardMapper.getVaccine(name);
    }


    public String getCount1(String name) throws Exception{
        return boardMapper.getCount1(name);
    }

    public String getCount2(String name) throws Exception{
        return boardMapper.getCount2(name);
    }
}
