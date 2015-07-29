package com._30.web.security.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com._30.common.util.MongoDBUtil;
import com._30.model.User;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

@Service
public class AccountServiceImpl implements UserDetailsService {

	private static final String AUTH_COLLECTION = "auth";

	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {

		User user = findUserByName(username);

		UserDetails userDetail = null;
		if (user != null) {
			userDetail = new org.springframework.security.core.userdetails.User(
					username, user.getPassWord(), true, true, true, true,
					findUserAuthorities(user));
		}

		return userDetail;
	}

	/**
	 * @param username
	 * @return
	 */
	private User findUserByName(String username) {
		DBCollection db = defaultDBCollection();

		DBObject query = new BasicDBObject();

		query.put("userName", username);
		db.setObjectClass(User.class);
		User user = (User) db.findOne(query);
		return user;
	}

	/**
	 * @return
	 */
	private DBCollection defaultDBCollection() {
		return MongoDBUtil.getDB().getCollection(AUTH_COLLECTION);
	}

	/**
	 * 获取用户的权限
	 * 
	 * @param user
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public Collection<GrantedAuthority> findUserAuthorities(User user) {
		List<GrantedAuthority> autthorities = new ArrayList<GrantedAuthority>();
		/*
		 * List<Role> roles = user.getRoles(); for (Role Role : roles) {
		 * autthorities.add(new GrantedAuthorityImpl(Role.getRoleCode())); }
		 */
		autthorities.add(new SimpleGrantedAuthority("admin"));
		return autthorities;
	}

}