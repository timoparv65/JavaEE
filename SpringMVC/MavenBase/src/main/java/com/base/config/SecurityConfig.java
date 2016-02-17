/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.base.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@ComponentScan("com.base.service") /* muuta paketin nimi viittaamaan oikeaan paikkaan. Löydän userDetailsService:en tästä paketista */
@EnableWebSecurity/* Nämä 3 annotaatiota oltava ennen SecurityConfig-luokan määritystä */
/**
 *
 * @author student
 */
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    
    @Autowired
    @Qualifier(value="userDetailsService")
    UserDetailsService userDetailsService;
    
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);// hakee tietokannasta tiedot ja verifioi, lataa roolit automaattisesti
    }
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
            //http.headers().cacheControl().disable();
            //http.headers().defaultsDisabled();
        System.out.println("CONFIGURE HTTPSEQURITY");
            http.authorizeRequests().antMatchers("/").permitAll()//kaikki voi mennä root-kontekstiin
            .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")//sivuille pääsee roolilla ROLE_ADMIN
            .antMatchers("/teacher/**").access("hasRole('ROLE_TEACHER') or hasRole('ROLE_ADMIN')")//sivuille techer pääsee opettajat ja administraattori
            .antMatchers("/student/**").access("hasRole('ROLE_STUDENT') or hasRole('ROLE_ADMIN')")//sivuille student pääsee opiskelijat ja administraattori
            .and().formLogin()//menee login-formin kautta
            .defaultSuccessUrl("/admin/second")//mennään onnistuneen loggautumisen jälkeen
            .loginPage("/login").failureUrl("/login/error")//menee tähän kontekstiin epäonnistuneen loggautumisen jälkeen
            .usernameParameter("username")//nimet username ja password mätsää index.jsp:ssä oleviin kenttään ja lukee ne formista
            .passwordParameter("password").and()
            .logout().logoutSuccessUrl("/login?logout")
            .and().csrf()//lisätään csrf token
            .and().exceptionHandling().accessDeniedPage("/403");//jos käyttäjän yrittää mennä sivuille, johon hänellä ei ole oikeuksia
    }
}
