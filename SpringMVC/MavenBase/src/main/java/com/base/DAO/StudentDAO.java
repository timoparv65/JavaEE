/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.base.DAO;

import com.base.models.Students;
import com.base.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author student
 */
public class StudentDAO {
    
    public static void addStudent(Students stud) throws Exception{
        
        // Create session to our database
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        //Because we are writing to database we need transaction beside session
        // => Transaktio huolehtii että kaikki menee tietokantaan. Huolehtii tietokannan eheyden.
        // Jos jokin menee pieleen kirjoitettaessa ja kaikki ei mene perille, niin
        // tietokantaan jo kirjoitettu poistetaan
        Transaction transaction = session.beginTransaction();
        
        //Add techer to databse
        System.out.println("Save student info to db");
        session.save(stud);
        
        // Tekee SQL-queryn
        // insert into teacher (name,address,..) values ("markus","rautatienkatu",...)
        
        // End transaction
        transaction.commit();
        
        //Release session. Palautetaan sessio connection pooliin
        session.close();
    }
    
    public static List<Students> getStudents() throws Exception{
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        //Use hql query language here. NOT SQL !
        // Teachers => luokan nimi
        Query query = session.createQuery("from Students");
        //Make the query to the database
        List<Students> lst = query.list();
        session.close();
        //Return list of students
        return lst;
    }
    
}
