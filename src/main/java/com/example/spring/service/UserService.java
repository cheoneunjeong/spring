package com.example.spring.service;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.example.spring.domain.User;


public interface UserService extends UserDetailsService{

	public User readUser(String username);
	
	public void createUser(User user);
	
	public void createAuthorities(User user);
	
	Collection<GrantedAuthority> getAuthorities(String username);

	public List<User> getuserlist(int page);

	public int getuserCount();

	public void setAuth1(String[] mids);

	public void setAuth0(String[] cids);

	public User getUser(String id);

}
