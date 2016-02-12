/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.base.DAO;

import com.base.util.HibernateUtil;
import com.base.models.Teachers;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * This class is for making CRUD operations to teacher table
 * in out database
 * @author student
 */
public class TeacherDAO {
    
    //10.2.2016 Lisätty itse:
    
    /**
     * This method adds new teacher into database
     * @param teach
     * @throws java.lang.Exception
     */
    public static void addTeacher(Teachers teach) throws Exception{
        //Exception = geneerisiin poikkeustyyppi
        // Teachers => com.base.models/Teachers.java
        
        // Create session to our database
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        //Because we are writing to database we need transaction beside session
        // => Transaktio huolehtii että kaikki menee tietokantaan. Huolehtii tietokannan eheyden.
        // Jos jokin menee pieleen kirjoitettaessa ja kaikki ei mene perille, niin
        // tietokantaan jo kirjoitettu poistetaan
        Transaction transaction = session.beginTransaction();
        
        //Add techer to databse
        System.out.println("Save Teacher info to db");
        session.save(teach);
        
        // Tekee SQL-queryn
        // insert into teacher (name,address,..) values ("markus","rautatienkatu",...)
        
        // End transaction
        transaction.commit();
        
        //Release session. Palautetaan sessio connection pooliin
        session.close();
    }
    
    public static List<Teachers> getTeachers() throws Exception{
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        //Use hql query language here. NOT SQL !
        // Teachers => luokan nimi
        Query query = session.createQuery("from Teachers");
        //Make the query to the database
        List<Teachers> lst = query.list();
        session.close();
        //Return list of teachers
        return lst;
    }
    
}
