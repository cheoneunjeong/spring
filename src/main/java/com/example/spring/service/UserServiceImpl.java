package com.example.spring.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.spring.domain.User;
import com.example.spring.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		User user = userMapper.readUser(username);
	    user.setAuthorities(getAuthorities(username));
	      
	    return user;
	}

	@Override
	public User readUser(String username) {
		 return userMapper.readUser(username);
	}

	@Override
	public void createUser(User user) {
		userMapper.createUser(user);
	}

	@Override
	public void createAuthorities(User user) {
		userMapper.createAuthority(user);
	}

	@Override
	public Collection<GrantedAuthority> getAuthorities(String username) {
		
		List<GrantedAuthority> authorities = userMapper.readAuthorities(username);
	    
		return authorities;
	}

	@Override
	public List<User> getuserlist(int page) {
		return userMapper.getuserlist(page);
	}

	@Override
	public int getuserCount() {
		return userMapper.getuserCount();
	}

	@Override
	public void setAuth1(String[] mids) {
		userMapper.setAuth1(mids);
		
	}

	@Override
	public void setAuth0(String[] cids) {
		userMapper.setAuth0(cids);
		
	}

	@Override
	public User getUser(String id) {
		return userMapper.getUser(id);
	}

	@Override
	public void deleteAuth(String id) {
		userMapper.deleteAuth(id);
		
	}
}