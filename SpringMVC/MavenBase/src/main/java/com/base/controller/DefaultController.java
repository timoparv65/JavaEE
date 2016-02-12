
package com.base.controller;

import com.base.DAO.TeacherDAO;
import com.base.models.Teachers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;// ModelMap paketissa org.springframework.ui
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// @Controller = annotaatio. Voi olla toteutettu luokkana
@Controller
public class DefaultController {
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String index(ModelMap map){//Modelmap on liima kontrollerin ja näkymän välillä
        // Define attributes you want to use in your template index.jsp
        map.addAttribute("name","Timo Parviainen");//lisätty 9.2.2016. Toinen argumentti on
        //tyyppiä objekti: eli String, List jne (mikä tahansa) => Object on geneerinen tyyppi
        return "index";// palauttaa näkymän Clientille
    }
    
    // lisätty 9.2.2016
    @RequestMapping(value="/second", method=RequestMethod.GET)
    public String second(ModelMap map){
        /*
        //10.2.2016: seuraava testausta varten
        Teachers s = new Teachers();
        s.setTName("Timo Parviainen");
        s.setTSubject("Programming");
        s.setEmail("timo_p45@yahoo.com");
        s.setPhone("040123456");
        try{
            TeacherDAO.addTeacher(s);
        }catch(Exception e){
            e.printStackTrace();
        }
        */
        
        // Lisätty 12.2.2016
        // Render second.jsp
        map.addAttribute("teacher",new Teachers());//luodaan instanssi Teachers-luokasta
        // "teacher" oltava yhteneväinen second.jsp määritellyssä modelAttribute="teacher" kanssa
        
        try{
            map.addAttribute("teachers",TeacherDAO.getTeachers());
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return "second"; // render second.jsp
    } 
    
    // lisätty 12.2.2016
    @RequestMapping(value="/teacher", method=RequestMethod.POST)
    public String addNewTeacher(@ModelAttribute("teacher") Teachers teach, ModelMap map){
        System.out.println(teach.getTName());
        
        try{
            TeacherDAO.addTeacher(teach);
            // kerrotaan second.jsp sivulla onnistuiko lisäys vai ei
            map.addAttribute("save_info","Teacher added succesfully!");
            map.addAttribute("teachers",TeacherDAO.getTeachers());
        }catch(Exception e){
            // kerrotaan second.jsp sivulla onnistuiko lisäys vai ei
            map.addAttribute("save_info","Database error!");
            e.printStackTrace();
        }
        
        
        return "second";
    }
    
}
