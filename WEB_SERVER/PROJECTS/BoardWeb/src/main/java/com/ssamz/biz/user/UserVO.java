package com.ssamz.biz.user;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import lombok.Data;

@Data
public class UserVO implements HttpSessionBindingListener {

	// private 멤버 변수 선언
	private String id;
	private String password;
	private String name;
	private String role;

	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		// HttpSessionBindingListener.super.valueBound(event);
		System.out.println("---> UserVO 객체가 세션에 등록됨");
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		// HttpSessionBindingListener.super.valueUnbound(event);
		System.out.println("---> UserVO 객체가 세션에서 제거됨");
	}

	/*
	 * // Getter/Setter 메소드 public String getId() { return id; } public void
	 * setId(String id) { this.id = id; } public String getPassword() { return
	 * password; } public void setPassword(String password) { this.password =
	 * password; } public String getName() { return name; } public void
	 * setName(String name) { this.name = name; } public String getRole() { return
	 * role; } public void setRole(String role) { this.role = role; }
	 * 
	 * // toString 메소드
	 * 
	 * @Override public String toString() { // TODO Auto-generated method stub
	 * //return super.toString(); return "UserVO [id="+ id + ", password=" +
	 * password + ", name=" + name + ", role=" + role + "]"; }
	 */

}
