package com.ancintl.ancitics.domain;

public class Transport {
	
	private String express_name;
	private String express_code;
	private String car_type;
	private String truck_type;
	private String car_no;
	private String car_id;
	private String driver_name;
	private String driver_hp;
	private String status_yn;
	private String input_id;
	private String input_ip;
	private String input_comName;
	private String input_date;
	private String modi_id;
	private String modi_ip;
	private String modi_comName;
	private String modi_date;
	private String car_size;
	public String getExpress_name() {
		return express_name;
	}
	public void setExpress_name(String express_name) {
		this.express_name = express_name;
	}
	public String getExpress_code() {
		return express_code;
	}
	public void setExpress_code(String express_code) {
		this.express_code = express_code;
	}
	public String getCar_type() {
		return car_type;
	}
	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}
	public String getTruck_type() {
		return truck_type;
	}
	public void setTruck_type(String truck_type) {
		this.truck_type = truck_type;
	}
	public String getCar_no() {
		return car_no;
	}
	public void setCar_no(String car_no) {
		this.car_no = car_no;
	}
	public String getCar_id() {
		return car_id;
	}
	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}
	public String getDriver_name() {
		return driver_name;
	}
	public void setDriver_name(String driver_name) {
		this.driver_name = driver_name;
	}
	public String getDriver_hp() {
		return driver_hp;
	}
	public void setDriver_hp(String driver_hp) {
		this.driver_hp = driver_hp;
	}
	public String getStatus_yn() {
		return status_yn;
	}
	public void setStatus_yn(String status_yn) {
		this.status_yn = status_yn;
	}
	public String getInput_id() {
		return input_id;
	}
	public void setInput_id(String input_id) {
		this.input_id = input_id;
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
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	public String getModi_id() {
		return modi_id;
	}
	public void setModi_id(String modi_id) {
		this.modi_id = modi_id;
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
	public String getModi_date() {
		return modi_date;
	}
	public void setModi_date(String modi_date) {
		this.modi_date = modi_date;
	}
	public String getCar_size() {
		return car_size;
	}
	public void setCar_size(String car_size) {
		this.car_size = car_size;
	}
	
	@Override
	public String toString() {
		return "Transport [express_name=" + express_name + ", express_code=" + express_code + ", car_type=" + car_type
				+ ", truck_type=" + truck_type + ", car_no=" + car_no + ", car_id=" + car_id + ", driver_name="
				+ driver_name + ", driver_hp=" + driver_hp + ", status_yn=" + status_yn + ", input_id=" + input_id
				+ ", input_ip=" + input_ip + ", input_comName=" + input_comName + ", input_date=" + input_date
				+ ", modi_id=" + modi_id + ", modi_ip=" + modi_ip + ", modi_comName=" + modi_comName + ", modi_date="
				+ modi_date + ", car_size=" + car_size + "]";
	}
	
	

}
