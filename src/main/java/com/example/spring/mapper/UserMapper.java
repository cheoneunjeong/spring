package com.example.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.GrantedAuthority;

import com.example.spring.domain.User;

@Mapper
public interface UserMapper {

	public void createUser(User user);

	public void createAuthority(User user);

	public User readUser(String username);

	public List<GrantedAuthority> readAuthorities(String username);

	public List<User> getuserlist(int page);

	public int getuserCount();

	public void setAuth1(String[] mids);

	public void setAuth0(String[] cids);

	public User getUser(String id);

	public void deleteAuth(String id);

}
