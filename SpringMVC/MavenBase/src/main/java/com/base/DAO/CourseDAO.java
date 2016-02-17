/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.base.DAO;

import com.base.models.Course;
import com.base.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author student
 */
public class CourseDAO {
    
    public static void addCourse(Course cour) throws Exception{
        
        // Create session to our database
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        //Because we are writing to database we need transaction beside session
        // => Transaktio huolehtii että kaikki menee tietokantaan. Huolehtii tietokannan eheyden.
        // Jos jokin menee pieleen kirjoitettaessa ja kaikki ei mene perille, niin
        // tietokantaan jo kirjoitettu poistetaan
        Transaction transaction = session.beginTransaction();
        
        //Add course to databse
        System.out.println("Save course info to db");
        session.save(cour);
        
        // Tekee SQL-queryn
        // insert into teacher (name,address,..) values ("markus","rautatienkatu",...)
        
        // End transaction
        transaction.commit();
        
        //Release session. Palautetaan sessio connection pooliin
        session.close();
    }
    
    public static List<Course> getAllCourses() throws Exception{
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Criteria criteria = session.createCriteria(Course.class);
        
        List<Course> lst = criteria.list();
        session.close();
        
        //Return list of courses
        return lst;
          
    }
    
    
}
