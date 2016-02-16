/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.base.controller;


import com.base.DAO.StudentDAO;
import com.base.models.Students;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author student
 */
@Controller// jotta tunnistaa että tämä on kontrolleri
public class StudentController {
    
    @RequestMapping(value="/admin/student", method=RequestMethod.GET)
    public String renderStudent(ModelMap map){
        
        map.addAttribute("isLogged",true);
        map.addAttribute("addStudPage",false);
        
        map.addAttribute("student",new Students());
        
        try{
            map.addAttribute("students",StudentDAO.getStudents());
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return "student";
    }
    
    
    @RequestMapping(value="/admin/student", method=RequestMethod.POST)
    public String addNewStudent(@ModelAttribute("student") Students stud, ModelMap map){
        
        map.addAttribute("isLogged",true);
        map.addAttribute("addStudPage",false);
        
        System.out.println(stud.getSName());
        
        try{
            StudentDAO.addStudent(stud);
            map.addAttribute("save_info","Student added succesfully!");
            map.addAttribute("students",StudentDAO.getStudents());
        }catch(Exception e){
            // kerrotaan second.jsp sivulla onnistuiko lisäys vai ei
            map.addAttribute("save_info","Database error!");
            e.printStackTrace();
        }
        
        
        return "student";
    }
    
}
