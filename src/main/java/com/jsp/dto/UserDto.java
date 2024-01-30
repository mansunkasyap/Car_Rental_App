package com.jsp.dto;

import com.mysql.cj.jdbc.Blob;

public class UserDto {
	String username	= null;
	String password = null;
	String gender	= null;
	Long   mobile   = null;
	String address  = null;
	String reg_as   = null;
	Blob pic      	= null;
	
	
	
	
	
	@Override
	public String toString() {
		return "UserDto [username=" + username + ", password=" + password + ", gender=" + gender + ", mobile=" + mobile
				+ ", address=" + address + ", reg_as=" + reg_as + ", pic=" + pic + "]";
	}
	public String getUsername() {
		return username;
	} 
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Long getMobile() {
		return mobile;
	} 
	public void setMobile(Long mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getReg_as() {
		return reg_as;
	}
	public void setReg_as(String reg_as) {
		this.reg_as = reg_as;
	}
	public Blob getPic() {
		return pic;
	}  
	public void setPic(java.sql.Blob blob) {
		this.pic = (Blob) blob;
	}
}
