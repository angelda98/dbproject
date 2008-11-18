package com.beans.member;

import com.beans.etc.*;

public class Member {
	String id;
	String pass;
	String name;
	String birth;
	String jumin;
	String email;
	String email1;
	String email2;
	String zipcode;
	String addr;
	String addr1;
	String mobile;
	String mobile1;
	String mobile2;
	String phone;
	String phone1;
	String phone2;
	String homepage;
	String job;
	String description;
	
	public Member() {
	}
	
	public void setId(String id){
		this.id = id;
	}
	
	public void setPass(String pass){
		this.pass = pass;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public void setBirth(String birth){
		this.birth = birth;
	}
	
	public void setJumin(String jumin){
		this.jumin = jumin;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public void setEmail1(String email1){
		this.email1 = email1;
	}
	
	public void setEmail2(String email2){
		this.email2 = email2;
	}
	
	public void setZipcode(String zipcode){
		this.zipcode = zipcode;
	}
	
	public void setAddr(String addr){
		this.addr = addr;
	}
	
	public void setAddr1(String addr1){
		this.addr1 = addr1;
	}
	
	public void setMobile(String mobile){
		this.mobile = mobile;
	}
	
	public void setMobile1(String mobile1){
		this.mobile1 = mobile1;
	}
	
	public void setMobile2(String mobile2){
		this.mobile2 = mobile2;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	
	public void setPhone1(String phone1){
		this.phone1 = phone1;
	}
	
	public void setPhone2(String phone2){
		this.phone2 = phone2;
	}
	
	public void setHomepage(String homepage){
		this.homepage = homepage;
	}
	
	public void setJob(String job){
		this.job = job;
	}
	
	public void setDescription(String description){
		this.description = description;
	}
	
	public void Comb(){
		 if(email1.equals("00")){
			 email = email +"@"+ email2;
		 }
		 else{
			 email = email + "@" + email1;
		 }
		 
		 phone = phone + phone1 + phone2;
		 mobile = mobile + mobile1 + mobile2;
	}
	
	
	public String getId(){
		return id;
	}
	
	public String getPass(){
		return pass;
	}
	
	public String getName(boolean han_yn){
		if(name == null)return "";
		else{
			if(han_yn){
				return Utility.getHan(name);
			}
			else return name;
		}
	}
	
	public String getBirth(){
		return birth;
	}
	
	public String getJumin(){
		return jumin;
	}
	
	public String getEmail(){
		return email;
	}
	
	public String getZipcode(){
		return zipcode;
	}
	
	public String getMobile(){
		return mobile;
	}
	
	public String getPhone(){
		return phone;
	}
	
	public String getAddr(boolean han_yn){
		if(addr==null)return "";
		else{
			if(han_yn){
				return Utility.getHan(addr);
			}
			else{
				return addr;
			}
		}
	}
	
	public String getAddr1(boolean han_yn){
		if(addr1==null)return "";
		else{
			if(han_yn){
				return Utility.getHan(addr1);
			}
			else{
				return addr1;
			}
		}
	}
	
	public String getHomepage(boolean han_yn){
		if(homepage==null)return "";
		else{
			if(han_yn){
				return Utility.getHan(homepage);
			}
			else{
				return homepage;
			}
		}
	}
	
	public String getJob(boolean han_yn){
		if(job==null)return "";
		else{
			if(han_yn){
				return Utility.getHan(job);
			}
			else{
				return job;
			}
		}
	}
	
	public String getDescription(boolean han_yn){
		if(description==null)return "";
		else{
			if(han_yn){
				return Utility.getHan(description);
			}
			else{
				return description;
			}
		}
	}
}
