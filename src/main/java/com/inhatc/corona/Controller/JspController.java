package com.inhatc.corona.Controller;

import com.inhatc.corona.Service.JspService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.Locale;
import java.util.*;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

@Controller
public class JspController {
    @Autowired
    JspService jspService;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    String today = sdf.format(new Date());

    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
    String dayTime = sdf2.format(new Date()) + " 00:00:00";

    int temp = Integer.parseInt(sdf.format(new Date())) - 1;
    int tmp = Integer.parseInt(sdf.format(new Date())) - 2;
    String yesterday = Integer.toString(temp);
    //    String yesterday = "20210531";

    @CrossOrigin("*")
    @RequestMapping("index.do")
    public String main(Model model){
        try{
            List<?> TodayList = jspService.TodayList(today);
            List<?> YesterdayList = jspService.YesterdayList(yesterday);
            List<?> getVaccine = jspService.getVaccine(dayTime);
            List<?> getCount = jspService.getCount();
            model.addAttribute("TodayList", TodayList);
            model.addAttribute("YesterdayList", YesterdayList);
            model.addAttribute("getVaccine", getVaccine);
            model.addAttribute("getCount", getCount);
        } catch (Exception e){
            e.printStackTrace();
        }
        return "main";
    }


    @CrossOrigin("*")
    @RequestMapping("Developer")
    public String Developer(){
        return "Developer";
    }

    @CrossOrigin("*")
    @RequestMapping("relationSite")
    public String relationSite(){ return "relationSite"; }

    @CrossOrigin("*")
    @RequestMapping("Overseas")
    public String Overseas(){ return "Overseas"; }

    @CrossOrigin("*")
    @RequestMapping("/")
    public String index(){ return "redirect:/index.do"; }

}
