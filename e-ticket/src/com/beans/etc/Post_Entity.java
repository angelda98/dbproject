package com.beans.etc;

public class Post_Entity {

	private String zipcode;
  	private String sido;    
  	private String gugun; 
  	private String dong;
  	private String ri;
  	private String bunji;
  	
	//������ 
	public Post_Entity() {	}

	//setter method ======================================= 
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public void setSido(String sido) {	this.sido = sido;	}
	public void setGugun(String gugun) {this.gugun = gugun;	}
	public void setDong(String dong) {	this.dong = dong;	}
	public void setRi(String ri) {		this.ri = ri;		}
	public void setBunji(String bunji) {this.bunji = bunji;	}

	// getter method ======================================	
	public String getZipcode() { return this.zipcode;	}
	public String getSido( boolean han_yn ) { //����Ÿ�� �ѱ��� ���
		if(this.sido == null) { return "";	}
		else{
			if(han_yn){	return Utility.getHan(this.sido);}
			else{	 return this.sido;	}
		}
	}
	public String getGugun( boolean han_yn ) { 
		if(this.gugun == null) { return "";	}
		else{
			if(han_yn){	return Utility.getHan(this.gugun);}
			else{	 return this.gugun;	}
		}
	}
	public String getDong( boolean han_yn ) { 
		if(this.dong == null) { return "";	}
		else{
			if(han_yn){	return Utility.getHan(this.dong);}
			else{	 return this.dong;	}
		}
	}	
	public String getRi( boolean han_yn ) { 
		if(this.ri == null) { return "";	}
		else{
			if(han_yn){	return Utility.getHan(this.ri);}
			else{	 return this.ri;	}
		}
	}
	public String getBunji( boolean han_yn ) { 
		if(this.bunji == null) { return "";	}
		else{
			if(han_yn){	return Utility.getHan(this.bunji);}
			else{	 return this.bunji;	}
		}
	}
}