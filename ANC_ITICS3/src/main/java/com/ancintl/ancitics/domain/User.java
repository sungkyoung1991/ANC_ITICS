package com.ancintl.ancitics.domain;

public class User {
	
	private String user_id;
	private String user_pw;
	private String user_mail;
	private String user_name;
	private String user_auth;
	private String user_hp;
	private String user_tel;
	
	private String company_name;
	private String company_code;
	private String company_license;
	private String company_type;
	
	private String gps_url;
	private String gps_id;
	private String gps_pw;
	
	private String input_id;
	private String input_date;
	private String input_ip;
	private String input_comName;

	private String modi_id;
	private String modi_date;
	private String modi_ip;
	private String modi_comName;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}
	public String getUser_hp() {
		return user_hp;
	}
	public void setUser_hp(String user_hp) {
		this.user_hp = user_hp;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_code() {
		return company_code;
	}
	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}
	public String getCompany_license() {
		return company_license;
	}
	public void setCompany_license(String company_license) {
		this.company_license = company_license;
	}
	public String getCompany_type() {
		return company_type;
	}
	public void setCompany_type(String company_type) {
		this.company_type = company_type;
	}
	public String getGps_url() {
		return gps_url;
	}
	public void setGps_url(String gps_url) {
		this.gps_url = gps_url;
	}
	public String getGps_id() {
		return gps_id;
	}
	public void setGps_id(String gps_id) {
		this.gps_id = gps_id;
	}
	public String getGps_pw() {
		return gps_pw;
	}
	public void setGps_pw(String gps_pw) {
		this.gps_pw = gps_pw;
	}
	public String getInput_id() {
		return input_id;
	}
	public void setInput_id(String input_id) {
		this.input_id = input_id;
	}
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	public String getInput_ip() {
		return input_ip;
	}
	public void setInput_ip(String input_ip) {
		this.input_ip = input_ip;
	}
	public String getInput_comName() {
		return input_comName;
	}
	public void setInput_comName(String input_comName) {
		this.input_comName = input_comName;
	}
	public String getModi_id() {
		return modi_id;
	}
	public void setModi_id(String modi_id) {
		this.modi_id = modi_id;
	}
	public String getModi_date() {
		return modi_date;
	}
	public void setModi_date(String modi_date) {
		this.modi_date = modi_date;
	}
	public String getModi_ip() {
		return modi_ip;
	}
	public void setModi_ip(String modi_ip) {
		this.modi_ip = modi_ip;
	}
	public String getModi_comName() {
		return modi_comName;
	}
	public void setModi_comName(String modi_comName) {
		this.modi_comName = modi_comName;
	}
	
	
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_pw=" + user_pw + ", user_mail=" + user_mail + ", user_name="
				+ user_name + ", user_auth=" + user_auth + ", user_hp=" + user_hp + ", user_tel=" + user_tel
				+ ", company_name=" + company_name + ", company_code=" + company_code + ", company_license="
				+ company_license + ", company_type=" + company_type + ", gps_url=" + gps_url + ", gps_id=" + gps_id
				+ ", gps_pw=" + gps_pw + ", input_id=" + input_id + ", input_date=" + input_date + ", input_ip="
				+ input_ip + ", input_comName=" + input_comName + ", modi_id=" + modi_id + ", modi_date=" + modi_date
				+ ", modi_ip=" + modi_ip + ", modi_comName=" + modi_comName + "]";
	}
		
}
