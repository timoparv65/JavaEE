/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.opiframe.service;

import com.opiframe.DAO.UserDAO;
import com.opiframe.pojos.User;
import com.opiframe.pojos.UserRoles;
import java.util.HashSet;
import java.util.Set;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


@Service("userDetailsService")
public class MyUserDetailsService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(final String username) 
		throws UsernameNotFoundException {
	
		User user = UserDAO.findByUserName(username);
		Set<GrantedAuthority> authorities = 
                                      buildUserAuthority(user.getUserRoleses());

		return buildUserForAuthentication(user, authorities);
        }
        
	private UserDetails buildUserForAuthentication(User user, 
		Set<GrantedAuthority> authorities) {
		return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), 
			(user.getEnabled()!=0),true,true,true,authorities);
	}
        
	private Set<GrantedAuthority> buildUserAuthority(Set<UserRoles> userRoles) {

		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

		// Build user's authorities
		for (UserRoles userRole : userRoles) {
			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
		}

		Set<GrantedAuthority> Result = new HashSet<GrantedAuthority>(setAuths);

		return Result;
	}
		
	
}
